import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:product_listing_app/view/otp_screen/view/otp_screeen.dart';

import '../../../api_services/api_services.dart';
import '../model/login_model.dart';

class LoginController extends GetxController {
  TextEditingController mobileNumberController = TextEditingController();

  RxBool isLoading = false.obs;
  RxBool isError = false.obs;
  RxString currentOtp = ''.obs;
  VerifyUserModel? verifyUserModel;

  verifyUser() async {
    try {
      isLoading.value = true;
      verifyUserModel = await ApiServices.verifyUser(body: {
        "phone_number": mobileNumberController.text,
      });

      Get.to(() => OtpScreen(
            verifyUserModel: verifyUserModel!,
            mobileNumber: mobileNumberController.text,
          ));
    } catch (e) {
      isError.value = true;
    } finally {
      isLoading.value = false;
    }
  }
}

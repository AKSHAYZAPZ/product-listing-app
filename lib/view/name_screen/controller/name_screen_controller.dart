import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:product_listing_app/shared_preferences/shared_preferences.dart';
import 'package:product_listing_app/utils/common.dart';
import 'package:product_listing_app/utils/widgets/extracted_widgets.dart';
import 'package:product_listing_app/utils/widgets/user_data.dart';
import 'package:product_listing_app/view/name_screen/models/register_model.dart';

import '../../../api_services/api_services.dart';
import '../../Bottom_navigation/view/bottom_navigation_screen.dart';

class NameScreenController extends GetxController {
  TextEditingController nameTextController = TextEditingController();

  RxBool isLoading = false.obs;
  RegisterModel? registerModel;

  registerUser({required String phone}) async {
    try {
      isLoading.value = true;
      registerModel = await ApiServices.register(
          body: {"phone_number": phone, "first_name": nameTextController.text});
      accessToken = registerModel!.token!.access;
      CommonFunction.addDataToSharedPreferences(
          Common.token, registerModel!.token!.access);
      Get.offAll(() => const CustomBottomNavBar());
    } catch (e) {
      showToast(msg: 'Something went wrong');
    } finally {
      isLoading.value = false;
    }
  }
}

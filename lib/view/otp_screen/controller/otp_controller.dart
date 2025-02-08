import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:product_listing_app/api_services/api_services.dart';
import 'package:product_listing_app/shared_preferences/shared_preferences.dart';
import 'package:product_listing_app/utils/common.dart';
import 'package:product_listing_app/utils/widgets/extracted_widgets.dart';
import 'package:product_listing_app/utils/widgets/user_data.dart';
import 'package:product_listing_app/view/Bottom_navigation/view/bottom_navigation_screen.dart';
import 'package:product_listing_app/view/login_screen/model/login_model.dart';
import 'package:product_listing_app/view/name_screen/view/name_screen.dart';

class OtpController extends GetxController {
  final String mobileNumber;
  final VerifyUserModel verifyUserModel;

  OtpController({
    required this.verifyUserModel,
    required this.mobileNumber,
  });

  final List<TextEditingController> otpControllers =
      List.generate(4, (index) => TextEditingController());
  final List<FocusNode> focusNodes = List.generate(4, (index) => FocusNode());

  Rx<int> secondsRemaining = 120.obs;
  RxBool isLoading = false.obs;
  RxBool isError = false.obs;
  RxString currentOtp = ''.obs;

  Timer? _timer;

  void onOtpChanged(String value, int index) {
    if (value.isNotEmpty && index < otpControllers.length - 1) {
      Future.delayed(const Duration(milliseconds: 100), () {
        focusNodes[index + 1].requestFocus();
      });
    } else if (value.isEmpty && index > 0) {
      Future.delayed(const Duration(milliseconds: 100), () {
        focusNodes[index - 1].requestFocus();
      });
    }
  }

  void startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (secondsRemaining.value > 0) {
        secondsRemaining.value--;
      } else {
        timer.cancel();
      }
    });
  }

  void restartTimer() {
    secondsRemaining.value = 120;
    startTimer();
  }

  Future resendOtp() async {
    restartTimer();
    VerifyUserModel response = await ApiServices.verifyUser(body: {
      "phone_number": mobileNumber,
    });
    currentOtp.value = response.otp;
  }

  Future<void> verifyOtp() async {
    try {
      isLoading.value = true;

      String otp = otpControllers.map((controller) => controller.text).join();

      if (otp == currentOtp.value) {
        showToast(msg: 'OTP verified successfully');
        if (verifyUserModel.user) {
          accessToken = verifyUserModel.token!.access;
          CommonFunction.addDataToSharedPreferences(
              Common.token, verifyUserModel.token!.access);
          Get.offAll(() => const CustomBottomNavBar());
        } else {
          Get.to(() => NameScreen(phone: mobileNumber));
        }
      } else {
        showToast(msg: 'Incorrect OTP');
      }
    } catch (e) {
      isError.value = true;
    } finally {
      isLoading.value = false;
    }
  }

  @override
  void onClose() {
    for (var controller in otpControllers) {
      controller.dispose();
    }
    for (var node in focusNodes) {
      node.dispose();
    }
    _timer?.cancel();
    super.onClose();
  }

  @override
  void onInit() {
    startTimer();
    currentOtp.value = verifyUserModel.otp;
    super.onInit();
  }
}

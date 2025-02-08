import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:product_listing_app/utils/color_constants.dart';
import 'package:product_listing_app/utils/widgets/back_button.dart';
import 'package:product_listing_app/utils/widgets/common_button.dart';
import 'package:product_listing_app/view/login_screen/model/login_model.dart';
import 'package:product_listing_app/view/otp_screen/controller/otp_controller.dart';

import '../../../network_controller/nework_controller.dart';
import '../../../utils/widgets/otp_field.dart';

class OtpScreen extends StatelessWidget {
  OtpScreen(
      {super.key, required this.mobileNumber, required this.verifyUserModel});

  final VerifyUserModel verifyUserModel;
  final String mobileNumber;

  NetworkController networkController = Get.put(NetworkController());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (networkController.isConnected.value) {
        OtpController otpController = Get.put(OtpController(
          mobileNumber: mobileNumber,
          verifyUserModel: verifyUserModel,
        ));
        return Scaffold(
          backgroundColor: ColorConstant.white,
          body: SingleChildScrollView(
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    backButton(),
                    const SizedBox(
                      height: 30,
                    ),
                    const Text(
                      'OTP VERIFICATION',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: ColorConstant.black,
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        const Text(
                          'Enter the OTP sent to -',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: ColorConstant.black,
                          ),
                        ),
                        Text(
                          mobileNumber,
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                            color: ColorConstant.black,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        text: 'OTP is ',
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                          color: ColorConstant.black,
                        ),
                        children: [
                          TextSpan(
                            text: otpController.currentOtp.value,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                              color: ColorConstant.appBlue,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    OtpTextField(
                      controller: otpController.otpControllers,
                      focusNode: otpController.focusNodes,
                      onChanged: (value, index) {
                        otpController.onOtpChanged(value, index);
                      },
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "00:${otpController.secondsRemaining.value} sec",
                              style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: ColorConstant.textColor),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            RichText(
                              textAlign: TextAlign.center,
                              text: TextSpan(
                                text: 'Don’t receive code ? ',
                                style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: ColorConstant.black,
                                ),
                                children: [
                                  if (otpController.secondsRemaining.value == 0)
                                    WidgetSpan(
                                      child: InkWell(
                                        onTap: () {
                                          otpController.resendOtp();
                                        },
                                        child: const Text(
                                          'Re-send',
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w700,
                                            color: ColorConstant.lightGreen,
                                          ),
                                        ),
                                      ),
                                    ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    CommonButton(
                        isLoading: otpController.isLoading.value,
                        onPressed: () {
                          otpController.verifyOtp();
                        },
                        text: 'Submit'),
                  ],
                ),
              ),
            ),
          ),
        );
      } else {
        return networkController.noDataImage(context);
      }
    });
  }
}

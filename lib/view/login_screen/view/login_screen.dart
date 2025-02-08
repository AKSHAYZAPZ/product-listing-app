import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:product_listing_app/utils/color_constants.dart';
import 'package:product_listing_app/utils/widgets/app_textfield.dart';
import 'package:product_listing_app/utils/widgets/common_button.dart';
import 'package:product_listing_app/view/login_screen/controller/login_controller.dart';

import '../../../network_controller/nework_controller.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  NetworkController networkController = Get.put(NetworkController());
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Obx(() {
      if (networkController.isConnected.value) {
        LoginController loginController = Get.put(LoginController());

        return Scaffold(
          backgroundColor: ColorConstant.white,
          appBar: AppBar(
            scrolledUnderElevation: 0,
            backgroundColor: ColorConstant.white,
            elevation: 0,
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 60),
                    const Text(
                      'Login',
                      style: TextStyle(
                        fontSize: 35,
                        fontWeight: FontWeight.w700,
                        color: ColorConstant.black,
                      ),
                    ),
                    const SizedBox(height: 5),
                    const Text(
                      'Let’s Connect with Lorem Ipsum..!',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: ColorConstant.black,
                      ),
                    ),
                    const SizedBox(height: 40),
                    Row(
                      children: [
                        SizedBox(
                          width: 50,
                          child: TextField(
                            keyboardType: TextInputType.phone,
                            textAlign: TextAlign.center, // Centers the text
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              color: ColorConstant.black,
                            ),
                            decoration: InputDecoration(
                              hintText: '+91',
                              hintStyle: const TextStyle(
                                color: ColorConstant.textColor,
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                              ),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color:
                                        ColorConstant.black.withOpacity(0.10)),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: ColorConstant.black.withOpacity(0.10),
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: AppTextField(
                            controller: loginController.mobileNumberController,
                            hintText: 'Enter Phone',
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter a mobile number';
                              } else if (!RegExp(r'^[0-9]{10}$')
                                  .hasMatch(value)) {
                                return 'Enter a valid 10-digit mobile number';
                              }
                              return null;
                            },
                            textInputType: TextInputType.number,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 30),
                    CommonButton(
                      isLoading: loginController.isLoading.value,
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          loginController.verifyUser();
                        }
                      },
                      text: 'Continue',
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          child: RichText(
                            textAlign: TextAlign.center,
                            text: const TextSpan(
                              text: 'By Continuing you accepting the ',
                              style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.w300,
                                color: ColorConstant.black,
                              ),
                              children: [
                                TextSpan(
                                  text: 'Terms of Use &\n Privacy Policy',
                                  style: TextStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight.w400,
                                    color: ColorConstant.black,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
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

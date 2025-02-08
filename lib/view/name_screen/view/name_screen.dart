import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:product_listing_app/utils/color_constants.dart';
import 'package:product_listing_app/utils/widgets/app_textfield.dart';
import 'package:product_listing_app/utils/widgets/common_button.dart';
import 'package:product_listing_app/view/name_screen/controller/name_screen_controller.dart';

import '../../../network_controller/nework_controller.dart';
import '../../../utils/widgets/back_button.dart';

class NameScreen extends StatelessWidget {
  NameScreen({super.key, required this.phone});
  final String phone;
  NetworkController networkController = Get.put(NetworkController());
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (networkController.isConnected.value) {
        NameScreenController nameScreenController =
            Get.put(NameScreenController());
        return Scaffold(
          backgroundColor: ColorConstant.white,
          body: SingleChildScrollView(
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Form(
                  key: formKey,
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
                      AppTextField(
                        controller: nameScreenController.nameTextController,
                        hintText: 'Enter Full Name',
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return 'Please enter your name';
                          } else if (!RegExp(r'^[a-zA-Z\s]{2,}$')
                              .hasMatch(value)) {
                            return 'Enter a valid name (at least 2 letters)';
                          }
                          return null;
                        },
                        textInputType: TextInputType.name,
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      CommonButton(
                        isLoading: nameScreenController.isLoading.value,
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            nameScreenController.registerUser(phone: phone);
                          }
                        },
                        text: 'Submit',
                      )
                    ],
                  ),
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

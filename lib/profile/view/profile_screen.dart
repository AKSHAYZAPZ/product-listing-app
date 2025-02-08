import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../network_controller/nework_controller.dart';
import '../../../utils/color_constants.dart';
import '../../../utils/widgets/custom_text.dart';
import '../controller/profile_controller.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});
  NetworkController networkController = Get.put(NetworkController());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (networkController.isConnected.value) {
        ProfileController profileController = Get.put(ProfileController());
        return Scaffold(
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  const Text(
                    'My Profile',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: ColorConstant.textBlue,
                    ),
                  ),
                  profileController.isLoading.value
                      ? const Expanded(
                          child: Center(
                            child: CircularProgressIndicator(),
                          ),
                        )
                      : Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 40),
                            const HeeboFontText(
                              text: 'Name',
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: ColorConstant.textColor,
                            ),
                            const SizedBox(height: 15),
                            HeeboFontText(
                              text: profileController.profileModel!.name ?? '',
                              fontSize: 19,
                              fontWeight: FontWeight.bold,
                              color: ColorConstant.black,
                            ),
                            const SizedBox(height: 30),
                            const HeeboFontText(
                              text: 'Phone',
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: ColorConstant.textColor,
                            ),
                            const SizedBox(height: 15),
                            HeeboFontText(
                              text:
                                  profileController.profileModel!.phoneNumber ??
                                      '',
                              fontSize: 19,
                              fontWeight: FontWeight.bold,
                              color: ColorConstant.black,
                            ),
                          ],
                        ),
                ],
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

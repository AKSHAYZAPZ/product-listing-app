import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:product_listing_app/utils/color_constants.dart';
import 'package:product_listing_app/view/splash_screen/controller/splash_controller.dart';


import '../../../network_controller/nework_controller.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({super.key});

  NetworkController networkController = Get.put(NetworkController());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (networkController.isConnected.value) {
        SplashScreenController splashController =
            Get.put(SplashScreenController());
        return Scaffold(
          backgroundColor: ColorConstant.white,
          body: SafeArea(
            child: Center(
                child: SizedBox(
                    height: 50,
                    width: 125,
                    child: Image.asset('assets/images/Logo.png'))),
          ),
        );
      } else {
        return networkController.noDataImage(context);
      }
    });
  }
}

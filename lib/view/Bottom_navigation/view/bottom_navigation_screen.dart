import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:product_listing_app/utils/color_constants.dart';
import '../../../network_controller/nework_controller.dart';
import '../controller/bottom_navigation_controller.dart';
import 'bottom_navigation_bar.dart';

class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    final NetworkController networkController = Get.find<NetworkController>();

    return Scaffold(
        backgroundColor: ColorConstant.white,
        body: Obx(
          () {
            if (networkController.isConnected.value) {
              return Get.find<BottomNavigationController>().screens[
                  Get.find<BottomNavigationController>().selectedIndex.value];
            } else {
              return networkController.noDataImage(context);
            }
          },
        ),
        bottomNavigationBar: AnimatedBottomNavigationBar());
  }
}

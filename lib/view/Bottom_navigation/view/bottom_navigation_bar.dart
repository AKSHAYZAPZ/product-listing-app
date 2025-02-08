import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:product_listing_app/utils/color_constants.dart';
import '../controller/bottom_navigation_controller.dart';

class AnimatedBottomNavigationBar extends StatelessWidget {
  AnimatedBottomNavigationBar({super.key});
  BottomNavigationController controller = Get.put(BottomNavigationController());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        height: MediaQuery.of(context).size.height * 0.08,
        margin: const EdgeInsets.only(
        bottom: 20,right: 20,left: 20
        ),
        decoration: BoxDecoration(
          color: ColorConstant.white,
          boxShadow: [
            BoxShadow(
                color: ColorConstant.shadowColor.withOpacity(0.2),
                blurRadius: 3,
                spreadRadius: 3,
                offset: const Offset(1, 1))
          ],
          borderRadius: BorderRadius.circular(50),
        ),
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: List.generate(
            controller.navItems.length,
            (index) {
              final item = controller.navItems[index];
              final isSelected = controller.selectedIndex.value == index;

              return GestureDetector(
                onTap: () => controller.changeIndex(index),
                child: AnimatedContainer(
                  height: MediaQuery.of(context).size.height * 0.09,
                  duration: const Duration(milliseconds: 300),
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                  decoration: BoxDecoration(
                    color:
                        isSelected ? ColorConstant.appBlue : Colors.transparent,
                    borderRadius: BorderRadius.circular(35),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: Row(
                      children: [
                        Icon(
                          item['icon'],
                          color: isSelected
                              ? ColorConstant.white
                              : ColorConstant.iconColor,
                        ),
                        if (isSelected)
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Text(
                              item['label'],
                              style: const TextStyle(
                                color: ColorConstant.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

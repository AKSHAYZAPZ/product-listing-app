import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:product_listing_app/view/home_screen/view/home_screen.dart';

import '../../../profile/view/profile_screen.dart';
import '../../../wishlist/controller/wishlist_controller.dart';
import '../../../wishlist/view/wishlist_screen.dart';

class BottomNavigationController extends GetxController {
  Rx<int> selectedIndex = 0.obs;

  final List<Widget> screens = [
    HomeScreen(),
    WishlistScreen(),
    ProfileScreen()
  ];

  final List<Map<String, dynamic>> navItems = [
    {"icon": Icons.home, "label": "Home"},
    {"icon": Icons.favorite, "label": "Wishlist"},
    {"icon": Icons.person, "label": "Profile"},
  ];

  void changeIndex(int index) async {
    selectedIndex.value = index;
    if (selectedIndex.value == 1) {
      WishListController wishListController = Get.put(WishListController());
      await wishListController.getWishlist();
    }
  }
}

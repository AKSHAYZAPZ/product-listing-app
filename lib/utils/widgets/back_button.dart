import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:product_listing_app/utils/color_constants.dart';


Widget backButton({VoidCallback? onTap}) {
  return GestureDetector(
    onTap: onTap ?? () => Get.back(),
    child: Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(7),
        color: ColorConstant.white,
        boxShadow: [
          BoxShadow(
            color: ColorConstant.black.withOpacity(0.2),
            spreadRadius: 0,
            blurRadius: 11,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: const Padding(
        padding: EdgeInsets.all(8.0),
        child: Icon(Icons.arrow_back, color: ColorConstant.black),
      ),
    ),
  );
}

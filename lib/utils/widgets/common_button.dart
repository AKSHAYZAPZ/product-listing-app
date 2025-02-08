import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:product_listing_app/utils/color_constants.dart';

class CommonButton extends StatelessWidget {
  const CommonButton({
    super.key,
    required this.text,
    this.isLoading,
    this.backgroundColor,
    this.onPressed,
  });
  final String text;

  final bool? isLoading;
  final void Function()? onPressed;

  final Color? backgroundColor;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      //width: double.infinity,
      child: GestureDetector(
        onTap: (isLoading ?? false) ? null : onPressed,
        child: Center(
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 250),
            padding: const EdgeInsets.all(5),
            height: 48,
            width: (isLoading ?? false) ? 48 : Get.width,
            decoration: BoxDecoration(
              color: ColorConstant.appBlue,
              borderRadius:
                  BorderRadius.circular((isLoading ?? false) ? 55 : 10),
            ),
            child: Center(
              child: isLoading ?? false
                  ? const CircularProgressIndicator(
                      color: ColorConstant.white,
                    )
                  : Text(
                      text,
                      style: const TextStyle(
                          fontSize: 18,
                          color: ColorConstant.white,
                          fontWeight: FontWeight.bold),
                    ),
            ),
          ),
        ),
      ),
    );
  }
}

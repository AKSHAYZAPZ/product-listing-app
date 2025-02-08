import 'package:flutter/material.dart';
import 'package:product_listing_app/utils/color_constants.dart';

class AppShadowTextFormField extends StatelessWidget {
  final String? hint;
  final TextEditingController controller;
  final double? radius;
  final void Function(String)? onChanged;

  final Widget? suffixIcon;

  final double? width;
  const AppShadowTextFormField(
      {super.key,
      required this.controller,
      this.onChanged,
      this.hint,
      this.radius,
      this.suffixIcon,
      this.width});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.055,
      decoration: BoxDecoration(
        color: ColorConstant.white,
        boxShadow: [
          BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              blurRadius: 5,
              spreadRadius: 5,
              offset: const Offset(0, 0))
        ],
        borderRadius: BorderRadius.circular(radius ?? 15),
      ),
      child: Center(
        child: TextFormField(
          controller: controller,
          onChanged: onChanged,
          decoration: InputDecoration(
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 12, horizontal: 15),
              suffixIcon: suffixIcon,
              // isDense: true,
              hintStyle:
                  const TextStyle(fontSize: 15, color: ColorConstant.textColor),
              hintText: hint ?? "",
              iconColor: ColorConstant.textColor,
              border: InputBorder.none),
        ),
      ),
    );
  }
}

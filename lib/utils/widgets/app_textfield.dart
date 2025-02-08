import 'package:flutter/material.dart';

import '../color_constants.dart';

class AppTextField extends StatelessWidget {
  const AppTextField({
    super.key,
    this.hintText,
    required this.controller,
    this.validator,
    this.textInputType,
  });

  final String? hintText;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final TextInputType? textInputType;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: validator,
      controller: controller,
      keyboardType: textInputType,
      style: const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w500,
        color: ColorConstant.black,
      ),
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(
          color: ColorConstant.textColor,
          fontSize: 14,
          fontWeight: FontWeight.w400,
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: ColorConstant.black.withOpacity(0.10)),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: ColorConstant.black.withOpacity(0.10),
          ),
        ),
      ),
    );
  }
}

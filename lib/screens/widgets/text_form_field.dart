import 'package:flutter/material.dart';

import '../../utils/color.dart';

class InputFormField extends StatelessWidget {
  const InputFormField(
      {super.key,
      required this.label,
      this.controller,
      this.suffixIcon,
      this.validation,
      this.isSecure = false,
      this.autoCorrect = true,
      this.keyBoardType = TextInputType.text});

  final String label;
  final TextEditingController? controller;
  final Widget? suffixIcon;
  final bool isSecure;
  final bool autoCorrect;
  final TextInputType keyBoardType;
  final Function(String? value)? validation;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: (String? value) {
        if (validation != null) {
          return validation!(value);
        } else {
          return null;
        }
      },
      keyboardType: keyBoardType,
      autocorrect: autoCorrect,
      obscureText: isSecure,
      decoration: InputDecoration(
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.backgroundColor,
            width: 2.0
          )
        ),
          suffixIcon: suffixIcon,
          label: Text(
            label,
            style: const TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.w700,
                color: AppColors.shadowTextColor),
          )),
    );
  }
}

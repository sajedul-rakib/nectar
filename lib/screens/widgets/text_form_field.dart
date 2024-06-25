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
      this.keyBoardType = TextInputType.text,
      this.readOnly = false,
      this.maxLine = 1,
      this.borderColor = AppColors.backgroundColor,
      this.isBackgroundFilled = false,
      this.prefixIcon,
      this.onChanged});

  final String label;
  final TextEditingController? controller;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final bool isSecure;
  final bool autoCorrect;
  final bool readOnly;
  final int maxLine;
  final bool isBackgroundFilled;
  final Color borderColor;
  final TextInputType keyBoardType;
  final Function(String?)? onChanged;
  final Function(String? value)? validation;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      readOnly: readOnly,
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
      maxLines: maxLine,
      obscureText: isSecure,
      onChanged: onChanged,
      decoration: InputDecoration(
          filled: isBackgroundFilled,
          fillColor: AppColors.whiteColor,
          focusedErrorBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.failureRed, width: 2.0)),
          errorBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.failureRed, width: 2.0)),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: borderColor, width: 2.0)),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: borderColor, width: 2.0)),
          suffixIcon: suffixIcon,
          prefixIcon: prefixIcon,
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

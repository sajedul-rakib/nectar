import "package:flutter/material.dart";
import "package:nectar/utils/color.dart";

class AdminTextInput extends StatelessWidget {
  const AdminTextInput(
      {super.key,
      required this.label,
      this.maxLine = 1,
      this.prefixWidget,
      this.controller});

  final String label;
  final int maxLine;
  final Widget? prefixWidget;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      maxLines: maxLine,
      decoration: InputDecoration(
          suffix: prefixWidget,
          border: OutlineInputBorder(
              borderSide:
                  const BorderSide(width: 2.0, color: AppColors.blackColor),
              borderRadius: BorderRadius.circular(10)),
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

import 'package:flutter/material.dart';
import 'package:nectar/utils/color.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    super.key,
    required this.title,
    this.onPressed,
    this.backgroundColor,
  });

  final String title;
  final VoidCallback? onPressed;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ButtonStyle(
            backgroundColor: WidgetStatePropertyAll(backgroundColor)),
        onPressed: onPressed,
        child: Text(
          title,
          style: const TextStyle(color: AppColors.whiteColor),
        ));
  }
}

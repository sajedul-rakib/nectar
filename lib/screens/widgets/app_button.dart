import 'package:flutter/material.dart';
import 'package:nectar/utils/color.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    super.key,
    required this.title,
    this.onPressed,
  });

  final String title;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onPressed,
        child: Text(
          title,
          style: const TextStyle(color: AppColors.whiteColor),
        ));
  }
}

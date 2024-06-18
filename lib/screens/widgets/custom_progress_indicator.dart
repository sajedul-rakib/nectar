import 'package:flutter/material.dart';
import 'package:nectar/utils/color.dart';

class CustomProgressIndicator extends StatelessWidget {
  const CustomProgressIndicator({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(
        color: AppColors.backgroundColor,
        strokeAlign: 2.0,
      ),
    );
  }
}

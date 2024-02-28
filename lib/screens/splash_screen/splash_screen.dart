import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nectar/screens/splash_screen/controller.dart';
import 'package:nectar/utils/color.dart';

class SplashScreen extends GetView<SplashScreenController> {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(color: AppColors.backgroundColor),
        child: Center(
          child: Image.asset(
            'assets/images/logo.png',
            width: 250,
            fit: BoxFit.fitHeight,
          ),
        ),
      ),
    );
  }
}

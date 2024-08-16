import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nectar/utils/color.dart';

class SnackMessage {
  static void snackMessage({required String message}) {
    ScaffoldMessenger.of(Get.key.currentContext!).showSnackBar(SnackBar(
      content: Text(message),
      backgroundColor: AppColors.backgroundColor,
      duration: const Duration(seconds: 1),
    ));
  }
}

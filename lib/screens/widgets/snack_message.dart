import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SnackMessage {
  static void snackMessage({required String message}) {
    ScaffoldMessenger.of(Get.key.currentContext!).showSnackBar(SnackBar(
      content: Text(message),
      duration: const Duration(seconds: 1),
    ));
  }
}

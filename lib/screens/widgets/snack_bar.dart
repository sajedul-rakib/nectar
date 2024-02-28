import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nectar/utils/color.dart';

void snackBar({String? title, String? message, String? contentType}) {
  late IconData iconData;
  late Color color;

  switch (contentType) {
    case 'warning':
      {
        iconData = CupertinoIcons.exclamationmark_triangle;
        color = const Color(0xffEAB308);
        break;
      }
    case 'success':
      {
        iconData = CupertinoIcons.checkmark_seal;
        color = const Color(0xff15803D);
        break;
      }
    case 'fail':
      {
        iconData = CupertinoIcons.clear_circled;
        color = const Color(0xffDC2626);
        break;
      }
  }

  Get.showSnackbar(GetSnackBar(
    titleText: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Text(
              title.toString(),
              style: const TextStyle(
                  color: AppColors.whiteColor,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              width: 10,
            ),
            Icon(
              iconData,
              color: AppColors.whiteColor,
              size: 30.0,
            ),
          ],
        ),
        IconButton(
            onPressed: () => Get.back(),
            icon: const Icon(
              CupertinoIcons.clear_circled_solid,
              size: 32.0,
              color: AppColors.whiteColor,
            ))
      ],
    ),
    messageText: Text(
      message.toString(),
      style: const TextStyle(
          fontWeight: FontWeight.w600,
          color: AppColors.whiteColor,
          fontSize: 18.0),
    ),
    backgroundColor: color,
    snackPosition: SnackPosition.TOP,
    duration: const Duration(seconds: 4),
  ));
}

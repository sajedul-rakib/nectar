import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nectar/screens/admin/admin_screen/controller.dart';
import 'package:nectar/screens/widgets/app_button.dart';
import 'package:nectar/utils/color.dart';

class AddSliderScreen extends GetView<AdminScreenController> {
  const AddSliderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Add Slider",
          style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
              color: AppColors.whiteColor),
        ),
        centerTitle: true,
        backgroundColor: AppColors.backgroundColor,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Column(
              children: [
                GetBuilder<AdminScreenController>(builder: (controller) {
                  return Container(
                    margin: const EdgeInsets.all(10.0),
                    width: MediaQuery.of(context).size.width,
                    height: 300,
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: AppColors.shadowTextColor, width: 2.0),
                        borderRadius: BorderRadius.circular(10),
                        color: AppColors.shadowTextColor.withOpacity(.3)),
                    child: controller.slideImages != null
                        ? Image.file(File(controller.slideImages!.path))
                        : const Chip(label: Text("Add Slider Image")),
                  );
                }),
                AppButton(
                  title: "Add Slider",
                  onPressed: () {
                    controller.pickSlideImage();
                  },
                ),
              ],
            ),
            const Divider()
          ],
        ),
      ),
    );
  }
}

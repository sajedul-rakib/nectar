import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nectar/screens/user_details_screen/index.dart';
import 'package:nectar/screens/widgets/app_button.dart';
import 'package:nectar/screens/widgets/text_form_field.dart';
import 'package:nectar/utils/color.dart';

class UserDetailScreen extends GetView<UserDetailScreenController> {
  const UserDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text("My Details"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: Container(
                width: 250,
                height: 300,
                margin: EdgeInsets.zero,
                padding: EdgeInsets.zero,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: !(controller.userModel.profilePic != '' &&
                          controller.userModel.profilePic != null)
                      ? AppColors.chipColor
                      : null,
                ),
                child: (controller.userModel.profilePic != '' &&
                        controller.userModel.profilePic != null)
                    ? CircleAvatar(
                        child: ClipOval(
                          child: Image.network(""),
                        ),
                      )
                    : const Icon(
                        Icons.person,
                        size: 80,
                        color: AppColors.whiteColor,
                      ),
              ),
            ),
            AppButton(
                title: "Upload Profile",
                onPressed: () {
                  _pickProfilePic(context);
                }),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Column(
                children: [
                  InputFormField(
                    label: "Full name",
                    controller: controller.nameETController,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  InputFormField(
                    label: "Email",
                    readOnly: true,
                    controller: controller.emailETController,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  InputFormField(
                    label: "Phone Number",
                    controller: controller.phoneNumberETController,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  InputFormField(
                    label: "Delivery Address",
                    maxLine: 4,
                    controller: controller.addressETController,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                      width: 250,
                      height: 60,
                      child: AppButton(
                        title: "Edit",
                        onPressed: () {},
                      )),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  void _pickProfilePic(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: Container(
              width: 250,
              padding: const EdgeInsets.all(10.0),
              decoration: const BoxDecoration(
                  color: AppColors.whiteColor,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10))),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ListTile(
                    title: const Text("Gallery"),
                    leading: const Icon(Icons.image_rounded),
                    onTap: () async {
                      XFile? pickedImage = await ImagePicker()
                          .pickImage(source: ImageSource.gallery);
                      if (pickedImage != null && context.mounted) {
                        _previewProfilePic(context, pickedImage);
                      }
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ListTile(
                    title: const Text("Camera"),
                    leading: const Icon(Icons.camera),
                    onTap: () async {
                      XFile? pickedImage = await ImagePicker()
                          .pickImage(source: ImageSource.camera);
                      if (pickedImage != null && context.mounted) {
                        _previewProfilePic(context, pickedImage);
                      }
                    },
                  )
                ],
              ),
            ),
          );
        });
  }

  //preview profile pic
  void _previewProfilePic(BuildContext context, XFile profilePic) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.file(File(profilePic.path)),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AppButton(
                      title: "Back",
                      onPressed: () {
                        Get.back();
                        Get.back();
                      },
                      backgroundColor: AppColors.failureRed,
                    ),
                    AppButton(
                      title: "Upload",
                      backgroundColor: AppColors.successGreen,
                      onPressed: () async {
                        bool result =
                            await controller.uploadProfilePic(profilePic);
                        if (result) {
                          Get.back();
                          Get.back();
                        } else {
                          log("upload failed");
                        }
                      },
                    ),
                  ],
                )
              ],
            ),
          );
        });
  }
}

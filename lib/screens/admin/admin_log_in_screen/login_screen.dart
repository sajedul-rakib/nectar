import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nectar/screens/admin/admin_log_in_screen/index.dart';
import 'package:nectar/screens/widgets/app_button.dart';
import 'package:nectar/utils/color.dart';

import '../../widgets/text_form_field.dart';

class AdminLogInScreen extends GetView<AdminLogInScreenController> {
  const AdminLogInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset(
              'assets/images/color_logo_part.png',
              width: 200,
            ),
            Form(
              key: _formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Loging as Admin",
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 25.0,
                              color: Colors.black),
                        ),
                        const Text(
                          "Enter your email and password",
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 12.0,
                              color: AppColors.shadowTextColor),
                        ),
                        InputFormField(
                          label: 'Email',
                          controller: controller.emailETController,
                          validation: (value) {
                            if (value!.isEmpty) {
                              return "Enter your email";
                            } else {
                              return null;
                            }
                          },
                        ),
                        InputFormField(
                          label: 'Password',
                          controller: controller.passwordETController,
                          validation: (value) {
                            if (value!.isEmpty) {
                              return "Enter your password";
                            } else {
                              return null;
                            }
                          },
                          suffixIcon: CupertinoIcons.eye_slash,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const SizedBox(),
                            TextButton(
                                onPressed: () {},
                                child: const Text(
                                  "Forgot Password?",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.blackColor,
                                    fontSize: 16.0,
                                  ),
                                )),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Center(
                          child: SizedBox(
                              width: 300,
                              height: 50,
                              child: AppButton(
                                  title: "Admin Log In",
                                  onPressed: () {
                                    controller.logIn(
                                        email: controller.emailETController.text
                                            .trim(),
                                        password: controller
                                            .passwordETController.text);
                                  })),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nectar/routes/route_name.dart';
import 'package:nectar/screens/login_screen/controller.dart';
import 'package:nectar/screens/widgets/app_button.dart';
import 'package:nectar/utils/color.dart';

import '../widgets/text_form_field.dart';

class LoginScreen extends GetView<LoginScreenController> {
  const LoginScreen({super.key});

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
                          "Loging",
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
                          suffixIcon1: CupertinoIcons.eye_slash_fill,
                          suffixIcon2: CupertinoIcons.eye,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const SizedBox(),
                            TextButton(
                                onPressed: () {
                                  controller.gotoResetPasswordScreen();
                                },
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
                                  title: "Log In",
                                  onPressed: () {
                                    if (_formKey.currentState?.validate() ??
                                        true) {
                                      controller.logIn(
                                          email: controller
                                              .emailETController.text
                                              .trim(),
                                          password: controller
                                              .passwordETController.text);
                                    }
                                  })),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Center(
                          child: SizedBox(
                              width: 220,
                              height: 40,
                              child: AppButton(
                                  title: "Log in as Admin",
                                  onPressed: () {
                                    Get.toNamed(RouteName.ADMIN_VERIFY_SCREEN);
                                  })),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              "Don't have an account?",
                              style: TextStyle(
                                  fontSize: 16.0, fontWeight: FontWeight.w500),
                            ),
                            InkWell(
                              onTap: () {
                                Get.toNamed(RouteName.SIGNIN_SCREEN);
                              },
                              child: const Text(
                                "Sign Up",
                                style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 18.0,
                                    color: AppColors.backgroundColor),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 200,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                    onPressed: () {
                      Get.offAllNamed(RouteName.BOTTONAVIGATION_SCREEN);
                    },
                    child: const Text(
                      "Later>>",
                      style: TextStyle(
                          fontSize: 18.0,
                          color: AppColors.blackColor,
                          fontWeight: FontWeight.w600),
                    ))
              ],
            ),
          ],
        ),
      ),
    );
  }
}

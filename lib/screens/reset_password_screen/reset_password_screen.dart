import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nectar/screens/reset_password_screen/index.dart';
import 'package:nectar/screens/widgets/app_button.dart';
import 'package:nectar/screens/widgets/text_form_field.dart';
import 'package:nectar/utils/color.dart';

class ResetPasswordScreen extends GetView<ResetPasswordScreenController> {
  const ResetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 200,
                    ),
                    Center(
                        child:
                            Image.asset("assets/images/color_logo_part.png")),
                    const SizedBox(
                      height: 40,
                    ),
                    const Text(
                      "Reset Password",
                      style: TextStyle(
                        fontSize: 30.0,
                        color: AppColors.blackColor,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    const Text(
                      "For reset password enter your email",
                      style: TextStyle(
                          fontSize: 18.0,
                          color: AppColors.shadowTextColor,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                InputFormField(
                  label: "Email",
                  controller: controller.emailETController,
                  validation: (value) {
                    if (value!.isEmpty) {
                      return "Enter your password";
                    } else {
                      return null;
                    }
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: 250,
                  height: 50,
                  child: AppButton(
                    title: "Reset Password",
                    onPressed: () {
                      controller.resetPassword(
                          email: controller.emailETController.text.trim());
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

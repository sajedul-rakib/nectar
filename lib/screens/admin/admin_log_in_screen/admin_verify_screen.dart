import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nectar/routes/route_name.dart';
import 'package:nectar/screens/admin/admin_log_in_screen/controller.dart';
import 'package:nectar/screens/widgets/app_button.dart';
import 'package:nectar/screens/widgets/text_form_field.dart';
import 'package:nectar/utils/color.dart';

class AdminVerifyScreen extends GetView<AdminLogInScreenController> {
  const AdminVerifyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 100,
            ),
            Image.asset(
              'assets/images/color_logo_part.png',
              fit: BoxFit.contain,
            ),
            const SizedBox(
              height: 100,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Admin Loging",
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 25.0,
                        color: Colors.black),
                  ),
                  const Text(
                    "For log in as admin give your verify token that given by nectar team",
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 12.0,
                        color: AppColors.shadowTextColor),
                  ),
                  InputFormField(
                    label: 'Verify token',
                    controller: controller.verifyTokenETController,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Center(
                    child: SizedBox(
                        width: 300,
                        height: 50,
                        child: AppButton(
                          title: "Verify",
                          onPressed: () async {
                            controller.verifyAdmin(
                                token: controller.verifyTokenETController.text
                                    .trim());
                          },
                        )),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Log in as customer?",
                        style: TextStyle(
                            fontSize: 16.0, fontWeight: FontWeight.w500),
                      ),
                      InkWell(
                        onTap: () {
                          Get.toNamed(RouteName.LOGIN_SCREEN);
                        },
                        child: const Text(
                          "Log In",
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
            ),
          ],
        ),
      )),
    );
  }
}

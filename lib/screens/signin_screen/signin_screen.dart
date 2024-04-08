import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nectar/routes/route_name.dart';
import 'package:nectar/screens/signin_screen/controller.dart';
import 'package:nectar/screens/widgets/app_button.dart';
import 'package:nectar/utils/color.dart';
import 'package:nectar/utils/responsive.dart';

import '../widgets/text_form_field.dart';

class SigninScreen extends GetView<SignInController> {
  const SigninScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: Responsive(
        mobile: MobileView(),
        desktop: TabletAndDesktopView(),
        tablet: TabletAndDesktopView(),
      ),
    );
  }
}

class MobileView extends GetView<SignInController> {
  const MobileView({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();

    return SingleChildScrollView(
      child: Column(
        children: [
          Image.asset(
            'assets/images/color_logo_part.png',
            width: 200,
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Sign Up",
                        style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 25.0,
                            color: Colors.black),
                      ),
                      const Text(
                        "Enter your credentials to continue",
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 12.0,
                            color: AppColors.shadowTextColor),
                      ),
                      InputFormField(
                        label: 'Full Name',
                        autoCorrect: false,
                        keyBoardType: TextInputType.name,
                        controller: controller.fullNameETController,
                        validation: (String? value) {
                          if (value!.isEmpty) {
                            return "Enter your full name";
                          } else {
                            return null;
                          }
                        },
                      ),
                      InputFormField(
                        label: 'Email',
                        controller: controller.emailETController,
                        autoCorrect: false,
                        keyBoardType: TextInputType.emailAddress,
                        validation: (String? value) {
                          if (value!.isEmpty) {
                            return "Enter your valid email";
                          } else {
                            return null;
                          }
                        },
                      ),
                      Obx(() => InputFormField(
                          label: 'Password',
                          controller: controller.passwordETController,
                          validation: (value) {
                            if (value!.isEmpty) {
                              return "Enter a strong password";
                            } else {
                              if (value.length < 6) {
                                return "Enter at least 6 conmbined character";
                              } else {
                                return null;
                              }
                            }
                          },
                          isSecure: controller.showPassword,
                          suffixIcon: InkWell(
                            onTap: () {
                              controller.isShowPassword();
                            },
                            child: Icon(controller.showPassword
                                ? CupertinoIcons.eye_slash
                                : CupertinoIcons.eye),
                          ))),
                      const SizedBox(
                        height: 5,
                      ),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "By continuing you agree to our Terms of Service\nand Privacy Policy.",
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: AppColors.blackColor,
                              fontSize: 14.0,
                            ),
                          ),
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
                              title: "Sign Up",
                              onPressed: () {
                                if (formKey.currentState?.validate() ?? true) {
                                  controller.signIn(
                                      fullName: controller
                                          .fullNameETController.text
                                          .trim(),
                                      email: controller.emailETController.text
                                          .trim(),
                                      password:
                                          controller.passwordETController.text);
                                }
                              },
                            )),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Already have an account?",
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
              )
            ],
          ),
        ],
      ),
    );
  }
}

class TabletAndDesktopView extends GetView<SignInController> {
  const TabletAndDesktopView({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();
    return Center(
      child: Container(
        width: 800,
        height: 800,
        decoration: BoxDecoration(
            color: AppColors.shadowColor,
            border: Border.all(width: 2.0, color: AppColors.shadowColor),
            borderRadius: BorderRadius.circular(10)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/color_logo_part.png',
              width: 200,
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Form(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Sign Up",
                          style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 25.0,
                              color: Colors.black),
                        ),
                        const Text(
                          "Enter your credentials to continue",
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 12.0,
                              color: AppColors.shadowTextColor),
                        ),
                        InputFormField(
                          label: 'Full Name',
                          autoCorrect: false,
                          keyBoardType: TextInputType.name,
                          controller: controller.fullNameETController,
                          validation: (String? value) {
                            if (value!.isEmpty) {
                              return "Enter your full name";
                            } else {
                              return null;
                            }
                          },
                        ),
                        InputFormField(
                          label: 'Email',
                          controller: controller.emailETController,
                          autoCorrect: false,
                          keyBoardType: TextInputType.emailAddress,
                          validation: (String? value) {
                            if (value!.isEmpty) {
                              return "Enter your valid email";
                            } else {
                              return null;
                            }
                          },
                        ),
                        Obx(() => InputFormField(
                            label: 'Password',
                            controller: controller.passwordETController,
                            validation: (value) {
                              if (value!.isEmpty) {
                                return "Enter a strong password";
                              } else {
                                if (value.length < 6) {
                                  return "Enter at least 6 conmbined character";
                                } else {
                                  return null;
                                }
                              }
                            },
                            isSecure: controller.showPassword,
                            suffixIcon: InkWell(
                              onTap: () {
                                controller.isShowPassword();
                              },
                              child: Icon(controller.showPassword
                                  ? CupertinoIcons.eye_slash
                                  : CupertinoIcons.eye),
                            ))),
                        const SizedBox(
                          height: 5,
                        ),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "By continuing you agree to our Terms of Service\nand Privacy Policy.",
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: AppColors.blackColor,
                                fontSize: 14.0,
                              ),
                            ),
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
                                title: "Sign Up",
                                onPressed: () {
                                  if (formKey.currentState?.validate() ??
                                      true) {
                                    controller.signIn(
                                        fullName: controller
                                            .fullNameETController.text
                                            .trim(),
                                        email: controller.emailETController.text
                                            .trim(),
                                        password: controller
                                            .passwordETController.text);
                                  }
                                },
                              )),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              "Already have an account?",
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
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

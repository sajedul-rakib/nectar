import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nectar/routes/route_name.dart';
import 'package:nectar/utils/color.dart';

import '../widgets/app_button.dart';

class OnbordingScreen extends StatelessWidget {
  const OnbordingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage(
                "assets/images/introduce_image.png",
              )),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 300,
              ),
              Image.asset('assets/images/logo_part.png'),
              const Text(
                "Welcome\nto out Store",
                style: TextStyle(
                  fontFamily: 'montserrat',
                  fontWeight: FontWeight.w600,
                  color: AppColors.whiteColor,
                  fontSize: 42.0,
                ),
                textAlign: TextAlign.center,
              ),
              const Text(
                "Get your groceries in as fast as one hour",
                style: TextStyle(
                  fontFamily: 'montserrat',
                  fontWeight: FontWeight.w400,
                  color: AppColors.whiteColor,
                  fontSize: 12.0,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                width: 300,
                height: 50,
                child: AppButton(
                  title: "Get Started",
                  onPressed: () {
                    Get.toNamed(RouteName.LOGIN_SCREEN);
                  },
                ),
              )
            ],
          ),
        ),
      )),
    );
  }
}

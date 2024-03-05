import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nectar/routes/route_name.dart';
import 'package:nectar/screens/widgets/app_button.dart';
import 'package:nectar/utils/color.dart';

class AdminScreen extends StatelessWidget {
  const AdminScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.backgroundColor,
        title: Image.asset(
          "assets/images/logo.png",
          width: 120,
          fit: BoxFit.contain,
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AppButton(
              title: "Add Product",
              onPressed: () => Get.toNamed(RouteName.ADD_PRODUCT_SCREEN),
            ),
            const SizedBox(
              height: 20,
            ),
            AppButton(
              title: "Add Slider",
              onPressed: () => Get.toNamed(RouteName.ADD_SLIDER_SCREEN),
            ),
          ],
        ),
      ),
    );
  }
}

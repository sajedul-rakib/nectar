import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nectar/screens/admin/admin_screen/index.dart';
import 'package:nectar/screens/widgets/app_button.dart';

class AdminScreen extends GetView<AdminScreenController> {
  const AdminScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: AppButton(
                title: "Log Out",
                onPressed: () => controller.logOut(),
              ),
            )
          ],
        ),
      ),
    );
  }
}

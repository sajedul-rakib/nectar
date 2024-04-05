import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nectar/screens/admin/admin_profile/index.dart';
import 'package:nectar/screens/widgets/app_button.dart';

class AdminProfileScreen extends GetView<AdminProfileScreenController> {
  const AdminProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: AppButton(
          title: "Log out",
          onPressed: () => controller.logOut(),
        ),
      )),
    );
  }
}

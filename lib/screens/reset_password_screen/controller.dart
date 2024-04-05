import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nectar/routes/route_name.dart';
import 'package:nectar/screens/widgets/snack_bar.dart';

class ResetPasswordScreenController extends GetxController {
  FirebaseAuth auth = FirebaseAuth.instance;

  final TextEditingController _emailETController = TextEditingController();

  //get
  TextEditingController get emailETController => _emailETController;

  Future<void> resetPassword({required String email}) async {
    await auth.sendPasswordResetEmail(email: email);
    snackBar(
        title: "Reset Password",
        message: "We send a mail at $email.Check the email for reset passwrod",
        contentType: ContentType.success,
        context: Get.key.currentContext!);
    Get.offAllNamed(RouteName.LOGIN_SCREEN);
  }

  @override
  void dispose() {
    _emailETController.dispose();
    super.dispose();
  }
}

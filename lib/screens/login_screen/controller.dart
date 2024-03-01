import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:nectar/routes/route_name.dart';
import 'package:nectar/screens/widgets/snack_bar.dart';
import 'package:nectar/share/save_data.dart';

class LoginScreenController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  //text editing controller
  final TextEditingController _emailETController = TextEditingController();
  final TextEditingController _passwordETController = TextEditingController();

  //get method
  TextEditingController get emailETController => _emailETController;
  TextEditingController get passwordETController => _passwordETController;

//sign in with email and password
  Future<User?> signInwithEmailandPassword(
      String email, String password) async {
    try {
      final credential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      return credential.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        //snackbar
        snackBar(
            title: "Not Found",
            message:
                "Not user found for that email.Enter your correct email address or sign in first",
            contentType: 'fail');
        // return null;
      } else if (e.code == 'wrong-password') {
        //snackbar

        snackBar(
            title: "Wrong Password",
            message: "Wrong password provided for that user",
            contentType: 'fail');
        // return null;
      }
      return null;
    } catch (e) {
      //snackbar
      snackBar(
          title: "Failed to log In",
          message: "Failed to log in.Create new account",
          contentType: 'fail');
      return null;
    }
  }

  //log in
  Future<void> logIn({required String email, required String password}) async {
    User? user = await signInwithEmailandPassword(email, password);

    if (user != null) {
      SaveData.saveUserRole(role: "customer");
      snackBar(
          title: "Log in successfully",
          message: "You are successfully to log in your account",
          contentType: 'success');
      _emailETController.clear();
      _passwordETController.clear();
      Get.offAllNamed(RouteName.BOTTONAVIGATION_SCREEN);
    }
  }

  //go to reset password screen
  void gotoResetPasswordScreen() {
    Get.toNamed(RouteName.RESET_PASSWORD_SCREEN);
  }
}

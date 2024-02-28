import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:nectar/model/User_data_mode.dart';
import 'package:nectar/routes/route_name.dart';
import 'package:nectar/screens/widgets/snack_bar.dart';
import 'package:nectar/share/save_user_data.dart';

class LoginScreenController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  late UserData _loggeduserData;

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
      log(credential.user.toString());
      return credential.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        //snackbar
        log(e.code.toString());
        snackBar(
            title: "Not Found",
            message:
                "Not user found for that email.Enter your correct email address or sign in first",
            contentType: 'fail');
        // return null;
      } else if (e.code == 'wrong-password') {
        //snackbar
        log(e.code.toString());

        snackBar(
            title: "Wrong Password",
            message: "Wrong password provided for that user",
            contentType: 'fail');
        // return null;
      }
      return null;
    } catch (e) {
      log('wrong ${e.toString()}');
      //snackbar
      snackBar(
          title: "Failed to log In",
          message: "Failed to log in.Create new account",
          contentType: 'fail');
      return null;
    }
  }

  //save user data
  Future<void> getUserData() async {
    final userData = _firestore.collection("user");
    await userData
        .where('token', isEqualTo: _auth.currentUser!.uid)
        .limit(1)
        .get()
        .then((value) async {
      _loggeduserData = UserData.fromJson(value.docs.first.data());
      //save user data
      await SaveUserData.saveUserData(userData: _loggeduserData);
    });
  }

  //log in
  Future<void> logIn({required String email, required String password}) async {
    User? user = await signInwithEmailandPassword(email, password);

    if (user != null) {
      getUserData();
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

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nectar/routes/route_name.dart';
import 'package:nectar/screens/widgets/snack_bar.dart';

class SignInController extends GetxController {
  //essentials
  final Rx<bool> _showPassword = true.obs;

  void isShowPassword() {
    _showPassword.value = !_showPassword.value;
    update();
  }

  //Text Editing Controller
  final TextEditingController _fullNameETController = TextEditingController();
  final TextEditingController _emailETController = TextEditingController();
  final TextEditingController _passwordETController = TextEditingController();

  //get method
  TextEditingController get fullNameETController => _fullNameETController;
  TextEditingController get emailETController => _emailETController;
  TextEditingController get passwordETController => _passwordETController;

  bool get showPassword => _showPassword.value;

  FirebaseAuth fireStore = FirebaseAuth.instance;

  Future<User?> createNewUser(
      String fullName, String email, String password) async {
    try {
      //create new user;

      final credential = await fireStore.createUserWithEmailAndPassword(
          email: email, password: password);
      return credential.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'week-password') {
        snackBar(
            title: 'Warning',
            contentType: ContentType.warning,
            message: e.message.toString(),
            context: Get.key.currentContext!);
      } else if (e.code == 'email-already-in-use') {
        snackBar(
            title: 'Warning',
            contentType: ContentType.warning,
            message: e.message.toString(),
            context: Get.key.currentContext!);
      }
      return null;
    } catch (e) {
      snackBar(
          title: 'Failed',
          contentType: ContentType.failure,
          message: 'You failed to create account.Try again.',
          context: Get.key.currentContext!);
      return null;
    }
  }

  Future<void> signIn(
      {required fullName, required email, required password}) async {
    User? user = await createNewUser(fullName, email, password);

    if (user != null) {
      FirebaseFirestore userStore = FirebaseFirestore.instance;
      var haveAnyUserBythisMail = await userStore
          .collection("user")
          .where('email', isEqualTo: email)
          .limit(1)
          .get();

      if (haveAnyUserBythisMail.docs.isEmpty) {
        //store user data in firestore
        Map<String, dynamic> userInformation = {
          "fullName": user.displayName ?? fullName,
          "email": user.email ?? email,
          "address": "",
          "token": user.uid,
          "profilePic": user.photoURL ?? "",
          "phoneNumber": user.phoneNumber ?? "",
          "cartList": [],
          "favouriteList": [],
          "order": [],
          "role": "customer"
        };
        userStore.collection("user").add(userInformation);

        //show snack bar
        snackBar(
            title: "Sign in Successfully",
            contentType: ContentType.success,
            message:
                "Your account created successfully.Thank you for join with us",
            context: Get.key.currentContext!);

        //clear input data
        _emailETController.clear();
        _fullNameETController.clear();
        _passwordETController.clear();

        //go to log in screen
        Get.offAllNamed(RouteName.LOGIN_SCREEN);
      }
    }
  }
}

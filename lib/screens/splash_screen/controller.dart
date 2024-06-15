import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:nectar/routes/route_name.dart';

class SplashScreenController extends GetxController {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future<void> gotoNextScreen() async {
    User? authState = _firebaseAuth.currentUser;
    if (authState != null) {
      log(authState.uid);
      Get.offAllNamed(RouteName.BOTTONAVIGATION_SCREEN);
    } else {
      Get.toNamed(RouteName.LOGIN_SCREEN);
    }
  }

  @override
  void onInit() {
    Future.delayed(const Duration(seconds: 2), () {
      gotoNextScreen();
    });
    super.onInit();
  }
}

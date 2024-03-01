import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:nectar/routes/route_name.dart';
import 'package:nectar/share/save_data.dart';

class SplashScreenController extends GetxController {
  Future<void> gotoNextProject() async {
    Future.delayed(const Duration(seconds: 2), () {
      Get.offAllNamed(RouteName.ONBORDING_SCREEN);
    });
  }

  //check user are logged in;
  Future<void> checkUserAreLogged() async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? authState = await auth.currentUser;

    if (authState != null) {
      String? getRole = await SaveData.getUserRole(role: "role");
      if (getRole != null) {
        log("get role $getRole");
        if (getRole == 'admin') {
          Get.offAllNamed(RouteName.ADMIN_SCREEN);
        } else {
          Get.offAllNamed(RouteName.BOTTONAVIGATION_SCREEN);
        }
      }
    } else {
      Get.toNamed(RouteName.LOGIN_SCREEN);
    }
  }

  @override
  void onInit() {
    checkUserAreLogged();
    super.onInit();
  }
}

import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:nectar/routes/route_name.dart';
import 'package:nectar/share/save_data.dart';

class SplashScreenController extends GetxController {
  Future<void> gotoNextScreen() async {
    bool isFirst = await SaveData.isFirstOpen() ?? true;
    log("is first open $isFirst");
    if (isFirst) {
      Future.delayed(const Duration(seconds: 2), () {
        Get.offAllNamed(RouteName.ONBORDING_SCREEN);
      });
    } else {
      FirebaseAuth auth = FirebaseAuth.instance;
      User? authState = auth.currentUser;

      if (authState != null) {
        String? getRole = await SaveData.getUserRole(role: "role");
        log("role $getRole");
        if (getRole != null) {
          if (getRole == 'admin') {
            Get.offAllNamed(RouteName.ADMIN_BOTTOM_NAV_BARSCREEN);
          } else {
            Get.offAllNamed(RouteName.BOTTONAVIGATION_SCREEN);
          }
        }
      } else {
        Get.toNamed(RouteName.LOGIN_SCREEN);
      }
    }
  }

  @override
  void onInit() {
    gotoNextScreen();
    super.onInit();
  }
}

import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:nectar/routes/route_name.dart';
import 'package:nectar/share/save_data.dart';


class SplashScreenController extends GetxController {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  bool firstOpen=true;

  // void isFirstOpen()async{
  //   bool? isFirst= await SaveData.isFirstOpen();
  //   if(isFirst!=null){
  //     firstOpen=isFirst;
  //   }
  // }


  Future<void> gotoNextScreen() async {
    if (firstOpen) {
      Future.delayed(const Duration(seconds: 2), () {
        Get.offAllNamed(RouteName.ONBORDING_SCREEN);
      });
    } else {
      User? authState = _firebaseAuth.currentUser;

      if (authState != null) {
        Get.offAllNamed(RouteName.BOTTONAVIGATION_SCREEN);
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

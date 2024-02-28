import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:nectar/routes/route_name.dart';

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
      Get.offAllNamed(RouteName.BOTTONAVIGATION_SCREEN);
    } else {
      Get.toNamed(RouteName.LOGIN_SCREEN);
    }
  }

  @override
  void onInit() {
    // gotoNextProject();
    checkUserAreLogged();
    super.onInit();
  }
}

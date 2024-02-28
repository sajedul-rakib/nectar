import 'package:get/get.dart';
import 'package:nectar/screens/splash_screen/controller.dart';

class SplashScreenBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(SplashScreenController());
  }
}

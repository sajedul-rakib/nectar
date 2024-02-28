import 'package:get/get.dart';
import 'package:nectar/screens/login_screen/controller.dart';

class LoginScreenBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginScreenController>(() => LoginScreenController());
  }
}

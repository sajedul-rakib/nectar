import 'package:get/get.dart';
import 'package:nectar/screens/reset_password_screen/index.dart';

class ResetPasswordScreenBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(ResetPasswordScreenController());
  }
}

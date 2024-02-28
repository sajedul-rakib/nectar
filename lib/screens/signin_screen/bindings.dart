import 'package:get/get.dart';
import 'package:nectar/screens/signin_screen/controller.dart';

class SignInBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SignInController>(() => SignInController());
  }
}

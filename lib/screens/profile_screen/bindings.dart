import 'package:get/get.dart';
import 'package:nectar/screens/profile_screen/controller.dart';

class ProfileScreenBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(ProfileScreenController());
  }
}

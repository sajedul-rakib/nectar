import 'package:get/get.dart';
import 'package:nectar/screens/admin/admin_profile/controller.dart';

class AdminProfileScreenBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(AdminProfileScreenController());
  }
}

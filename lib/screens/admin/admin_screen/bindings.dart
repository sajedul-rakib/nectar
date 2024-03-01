import 'package:get/get.dart';
import 'package:nectar/screens/admin/admin_screen/controller.dart';

class AdminScreenBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(AdminScreenController());
  }
}

import 'package:get/get.dart';
import 'package:nectar/screens/admin/admin_log_in_screen/controller.dart';

class AdminLogInScreenBindigs implements Bindings {
  @override
  void dependencies() {
    Get.put(AdminLogInScreenController());
  }
}

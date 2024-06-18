

import 'package:get/get.dart';
import 'package:nectar/screens/user_details_screen/controller.dart';

class UserDetailsScreenBindings implements Bindings{
  @override
  void dependencies() {
    Get.lazyPut(()=>UserDetailScreenController());
  }
}

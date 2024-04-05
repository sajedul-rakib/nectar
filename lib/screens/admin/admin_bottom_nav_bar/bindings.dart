import 'package:get/get.dart';
import 'package:nectar/screens/admin/admin_bottom_nav_bar/controller.dart';
import 'package:nectar/screens/admin/admin_profile/controller.dart';
import 'package:nectar/screens/admin/admin_screen/controller.dart';
import 'package:nectar/screens/admin/order_list_screen/controller.dart';
import 'package:nectar/screens/admin/product_list_screen/controller.dart';

class AdminBottomNavBarBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(AdminBottomNavBarController());
    Get.put(AdminScreenController());
    Get.put(ProductListScreenController());
    Get.put(OrderListScreenController());
    Get.put(AdminProfileScreenController());
  }
}

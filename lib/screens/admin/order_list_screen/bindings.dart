import 'package:get/get.dart';
import 'package:nectar/screens/admin/order_list_screen/controller.dart';

class OrderListScreenBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(OrderListScreenController());
  }
}

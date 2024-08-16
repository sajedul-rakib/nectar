import 'package:get/get.dart';
import 'package:nectar/screens/order_details_screen/controller.dart';

class OrderDetailScreenBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => OrderDetailsScreenController());
  }
}

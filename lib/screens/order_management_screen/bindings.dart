import 'package:get/get.dart';
import 'package:nectar/screens/order_management_screen/index.dart';

class OrderTrackingScreenBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => OrderTrackingScreenController());
  }
}

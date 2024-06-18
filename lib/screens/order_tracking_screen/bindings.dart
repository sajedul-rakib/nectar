import 'package:get/get.dart';
import 'package:nectar/screens/order_tracking_screen/index.dart';

class OrderTrackingScreenBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => OrderTrackingScreenController());
  }
}

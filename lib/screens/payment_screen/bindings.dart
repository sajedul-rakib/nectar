import 'package:get/get.dart';
import 'package:nectar/screens/payment_screen/index.dart';

class PaymentScreenBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PaymentScreenController());
  }
}

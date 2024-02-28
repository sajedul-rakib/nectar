import 'package:get/get.dart';
import 'package:nectar/screens/cart_screen/controller.dart';

class CartScreenBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(CartScreenController());
  }
}

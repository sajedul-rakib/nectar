import 'package:get/get.dart';
import 'package:nectar/screens/product_detail_screen/controller.dart';

class ProductDetailScreenBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(ProductDetailScreenController());
    // TODO: implement dependencies
  }
}

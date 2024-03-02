import 'package:get/get.dart';
import 'package:nectar/screens/admin/product_list_screen/index.dart';

class ProductListScreenBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(ProductListScreenController());
  }
}

import 'package:get/get.dart';
import 'package:nectar/screens/search_with_category_screen/index.dart';

class CategorySearchScreenBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(CategorySearchScreenController());
  }
}

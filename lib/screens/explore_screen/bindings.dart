import 'package:get/get.dart';
import 'package:nectar/screens/explore_screen/controller.dart';

class ExploreScreenBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(ExploreScreenController());
  }
}

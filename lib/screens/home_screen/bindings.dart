import 'package:get/get.dart';
import 'package:nectar/screens/bottom_navigation_bar/controller.dart';
import 'package:nectar/screens/home_screen/controller.dart';

class HomeScreenBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(HomeScreenController());
    Get.put(BottomNavigationBarController());
  }
}

import 'package:get/get.dart';
import 'package:nectar/screens/bottom_navigation_bar/controller.dart';
import 'package:nectar/screens/cart_screen/controller.dart';
import 'package:nectar/screens/cart_screen/index.dart';
import 'package:nectar/screens/explore_screen/controller.dart';
import 'package:nectar/screens/explore_screen/index.dart';
import 'package:nectar/screens/favourite_screen/controller.dart';
import 'package:nectar/screens/favourite_screen/index.dart';
import 'package:nectar/screens/home_screen/controller.dart';
import 'package:nectar/screens/home_screen/index.dart';
import 'package:nectar/screens/profile_screen/controller.dart';

class BottomNavigationBarBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(BottomNavigationBarController());
    Get.put(HomeScreenController());
    Get.put(ExploreScreenController());
    Get.put(CartScreenController());
    Get.put(FavouriteScreenController());
    Get.put(ProfileScreenController());
  }
}

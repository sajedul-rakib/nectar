import 'package:get/get.dart';
import 'package:nectar/screens/favourite_screen//controller.dart';

class FavouriteScreenBindins implements Bindings {
  @override
  void dependencies() {
    Get.put(FavouriteScreenController());
  }
}

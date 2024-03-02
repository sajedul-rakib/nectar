import 'package:get/get.dart';

class AdminBottomNavBarController extends GetxController {
  final _currentIndex = 0.obs;

  //get
  int get currentIndex => _currentIndex.value;

  void changeIndex(int index) {
    _currentIndex.value = index;
    update();
  }
}

import 'package:get/get.dart';
import 'package:nectar/model/Product.dart';

class ProductDetailScreenController extends GetxController {
  int _productSliderBannerIndex = 0;
  int _productCount = 1;

  int get productSliderBannerIndex => _productSliderBannerIndex;
  int get productCount => _productCount;

  //productdata
  Product product = Get.arguments;

  void changeIndex(int index) {
    _productSliderBannerIndex = index;
    update();
  }

  void plusMethod() {
    _productCount++;
    update();
  }

  void minusMethod() {
    if (_productCount != 1) _productCount--;
    update();
  }
}

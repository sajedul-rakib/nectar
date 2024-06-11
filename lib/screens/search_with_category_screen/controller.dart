import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:nectar/model/product.dart';

class CategorySearchScreenController extends GetxController {
  final String _titleAndKeyWord = Get.arguments;
  final List<Product> _productList = [];
  bool _pageLoader = false;

  String get title => _titleAndKeyWord;
  List<Product> get productList => _productList;
  bool get pageLoader => _pageLoader;

  Future<void> getProductDataByCategory(String category) async {
    _pageLoader = true;
    update();
    FirebaseFirestore store = FirebaseFirestore.instance;
    try {
      await store
          .collection("products")
          .where("productCategory", isEqualTo: category.split(" ").join(''))
          .get()
          .then((value) {
        for (var product in value.docs) {
          _productList.add(Product.fromJson(product.data()));
        }
        _pageLoader = false;
        update();
      });
    } on FirebaseException catch (e) {
      log('problem : ${e.message}');
    } catch (e) {
      _pageLoader = false;
      update();
      log(e.toString());
    }
  }

  @override
  void onInit() {
    getProductDataByCategory(title);
    super.onInit();
  }
}

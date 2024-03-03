import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:nectar/model/Product.dart';

class ProductListScreenController extends GetxController {
//firebase
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  //progress loder
  bool _isProgressLoad = false;

//product List
  final List<Product> _productList = [];

//get
  List<Product> get productList => _productList;
  bool get isProgressLoad => _isProgressLoad;

  Future<void> getAllProduct() async {
    log('called from function');
    _isProgressLoad = true;
    try {
      await _firestore
          .collection("products")
          .orderBy("productStock", descending: true)
          .get()
          .then((value) {
        for (var product in value.docs) {
          _productList.add(Product.fromJson(product.data()));
        }
        _isProgressLoad = false;
        update();
      });
    } catch (e) {
      _isProgressLoad = false;
      update();
      log(e.toString());
    }
  }

  @override
  void onInit() {
    log("called");
    getAllProduct();
    super.onInit();
  }
}

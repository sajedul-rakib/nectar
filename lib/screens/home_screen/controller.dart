import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../../model/Product.dart';

class HomeScreenController extends GetxController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  int _currentBanner = 0;
  final List<Product> _groceriesProduct = [];
  final List<Product> _exclusiveOfferProduct = [];
  final List<Product> _bestSellingProduct = [];
  bool _groceriesDataLoader = false;
  bool _exclusiveOfferDataLoader = false;
  bool _bestSellingDataLoader = false;

  int get currentBanner => _currentBanner;
  List<Product> get groceriesProduct => _groceriesProduct;
  List<Product> get exclusiveOfferProduct => _exclusiveOfferProduct;
  List<Product> get bestSellingProduct => _bestSellingProduct;
  bool get groceriesDataLoader => _groceriesDataLoader;
  bool get exclusiveOfferDataLoader => _exclusiveOfferDataLoader;
  bool get bestSellingDataLoader => _bestSellingDataLoader;

  List<String> carousel_data = [
    'assets/images/apple.png',
    'assets/images/apple.png',
    'assets/images/apple.png',
    'assets/images/apple.png',
  ];

//exclusive offer products
  Future<void> getExclusiveProduct() async {
    _exclusiveOfferDataLoader = true;
    update();
    try {
      _firestore
          .collection("products")
          .where('tag', isEqualTo: "exclusiveOffer")
          .limit(20)
          .get()
          .then((productData) {
        for (var product in productData.docs) {
          _exclusiveOfferProduct.add(Product.fromJson(product.data()));
        }
        _exclusiveOfferDataLoader = false;
        update();
      });
    } catch (e) {
      _exclusiveOfferDataLoader = false;
      update();
      log(e.toString());
    }
  }

//best selling products
  Future<void> getBestSellingProduct() async {
    _bestSellingDataLoader = true;
    update();
    try {
      _firestore
          .collection("products")
          .where('tag', isEqualTo: "bestSelling")
          .limit(20)
          .get()
          .then((productData) {
        for (var product in productData.docs) {
          _bestSellingProduct.add(Product.fromJson(product.data()));
        }
        _bestSellingDataLoader = false;
        update();
      });
    } catch (e) {
      _bestSellingDataLoader = false;
      update();
      log(e.toString());
    }
  }

//groceries products
  Future<void> getGroceriesProduct() async {
    _groceriesDataLoader = true;
    update();
    try {
      _firestore.collection("products").limit(20).get().then((productData) {
        for (var product in productData.docs) {
          log("data ${product.data()}");
          _groceriesProduct.add(Product.fromJson(product.data()));
        }
        _groceriesDataLoader = false;
        update();
      });
    } catch (e) {
      _groceriesDataLoader = false;
      update();
      log(e.toString());
    }
  }

  void changeBanner(int index) {
    _currentBanner = index;
    update();
  }

  @override
  void onInit() {
    getExclusiveProduct();
    getBestSellingProduct();
    getGroceriesProduct();
    super.onInit();
  }
}

import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:nectar/utils/notifications/notificaton_service.dart';

import '../../model/product.dart';

class HomeScreenController extends GetxController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  int _currentBanner = 0;
  final List<Product> _groceriesProduct = [];
  final List<Product> _exclusiveOfferProduct = [];
  final List<Product> _bestSellingProduct = [];
  bool _homeScreenLoader = false;
  final List<String> _carouselData = [];

  int get currentBanner => _currentBanner;

  List<Product> get groceriesProduct => _groceriesProduct;

  List<Product> get exclusiveOfferProduct => _exclusiveOfferProduct;

  List<Product> get bestSellingProduct => _bestSellingProduct;

  List<String> get carouselData => _carouselData;

  bool get homScreenLoader => _homeScreenLoader;

//exclusive offer products
  Future<void> getExclusiveProduct() async {
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
        update();
      });
    } catch (e) {
      update();
      log(e.toString());
    }
  }

//best selling products
  Future<void> getBestSellingProduct() async {
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

        update();
      });
    } catch (e) {
      update();
      log(e.toString());
    }
  }

//groceries products
  Future<void> getGroceriesProduct() async {
    try {
      _firestore.collection("products").limit(20).get().then((productData) {
        for (var product in productData.docs) {
          _groceriesProduct.add(Product.fromJson(product.data()));
        }

        update();
      });
    } catch (e) {
      update();
      log(e.toString());
    }
  }

  //get slider data
  Future<void> getSliderData() async {
    try {
      _firestore.collection("sliderData").get().then((sliderData) {
        for (var slider in sliderData.docs) {
          _carouselData.add(slider.get("slideUrl"));
        }

        update();
      });
    } catch (e) {
      update();
      log(e.toString());
      rethrow;
    }
  }

  void changeBanner(int index) {
    _currentBanner = index;
    update();
  }

  //call all method
  void getAllProduct() async {
    _homeScreenLoader = true;
    getSliderData().then((_) {
      getExclusiveProduct().then((_) {
        getBestSellingProduct().then((_) {
          getGroceriesProduct();
          _homeScreenLoader = false;
          update();
        });
      });
    });
  }

  @override
  void onInit() {
    NotificatonService().initialize();
    getAllProduct();
    super.onInit();
  }
}

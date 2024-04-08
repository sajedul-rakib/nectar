import 'dart:convert';
import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:nectar/model/Product.dart';

class FavouriteScreenController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final Rx<bool> _checkUserAreLogged = false.obs;
  final RxBool _pageLoader = false.obs;
  final List<Product> _favouriteProduct = [];

  bool get checkUserAreLogged => _checkUserAreLogged.value;
  bool get pageLoader => _pageLoader.value;
  List<Product> get favouriteProduct => _favouriteProduct;

  void userAreLoggedIn() {
    User? user = _auth.currentUser;
    if (user != null) {
      _checkUserAreLogged.value = true;
      update();
    }
  }

  Future<void> getFavouriteProduct() async {
    _pageLoader.value = true;
    update();
    try {
      _firestore
          .collection("favouriteList")
          .where("userId", isEqualTo: _auth.currentUser!.uid)
          .get()
          .then((favoriteProduct) {
        for (var product in favoriteProduct.docs) {
          log(jsonEncode(product.data()));
          _favouriteProduct.add(Product.fromJson(product.data()));
        }
        _pageLoader.value = false;
        update();
      });
    } catch (e) {
      log(e.toString());
      _pageLoader.value = false;
      update();
      rethrow;
    }
  }

  @override
  void onInit() {
    userAreLoggedIn();
    getFavouriteProduct();
    super.onInit();
  }
}

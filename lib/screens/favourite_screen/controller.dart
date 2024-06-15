import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:nectar/model/product.dart';

class FavouriteScreenController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  bool _checkUserAreLogged = false;
  bool _pageLoader = false;
  final List<Product> _favouriteProduct = [];
  final List<Product> _selectedFavouriteCart = [];
  bool _enabledMultiSelection = false;

  bool get checkUserAreLogged => _checkUserAreLogged;

  bool get pageLoader => _pageLoader;

  bool get enabledMultiSelection => _enabledMultiSelection;

  //setter method
  set permitForEnableSelection(bool permission) =>
      _enabledMultiSelection = permission;

  List<Product> get favouriteProduct => _favouriteProduct;

  List<Product> get selectedFavouriteCart => _selectedFavouriteCart;

  void userAreLoggedIn() {
    User? user = _auth.currentUser;
    if (user != null) {
      _checkUserAreLogged = true;
      update();
    }
  }

  void selectFavouriteCart(Product cart) {
    if (_enabledMultiSelection) {
      if (_selectedFavouriteCart.contains(cart)) {
        _selectedFavouriteCart.remove(cart);
        if (_selectedFavouriteCart.isEmpty) {
          _enabledMultiSelection = false;
        }
      } else {
        _selectedFavouriteCart.add(cart);
      }
      update();
    }
  }

  Future<void> getFavouriteProduct() async {
    _pageLoader = true;
    update();
    try {
      _firestore
          .collection("favouriteList")
          .where("userId", isEqualTo: _auth.currentUser!.uid)
          .get()
          .then((favoriteProduct) {
        for (var product in favoriteProduct.docs) {
          _favouriteProduct.add(Product.fromJson(product.data()));
        }
        _pageLoader = false;
        update();
      });
    } catch (e) {
      log(e.toString());
      _pageLoader = false;
      update();
      rethrow;
    }
  }

  void deleteFavouriteData() {
    for (var product in _selectedFavouriteCart) {
      removeFavouriteCart(product: product);
      _favouriteProduct.remove(product);
    }
    _enabledMultiSelection = false;
    update();
  }

  //remove favourite data data
  Future<void> removeFavouriteCart({required Product product}) async {
    try {
      final getProductDocument = await _firestore
          .collection("favouriteList")
          .where("userId", isEqualTo: _auth.currentUser!.uid)
          .where("id", isEqualTo: product.id)
          .get();
      String productDocument = getProductDocument.docs.first.id;

      return _firestore
          .collection("favouriteList")
          .doc(productDocument)
          .delete();
    } catch (e) {
      log(e.toString());
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

import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:nectar/model/cart_data_model.dart';

class CartScreenController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final Rx<bool> _checkUserAreLogged = false.obs;
  final List<CartDataModel> _cartData = [];
  final List<CartDataModel> _selectedCart = [];
  bool _enabledMultiSelection = false;
  num _totalPrice = 0;

  bool get checkUserAreLogged => _checkUserAreLogged.value;

  List<CartDataModel> get selectedCart => _selectedCart;

  bool get isdMultiSelection => _enabledMultiSelection;

  num get totalPrice => _totalPrice;

  //setter method
  set enabledMultiSelection(bool permissionForMultiSelect) =>
      _enabledMultiSelection = permissionForMultiSelect;

  List<CartDataModel> get cartData => _cartData;

  //select cart
  num selectCart(CartDataModel cart) {
    if (_enabledMultiSelection) {
      if (_selectedCart.contains(cart)) {
        _selectedCart.remove(cart);
        if (_selectedCart.isEmpty) {
          _enabledMultiSelection = false;
        }
      } else {
        _selectedCart.add(cart);
      }
      _totalPrice = 0;
      for (var cartDa in _selectedCart) {
        _totalPrice += (cartDa.productPrice! * cartDa.totalOrderProduct!);
      }
      update();
      return _totalPrice;
    } else {
      return 0;
    }
  }

  void userAreLoggedIn() {
    User? user = _auth.currentUser;
    if (user != null) {
      _checkUserAreLogged.value = true;
      update();
    }
  }

  //get cart data
  Future<void> getCartList() async {
    try {
      final cartList = await _firestore
          .collection("cart")
          .where("userId", isEqualTo: _auth.currentUser!.uid)
          .get();
      for (var cart in cartList.docs) {
        _cartData.add(CartDataModel.fromJson(cart.data()));
        // log(jsonEncode(cart.data()));
      }
      update();
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  //remove cart data
  Future<bool> removeCart({required CartDataModel cartData}) async {
    try {
      final getProductDocument = await _firestore
          .collection("cart")
          .where("userId", isEqualTo: _auth.currentUser!.uid)
          .where("id", isEqualTo: cartData.id)
          .get();

      String deletedProductDocument = getProductDocument.docs.first.id;
      String updateProductId = await _firestore
          .collection("products")
          .where("id", isEqualTo: cartData.id)
          .get()
          .then((doc) {
        return doc.docs.first.id;
      });

      return _firestore.collection("products").doc(updateProductId).update({
        'productStock': cartData.productStock! + cartData.totalOrderProduct!
      }).then((_) {
        return _firestore
            .collection("cart")
            .doc(deletedProductDocument)
            .delete()
            .then((value) {
          return true;
        });
      });
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  @override
  void onInit() {
       userAreLoggedIn();
    _checkUserAreLogged.value ? getCartList() : null;
    super.onInit();
  }
}

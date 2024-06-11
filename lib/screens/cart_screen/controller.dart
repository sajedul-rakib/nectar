import 'dart:convert';
import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:nectar/model/cart_data_model.dart';

class CartScreenController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final Rx<bool> _checkUserAreLogged = false.obs;
  final List<CartDataModel> _cartData=[];



  bool get checkUserAreLogged => _checkUserAreLogged.value;
  List<CartDataModel> get cartData=>_cartData;


  void userAreLoggedIn() {
    User? user = _auth.currentUser;
    if (user != null) {
      _checkUserAreLogged.value = true;
      update();
    }
  }

  Future<void> getCartList() async {
    try {
     final cartList=await _firestore
          .collection("cart")
          .where("userId", isEqualTo: _auth.currentUser!.uid)
          .get();
      for(var cart in cartList.docs){
        _cartData.add(CartDataModel.fromJson(cart.data()));
      }
      update();
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  @override
  void onInit() {
    userAreLoggedIn();
    getCartList();
    super.onInit();
  }
}

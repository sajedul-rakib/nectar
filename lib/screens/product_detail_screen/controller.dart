import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:nectar/model/product.dart';
import 'package:nectar/screens/widgets/snack_bar.dart';

class ProductDetailScreenController extends GetxController {
  //firebase option
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  //loader
  final Rx<bool> _addFavouriteLoader = false.obs;

  int _productSliderBannerIndex = 0;
  int _productCount = 1;
  final Rx<bool> _checkUserAreLogged = false.obs;

  //get method
  int get productSliderBannerIndex => _productSliderBannerIndex;

  int get productCount => _productCount;

  bool get addFavouriteLoader => _addFavouriteLoader.value;

  bool get checkUserAreLogged => _checkUserAreLogged.value;

  //product data
  Product product = Get.arguments;

  void userAreLoggedIn() {
    User? currentUser = _auth.currentUser;

    if (currentUser != null) {
      _checkUserAreLogged.value = true;
      update();
    }
  }

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

  //add favourite functionality
  Future<void> addFavouriteProducts(Product product) async {
    try {
      final isProductIsExist = await _firestore
          .collection("favouriteList")
          .where('userId', isEqualTo: _auth.currentUser!.uid)
          .where('id', isEqualTo: product.id)
          .get();

      if (isProductIsExist.docs.isNotEmpty) {
        snackBar(
            title: "Warning",
            message: "This product already exist on your favourite list",
            contentType: ContentType.warning,
            context: Get.key.currentContext!);
      } else {
        _addFavouriteLoader.value = true;
        update();
        _firestore.collection("favouriteList").add({
          "userId": _auth.currentUser!.uid,
          ...product.toJson(),
        });
        _addFavouriteLoader.value = false;
        update();
      }
    } catch (e) {
      log(e.toString());
      _addFavouriteLoader.value = false;
      update();
    }
  }

  //add to cart function
  Future<bool> addToCart({required Product product}) async {
    try {
      final thisProductExistInCart = await _firestore
          .collection("cart")
          .where("userId", isEqualTo: _auth.currentUser!.uid)
          .where("id", isEqualTo: product.id)
          .get();
      if (thisProductExistInCart.docs.isEmpty) {
        _firestore.collection("cart").add({
          "userId": _auth.currentUser!.uid,
          "totalOrderProduct": productCount,
          ...product.toJson(),
        });
        return true;
      } else {
        String productDoc = thisProductExistInCart.docs.first.id;
        int previousCartProduct =
            await thisProductExistInCart.docs.first.get("totalOrderProduct");
        _firestore
            .collection("cart")
            .doc(productDoc)
            .update({"totalOrderProduct": previousCartProduct + productCount});
      }
      return true;
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  @override
  void onInit() {
    userAreLoggedIn();
    super.onInit();
  }
}

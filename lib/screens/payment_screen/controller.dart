import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:nectar/model/cart_data_model.dart';
import 'package:nectar/model/user_data_model.dart';
import 'package:nectar/routes/route_name.dart';
import 'package:nectar/screens/cart_screen/index.dart';
import 'package:nectar/screens/profile_screen/controller.dart';
import 'package:nectar/utils/generateOrderId/generateorderid.dart';

class PaymentScreenController extends GetxController {
  //firebase
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  //cotroller
  String selectedPaymentMethod = '';
  num _totalPrice = 0;
  UserModel _userModel = UserModel.emptyUser;

  UserModel get userModel => _userModel;
  num get totalPrice => _totalPrice;

  //set method
  set paymentMethod(String method) => selectedPaymentMethod = method;

  List<CartDataModel> cartData = Get.arguments;

  void getUserData() async {
    UserModel loggedUserData =
        await Get.find<ProfileScreenController>().getLoggedUserData();
    _userModel = loggedUserData;
    update();
  }

  void _totalPriceofAllProduct() {
    num total = Get.find<CartScreenController>().totalPrice;
    _totalPrice = total;
    update();
  }

  Future<void> placeOrder() async {
    try {
      String orderId = GenerateOrderId.generateOrderId();

      _firebaseFirestore.collection("order").add({
        "orderId": orderId,
        "customer": {..._userModel.toJson()},
        "items": [...cartData.map((cart) => cart.toJson())],
        "deliveryAddress": _userModel.address,
        "totalPrice": _totalPrice,
        "paymentMethod": selectedPaymentMethod,
        "paymentDone": false,
        "orderStatus": "proccessing",
        "orderTime": DateTime.now().toString()
      }).then((_) {
        for (CartDataModel cart in cartData) {
          Get.find<CartScreenController>().removeCart(cartData: cart);
          Get.find<CartScreenController>().cartData.remove(cart);
        }
        Get.find<CartScreenController>().selectedCart.clear();
        Get.find<CartScreenController>().enabledMultiSelection = false;
        Get.toNamed(RouteName.bottomNavigationScreen);
      });
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  @override
  void onInit() {
    getUserData();
    _totalPriceofAllProduct();
    super.onInit();
  }
}

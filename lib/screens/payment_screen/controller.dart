import 'dart:convert';
import 'dart:developer';

import 'package:get/get.dart';
import 'package:nectar/model/cart_data_model.dart';
import 'package:nectar/model/user_data_model.dart';
import 'package:nectar/screens/cart_screen/index.dart';
import 'package:nectar/screens/profile_screen/controller.dart';

class PaymentScreenController extends GetxController {
  String selectedPaymentMethod = '';
  num _totalPrice = 0;
  UserModel _userModel = UserModel.emptyUser;

  UserModel get userModel => _userModel;
  num get totalPrice => _totalPrice;

  //set method
  set paymentMethod(String method) => selectedPaymentMethod = method;

  List<CartDataModel> cartData = Get.arguments;

  void getUserData() async {
    log("called");
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
      log(jsonEncode({
        "orderId": "54923845-93485",
        "customer": {..._userModel.toJson()},
        "items": [...cartData.map((cart) => cart.toJson())],
        "deliveryAddress": _userModel.address,
        "totalPrice": _totalPrice,
        "paymentMethod": selectedPaymentMethod,
        "paymentDone": false,
        "orderStatus": "proccessing",
        "orderTime": DateTime.now().toString()
      }));
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

import 'dart:convert';
import 'dart:developer';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';
import 'package:nectar/model/cart_data_model.dart';
import 'package:nectar/model/user_data_model.dart';
import 'package:nectar/screens/cart_screen/index.dart';
import 'package:nectar/screens/profile_screen/controller.dart';
import 'package:nectar/utils/generateOrderId/generateorderid.dart';
import 'package:nectar/utils/notifications/notifications_system.dart';

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
      String orderId = GenerateOrderId.generateOrderId();
      log(jsonEncode({
        "orderId": orderId,
        "customer": {..._userModel.toJson()},
        "items": [...cartData.map((cart) => cart.toJson())],
        "deliveryAddress": _userModel.address,
        "totalPrice": _totalPrice,
        "paymentMethod": selectedPaymentMethod,
        "paymentDone": false,
        "orderStatus": "proccessing",
        "orderTime": DateTime.now().toString()
      }));
      sendNotifiaction(orderId);
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  String reciepentToken = '';

  //send notification
  Future<void> sendNotifiaction(String orderId) async {
    try {
      fcmToken();
      NotificationsSystem.sendPushNotification(
          receipentToken: reciepentToken,
          title: "Order Placed",
          message: "New order placed",
          orderId: orderId);
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  void fcmToken() async {
    FirebaseMessaging messaging = FirebaseMessaging.instance;
    messaging.getToken().then((token) {
      if (token != null) {
        reciepentToken = token;
      }
    });
  }

  @override
  void onInit() {
    getUserData();
    _totalPriceofAllProduct();
    fcmToken();
    super.onInit();
  }
}

import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:nectar/model/cart_data_model.dart';
import 'package:nectar/model/user_data_model.dart';
import 'package:nectar/routes/route_name.dart';
import 'package:nectar/screens/cart_screen/index.dart';
import 'package:nectar/screens/profile_screen/controller.dart';
import 'package:nectar/screens/widgets/snack_message.dart';
import 'package:nectar/utils/generateOrderId/generateorderid.dart';

class PaymentScreenController extends GetxController {
  //firebase
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
      if (selectedPaymentMethod != "") {
        _firebaseFirestore.collection("order").add({
          "id": GenerateOrderId.generateOrderId(10),
          "orderId": GenerateOrderId.generateOrderId(6),
          "orderToken": _userModel.token,
          "customer": {..._userModel.toJson()},
          "items": [...cartData.map((cart) => cart.toJson())],
          "deliveryAddress": _userModel.address,
          "totalPrice": _totalPrice,
          "paymentMethod": selectedPaymentMethod,
          "paymentDone": selectedPaymentMethod != "COD" ? true : false,
          "orderStatus": "proccessing",
          "orderTime": DateFormat.yMMMEd().format(DateTime.now())
        }).then((_) {
          for (CartDataModel cart in cartData) {
            Get.find<CartScreenController>().removeCart(cartData: cart);
            Get.find<CartScreenController>().cartData.remove(cart);
          }
          Get.find<CartScreenController>().selectedCart.clear();
          Get.find<CartScreenController>().enabledMultiSelection = false;
          SnackMessage.snackMessage(message: "New order Placed");
          Get.toNamed(RouteName.bottomNavigationScreen);
        });
      } else {
        SnackMessage.snackMessage(message: "Select payment method");
      }
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

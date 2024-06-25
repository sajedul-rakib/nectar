import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:nectar/model/order_data_model.dart';
import 'package:nectar/routes/route_name.dart';
import 'package:nectar/screens/widgets/snack_message.dart';

class OrderDetailsScreenController extends GetxController {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  OrderDataModel orderDataModel = Get.arguments;

  String? _orderStatus;
  bool _showTextFormField = false;

  String? get orderStatus => _orderStatus;
  bool get showTextFormField => _showTextFormField;

  void isShowTextFormField() {
    _showTextFormField = !_showTextFormField;
    update();
  }

  void getOrderStatus({required String orderId}) {
    if (orderId == orderDataModel.orderId) {
      _orderStatus = orderDataModel.orderStatus;
      _showTextFormField = false;
      update();
    } else {
      SnackMessage.snackMessage(message: "Order id not right");
    }
  }

  Future<void> cancelOrder() async {
    try {
      _firebaseFirestore
          .collection("cancelOrder")
          .add(orderDataModel.toJson())
          .then((_) async {
        String cancelOrderDoc = await _firebaseFirestore
            .collection("order")
            .where("orderToken", isEqualTo: _firebaseAuth.currentUser!.uid)
            .where('id', isEqualTo: orderDataModel.id)
            .get()
            .then((val) {
          return val.docs.first.id;
        });
        _firebaseFirestore
            .collection("order")
            .doc(cancelOrderDoc)
            .delete()
            .then((_) {
          SnackMessage.snackMessage(message: "Order canceled");
          Get.offAllNamed(RouteName.bottomNavigationScreen);
        });
      });
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }
}

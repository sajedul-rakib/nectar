import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:nectar/model/order_data_model.dart';

class OrderTrackingScreenController extends GetxController {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  final List<OrderDataModel> _orderData = [];

  List<OrderDataModel> get orderData => _orderData;

  Future<void> getOrderData() async {
    try {
      final data = await _firebaseFirestore.collection("order").get();

      for (var orders in data.docs) {
        _orderData.add(OrderDataModel.fromJson(orders.data()));
      }
      update();
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }
}

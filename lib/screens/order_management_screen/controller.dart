import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:nectar/model/order_data_model.dart';

class OrderTrackingScreenController extends GetxController {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  final List<OrderDataModel> _orderData = [];
  bool _pageLoader = false;
  String? _orderStatus;

  List<OrderDataModel> get orderData => _orderData;
  bool get pageLoader => _pageLoader;
  String? get orderStatus => _orderStatus;

  Future<void> getOrderData() async {
    _pageLoader = true;
    update();
    try {
      final data = await _firebaseFirestore
          .collection("order")
          .where("orderToken", isEqualTo: _firebaseAuth.currentUser!.uid)
          .get();

      for (var orders in data.docs) {
        _orderData.add(OrderDataModel.fromJson(orders.data()));
      }
      _pageLoader = false;
      update();
    } catch (e) {
      _pageLoader = false;
      update();
      log(e.toString());
      rethrow;
    }
  }

  //get order status
  Future<void> getOrderStatus(
      {required String orderId, required int index}) async {
    if (_orderData[index].orderStatus != null) {
      _orderStatus = _orderData[index].orderStatus;
      if (orderId == _orderData[index].orderId) {
        update();
      }
    }
  }

  @override
  void onInit() {
    getOrderData();
    super.onInit();
  }
}

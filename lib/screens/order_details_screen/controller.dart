import 'dart:developer';

import 'package:get/get.dart';
import 'package:nectar/model/order_data_model.dart';

class OrderDetailsScreenController extends GetxController {
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
    log(orderId);
    if (orderId == orderDataModel.orderId) {
      _orderStatus = orderDataModel.orderStatus;
      _showTextFormField = false;
      update();
    }
  }
}

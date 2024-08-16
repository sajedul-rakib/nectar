import 'dart:convert';
import 'dart:developer';

import 'package:get/get.dart';
import 'package:nectar/model/order_data_model.dart';

class OrderDetailsScreenController extends GetxController {
  OrderDataModel orderDataModel = Get.arguments;

  @override
  void onInit() {
    log(jsonEncode(orderDataModel.toJson()));
    super.onInit();
  }
}

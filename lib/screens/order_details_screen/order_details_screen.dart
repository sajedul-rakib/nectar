import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nectar/screens/order_details_screen/controller.dart';
import 'package:nectar/utils/color.dart';

class OrderDetailsScreen extends GetView<OrderDetailsScreenController> {
  const OrderDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text("Order Details"),
        centerTitle: true,
      ),
    );
  }
}

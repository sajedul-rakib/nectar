import 'package:flutter/material.dart';
import 'package:nectar/utils/color.dart';

class OrderTrackingScreen extends StatelessWidget {
  const OrderTrackingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text("Orders"),
        centerTitle: true,
      ),
    );
  }
}

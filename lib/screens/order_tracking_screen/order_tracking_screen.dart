import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nectar/screens/order_tracking_screen/index.dart';
import 'package:nectar/screens/widgets/app_button.dart';
import 'package:nectar/screens/widgets/text_form_field.dart';
import 'package:nectar/utils/color.dart';

class OrderTrackingScreen extends GetView<OrderTrackingScreenController> {
  OrderTrackingScreen({super.key});

  final List<GlobalObjectKey<FormState>> formKeyList =
      List.generate(10, (index) => GlobalObjectKey<FormState>(index));

  final List<TextEditingController> controllers =
      List.generate(10, (index) => TextEditingController());

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text("Orders"),
        centerTitle: true,
      ),
      body: ListView.builder(
          itemCount: 10,
          itemBuilder: (context, index) {
            return Container(
              margin: const EdgeInsets.only(top: 10, left: 5, right: 5),
              padding: const EdgeInsets.all(10),
              width: size.width,
              decoration: BoxDecoration(
                  border: Border.all(width: 2.0, color: AppColors.blackColor)),
              child: Form(
                key: formKeyList[index],
                child: Column(
                  children: [
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Order: #123445677788"),
                        Text("Processing...")
                      ],
                    ),
                    InputFormField(
                      controller: controllers[index],
                      label: "Order id",
                      borderColor: AppColors.warningYellow,
                      validation: (value) {
                        if (value!.isNotEmpty) {
                          return "";
                        } else {
                          return 'Enter order your id without "#" this';
                        }
                      },
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                        width: size.width,
                        height: 50,
                        child: AppButton(
                          title: "Track my order",
                          backgroundColor: AppColors.warningYellow,
                          onPressed: () {
                            if (formKeyList[index].currentState?.validate() ??
                                true) {
                              log("track order $index");
                            }
                          },
                        ))
                  ],
                ),
              ),
            );
          }),
    );
  }
}

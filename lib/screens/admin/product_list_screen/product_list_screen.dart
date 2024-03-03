import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nectar/screens/admin/product_list_screen/controller.dart';
import 'package:nectar/screens/admin/product_list_screen/index.dart';
import 'package:nectar/utils/color.dart';

class ProductListScreen extends GetView<ProductListScreenController> {
  const ProductListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            automaticallyImplyLeading: false,
            centerTitle: true,
            backgroundColor: AppColors.backgroundColor,
            title: const Text(
              "Product List",
              style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                  color: AppColors.whiteColor),
            )),
        body: RefreshIndicator(
            child: controller.isProgressLoad
                ? const Center(
                    child: CircularProgressIndicator(
                    color: AppColors.backgroundColor,
                  ))
                : ListView.builder(
                    itemCount: controller.productList.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10.0, vertical: 4.0),
                        child: Card(
                          color: AppColors.shadowColor,
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Image.network(
                                  controller
                                      .productList[index].productShowImage!,
                                  width: 120,
                                  fit: BoxFit.contain,
                                ),
                                Text(
                                    controller.productList[index].productName!),
                                Row(
                                  children: [
                                    Text(controller
                                        .productList[index].productStock!),
                                    const SizedBox(
                                      width: 5.0,
                                    ),
                                    Text(controller
                                        .productList[index].productUnit!)
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    }),
            onRefresh: () {
              log("clear list");
              controller.productList.clear();
              return controller.getAllProduct();
            }));
  }
}

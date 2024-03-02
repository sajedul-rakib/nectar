import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nectar/screens/admin/admin_screen/index.dart';
import 'package:nectar/screens/admin/widgets/admin_text_input.dart';
import 'package:nectar/screens/widgets/app_button.dart';
import 'package:nectar/utils/color.dart';

class AdminScreen extends GetView<AdminScreenController> {
  const AdminScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Add Product",
          style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
              color: AppColors.whiteColor),
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.backgroundColor,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 20,
                ),
                AdminTextInput(
                  label: "Product Name",
                  controller: controller.productNameETController,
                ),
                const SizedBox(
                  height: 10,
                ),
                AdminTextInput(
                  label: "Product Description",
                  maxLine: 4,
                  controller: controller.productDetailETController,
                ),
                const SizedBox(
                  height: 10,
                ),
                AdminTextInput(
                  label: "Product quantity",
                  controller: controller.productQuantityETController,
                  prefixWidget: GetBuilder<AdminScreenController>(
                    builder: (controller) {
                      return DropdownButton(
                          dropdownColor: AppColors.shadowColor,
                          elevation: 0,
                          style: const TextStyle(
                              fontSize: 25.0,
                              color: AppColors.blackColor,
                              fontWeight: FontWeight.w500),
                          value: controller.unitName,
                          hint: const Text("Select Unit"),
                          items: const [
                            DropdownMenuItem(
                              value: "kg",
                              child: Text("kg"),
                            ),
                            DropdownMenuItem(
                              value: "piece",
                              child: Text("piece"),
                            ),
                          ],
                          onChanged: (value) {
                            if (value != null) {
                              controller.changeUnit(value);
                            }
                          });
                    },
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                AdminTextInput(
                  label: "Price",
                  controller: controller.productPriceETController,
                ),
                const SizedBox(
                  height: 10,
                ),
                AdminTextInput(
                  label: "Nutrition",
                  controller: controller.productNutritionETController,
                ),
                const SizedBox(
                  height: 10,
                ),
                GetBuilder<AdminScreenController>(builder: (controller) {
                  return DropdownButton(
                      value: controller.category,
                      dropdownColor: AppColors.shadowColor,
                      elevation: 0,
                      style: const TextStyle(
                          fontSize: 25.0,
                          color: AppColors.blackColor,
                          fontWeight: FontWeight.w500),
                      hint: const Text("Select Category"),
                      items: const [
                        DropdownMenuItem(
                          value: "Fresh Fruit & Vegetable",
                          child: Text("Fresh Fruit & Vegetable"),
                        ),
                        DropdownMenuItem(
                          value: "Cooking Oil & Ghee",
                          child: Text("Cooking Oil & Ghee"),
                        ),
                        DropdownMenuItem(
                          value: "Meat & Fish",
                          child: Text("Meat & Fish"),
                        ),
                        DropdownMenuItem(
                          value: "Bakery & Snacks",
                          child: Text("Bakery & Snacks"),
                        ),
                        DropdownMenuItem(
                          value: "Dairy & Eggs",
                          child: Text("Dairy & Eggs"),
                        ),
                        DropdownMenuItem(
                          value: "Beverage",
                          child: Text("Beverage"),
                        ),
                      ],
                      onChanged: (value) {
                        if (value != null) {
                          controller.changeCategory(value);
                        }
                      });
                }),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    const Text(
                      "Upload Product Images",
                      style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.w700,
                          color: AppColors.shadowTextColor),
                    ),
                    TextButton(
                        onPressed: () {
                          controller.pickImages();
                        },
                        child: const Text(
                          "Upload",
                          style: TextStyle(
                              fontSize: 18.0,
                              color: AppColors.blackColor,
                              fontWeight: FontWeight.w700),
                        )),
                  ],
                ),
                GetBuilder<AdminScreenController>(builder: (controller) {
                  return Container(
                    width: double.infinity,
                    height: 200,
                    decoration: BoxDecoration(
                        border:
                            Border.all(color: AppColors.blackColor, width: 2.0),
                        borderRadius: BorderRadius.circular(10)),
                    child: GridView.builder(
                        itemCount: controller.productImages.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2),
                        itemBuilder: (context, index) {
                          return Image.file(
                              File(controller.productImages[index].path));
                        }),
                  );
                }),
                const SizedBox(
                  height: 20,
                ),
                Center(
                  child: SizedBox(
                      height: 50,
                      width: 300,
                      child: AppButton(
                        title: "Add Product",
                        onPressed: () => controller.uploadProducts(
                            productName:
                                controller.productNameETController.text.trim(),
                            productDetails: controller
                                .productDetailETController.text
                                .trim(),
                            productPrice:
                                controller.productPriceETController.text.trim(),
                            productQuantiy: controller
                                .productQuantityETController.text
                                .trim(),
                            nutrition: controller
                                .productNutritionETController.text
                                .trim()),
                      )),
                ),
                const SizedBox(
                  height: 20.0,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

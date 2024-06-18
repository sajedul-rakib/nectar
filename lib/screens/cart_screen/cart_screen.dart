import 'dart:convert';
import 'dart:developer';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nectar/routes/route_name.dart';
import 'package:nectar/screens/cart_screen/index.dart';
import 'package:nectar/screens/widgets/app_button.dart';
import 'package:nectar/screens/widgets/stepper.dart';
import 'package:nectar/utils/color.dart';

class CartScreen extends GetView<CartScreenController> {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    num totalPrice = 0;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "My Cart",
          style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: controller.checkUserAreLogged
          ? InkWell(
              onTap:  () => paymentDialog(context, controller.totalPrice),
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 60,
                margin: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
                decoration: BoxDecoration(
                    color: AppColors.backgroundColor,
                    borderRadius: BorderRadius.circular(20)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const SizedBox(),
                    const Text(
                      "Go to Checkout",
                      style: TextStyle(
                          fontSize: 18.0,
                          color: AppColors.whiteColor,
                          fontWeight: FontWeight.w700),
                    ),
                    Chip(
                      label: GetBuilder<CartScreenController>(
                          builder: (controller) {
                        return Text(
                          "\$${controller.totalPrice}",
                          style: const TextStyle(
                              fontWeight: FontWeight.w700,
                              color: AppColors.whiteColor,
                              fontSize: 18.0),
                        );
                      }),
                      elevation: 0,
                      backgroundColor: AppColors.chipColor,
                      side: BorderSide.none,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                    )
                  ],
                ),
              ),
            )
          : const Center(),
      body: controller.checkUserAreLogged
          ? GetBuilder<CartScreenController>(builder: (controller) {
              return RefreshIndicator(
                onRefresh: () {
                  controller.cartData.clear();
                  controller.update();
                  return controller.getCartList();
                },
                child: ListView.builder(
                    itemCount: controller.cartData.length,
                    itemBuilder: (context, index) {
                      return Stack(
                        alignment: Alignment.topLeft,
                        children: [
                          InkWell(
                            onLongPress: () {
                              controller.enabledMultiSelection = true;
                              controller.selectCart(controller.cartData[index]);
                            },
                            child: Container(
                              padding: const EdgeInsets.all(5.0),
                              margin: const EdgeInsets.only(
                                  left: 8.0, right: 8.0, bottom: 8.0),
                              decoration: BoxDecoration(
                                color: AppColors.shadowColor,
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                              child: SizedBox(
                                width: MediaQuery.of(context).size.width,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        ClipRRect(
                                          child: Image.network(
                                            '${controller.cartData[index].productShowImage}',
                                            width: 100,
                                            fit: BoxFit.contain,
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      AutoSizeText(
                                                        "${controller.cartData[index].productName}",
                                                        style: const TextStyle(
                                                            color: AppColors
                                                                .blackColor,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w700),
                                                        maxLines: 2,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        maxFontSize: 18,
                                                        minFontSize: 14.0,
                                                      ),
                                                      Text(
                                                        "${controller.cartData[index].totalOrderProduct},${controller.cartData[index].productUnit}",
                                                        style: const TextStyle(
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            color: AppColors
                                                                .shadowTextColor,
                                                            fontSize: 16.0),
                                                      ),
                                                    ],
                                                  ),
                                                  SizedBox(
                                                    width: 100,
                                                    height: 50,
                                                    child: ProductStepper(
                                                        counter: controller
                                                            .cartData[index]
                                                            .totalOrderProduct!,
                                                        plusMethod: () {},
                                                        minusMethod: () {}),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: SizedBox(
                                        height: 80,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            InkWell(
                                              onTap: () {
                                                cartDeleteDialog(
                                                    context, controller, index);
                                              },
                                              child: const Icon(
                                                  CupertinoIcons.multiply),
                                            ),
                                            Text(
                                              "\$${controller.cartData[index].productPrice}",
                                              style: const TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 18.0,
                                                  color: AppColors.blackColor),
                                            )
                                          ],
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                          GetBuilder<CartScreenController>(
                              builder: (controller) {
                            return Visibility(
                                visible: controller.isdMultiSelection,
                                child: InkWell(
                                  onTap: () => controller
                                      .selectCart(controller.cartData[index]),
                                  child: Icon(
                                    controller.selectedCart.contains(
                                            controller.cartData[index])
                                        ? Icons.check_circle_outline
                                        : Icons.circle_outlined,
                                    size: 40,
                                    color: AppColors.backgroundColor,
                                  ),
                                ));
                          }),
                        ],
                      );
                    }),
              );
            })
          : Center(
              child: SizedBox(
                width: 250,
                height: 60,
                child: AppButton(
                  title: "Log in First",
                  onPressed: () {
                    Get.toNamed(RouteName.logInScreen);
                  },
                ),
              ),
            ),
    );
  }

  Future<dynamic> cartDeleteDialog(
      BuildContext context, CartScreenController controller, int index) {
    return showDialog(
        context: context,
        builder: (context) {
          return Center(
            child: Container(
              padding: const EdgeInsets.all(10),
              width: 250,
              height: 150,
              decoration: BoxDecoration(
                  color: AppColors.shadowColor,
                  borderRadius: BorderRadius.circular(10)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Are you sure? you want to remove this product",
                    style:
                        TextStyle(fontSize: 18.0, fontWeight: FontWeight.w600),
                    textAlign: TextAlign.center,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AppButton(
                        title: "No",
                        backgroundColor: AppColors.failureRed,
                        onPressed: () => Get.back(),
                      ),
                      AppButton(
                        backgroundColor: AppColors.successGreen,
                        title: "Yes",
                        onPressed: () async {
                          bool isDeleted = await controller.removeCart(
                              cartData: controller.cartData[index]);
                          if (isDeleted) {
                            controller.cartData.clear();
                            controller.getCartList();
                            controller.update();
                            Get.back();
                            if (context.mounted) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content: Text("Cart deleted")));
                            }
                          }
                        },
                      ),
                    ],
                  )
                ],
              ),
            ),
          );
        });
  }

  Future<dynamic> paymentDialog(BuildContext context, num totalPrice) {
    return showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 2,
            decoration: const BoxDecoration(
                color: AppColors.whiteColor,
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20),
                    topLeft: Radius.circular(20))),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 16.0, horizontal: 12.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Checkout",
                          style: TextStyle(
                              fontSize: 24.0,
                              fontWeight: FontWeight.w600,
                              color: AppColors.blackColor),
                        ),
                        InkWell(
                            onTap: () {
                              Get.back();
                            },
                            child: const Icon(
                              CupertinoIcons.multiply,
                              size: 32.0,
                              color: AppColors.blackColor,
                            )),
                      ],
                    ),
                  ),
                  const Divider(),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 10,
                        ),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Delivery",
                              style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 18.0,
                                  color: AppColors.shadowTextColor),
                            ),
                            Row(
                              children: [
                                Text(
                                  "Select Method",
                                  style: TextStyle(
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.w700,
                                      color: AppColors.blackColor),
                                ),
                                Icon(CupertinoIcons.right_chevron)
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Divider(),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Payment",
                              style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 18.0,
                                  color: AppColors.shadowTextColor),
                            ),
                            Row(
                              children: [
                                Chip(
                                  side: BorderSide.none,
                                  backgroundColor: AppColors.chipColor,
                                  label: Text(
                                    "COD",
                                    style: TextStyle(
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.w700,
                                        color: AppColors.whiteColor),
                                  ),
                                ),
                                SizedBox(
                                  width: 5.0,
                                ),
                                Icon(CupertinoIcons.right_chevron)
                              ],
                            ),
                          ],
                        ),
                        const Divider(),
                        const SizedBox(
                          height: 10,
                        ),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Promo Code",
                              style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 18.0,
                                  color: AppColors.shadowTextColor),
                            ),
                            Row(
                              children: [
                                Text(
                                  "Pick Discount",
                                  style: TextStyle(
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.w700,
                                      color: AppColors.blackColor),
                                ),
                                Icon(CupertinoIcons.right_chevron)
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Divider(),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              "Total Cost",
                              style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 18.0,
                                  color: AppColors.shadowTextColor),
                            ),
                            Row(
                              children: [
                                Text(
                                  "\$$totalPrice",
                                  style: const TextStyle(
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.w700,
                                      color: AppColors.blackColor),
                                ),
                                const Icon(CupertinoIcons.right_chevron)
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Divider(),
                      ],
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.0),
                    child: Text(
                      "By placing an order you agree to our\nTerms And Conditions",
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 14.0,
                          color: AppColors.shadowTextColor),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                   Center(
                    child: SizedBox(
                        width: 280,
                        height: 50,
                        child: AppButton(title: "Place Order",onPressed: (){
                          log(jsonEncode({

                          }));
                        },)),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          );
        });
  }
}

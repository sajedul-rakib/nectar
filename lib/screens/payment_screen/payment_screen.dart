import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nectar/screens/payment_screen/index.dart';
import 'package:nectar/screens/widgets/app_button.dart';
import 'package:nectar/utils/color.dart';

class PaymentScreen extends GetView<PaymentScreenController> {
  PaymentScreen({super.key});

  //product category
  final List<Map<String, String>> _paymentMethod = [
    {
      "method": "Cash on Delivery",
      "value": "COD",
      "logo": "assets/images/cod.png"
    },
    {"method": "Bkash", "value": "bKash", "logo": "assets/images/bkash.png"},
    {"method": "Nogod", "value": "Nogod", "logo": "assets/images/nogod.png"},
    {"method": "Rocket", "value": "Rocket", "logo": "assets/images/rocket.png"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.whiteColor,
        appBar: AppBar(
          title: const Text("Payment"),
          centerTitle: true,
          backgroundColor: Colors.transparent,
        ),
        body: SafeArea(
          child: GetBuilder<PaymentScreenController>(builder: (controller) {
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Delivered to :",
                      style: TextStyle(fontSize: 18),
                    ),
                    Text(
                      "${controller.userModel.fullName}",
                      style: const TextStyle(
                          fontSize: 22, fontWeight: FontWeight.w700),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      "Delivery address :",
                      style: TextStyle(fontSize: 18),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      padding: const EdgeInsets.all(8.0),
                      decoration:
                          const BoxDecoration(color: AppColors.shadowColor),
                      child: Text(
                        "${controller.userModel.address}",
                        style: const TextStyle(
                            fontSize: 22, fontWeight: FontWeight.w500),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                        "Another reicept send to ${controller.userModel.email}"),
                    const SizedBox(
                      height: 5,
                    ),
                    Text("Email to : ${controller.userModel.email}"),
                    const Divider(
                      height: 10,
                      thickness: 2,
                    ),
                    ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: controller.cartData.length,
                        itemBuilder: (_, index) {
                          return Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              margin: const EdgeInsets.symmetric(horizontal: 2),
                              padding: const EdgeInsets.all(8.0),
                              decoration: const BoxDecoration(
                                  color: AppColors.shadowColor),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  (controller.cartData[index]
                                                  .productShowImage !=
                                              '' &&
                                          controller.cartData[index]
                                                  .productShowImage !=
                                              null)
                                      ? Image.network(
                                          controller.cartData[index]
                                              .productShowImage!,
                                          width: 70,
                                          height: 70,
                                        )
                                      : const Icon(Icons.access_alarm_outlined),
                                  Column(
                                    children: [
                                      const Text(
                                        "Qty :",
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      Text(
                                        "${controller.cartData[index].totalOrderProduct}",
                                        style: const TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      controller.cartData[index].discount != 0
                                          ? Container(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 5.0),
                                              width: 120,
                                              height: 30,
                                              decoration: BoxDecoration(
                                                color: AppColors.shadowTextColor
                                                    .withOpacity(.2),
                                              ),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                    "${controller.cartData[index].productPrice}",
                                                    style: const TextStyle(
                                                        fontSize: 18,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        decoration:
                                                            TextDecoration
                                                                .lineThrough),
                                                  ),
                                                  const SizedBox(
                                                    width: 4.0,
                                                  ),
                                                  Text(
                                                    "-${controller.cartData[index].discount}%",
                                                    style: const TextStyle(
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        decoration:
                                                            TextDecoration
                                                                .lineThrough),
                                                  ),
                                                ],
                                              ),
                                            )
                                          : const SizedBox(),
                                      Text(
                                        "${controller.cartData[index].productPrice! - (controller.cartData[index].discount! / 100) * controller.cartData[index].productPrice!}",
                                        style: const TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          );
                        }),
                    const SizedBox(
                      height: 10.0,
                    ),
                    const Divider(
                      height: 10,
                      thickness: 2,
                    ),
                    const SizedBox(
                      height: 5.0,
                    ),
                    const Text(
                      "Select payment method :",
                      style: TextStyle(fontSize: 18),
                    ),
                    const SizedBox(
                      height: 5.0,
                    ),
                    InputDecorator(
                      decoration: InputDecoration(
                          filled: true,
                          fillColor: AppColors.whiteColor,
                          contentPadding: const EdgeInsets.all(5),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10))),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton(
                          focusColor: Colors.transparent,
                          isDense: true,
                          isExpanded: true,
                          value: controller.selectedPaymentMethod,
                          menuMaxHeight: 300,
                          items: [
                            const DropdownMenuItem(
                              value: '',
                              child: Text("Select Payment Method"),
                            ),
                            ..._paymentMethod
                                .map<DropdownMenuItem<String>>((data) {
                              return DropdownMenuItem(
                                  value: data["value"],
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(data["method"]!),
                                      Image.asset(
                                        data["logo"]!,
                                        height: 80,
                                        width: 80,
                                        fit: BoxFit.contain,
                                      )
                                    ],
                                  ));
                            })
                          ],
                          onChanged: (String? value) {
                            if (controller.selectedPaymentMethod != value) {
                              controller.paymentMethod = value!;
                              controller.update();
                            } else {
                              log("It was selected");
                            }
                          },
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    const Text(
                      "Total pay :",
                      style: TextStyle(fontSize: 18),
                    ),
                    const SizedBox(
                      height: 5.0,
                    ),
                    Container(
                        width: MediaQuery.of(context).size.width,
                        padding: const EdgeInsets.all(8.0),
                        decoration:
                            const BoxDecoration(color: AppColors.shadowColor),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  "Total Price :",
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500),
                                ),
                                Text("\$${controller.totalPrice}",
                                    style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500))
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            const Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Delivery Fee :",
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500),
                                ),
                                Text("\$20",
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500))
                              ],
                            ),
                            const Divider(
                              height: 10,
                              thickness: 2,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  "Total Payment :",
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500),
                                ),
                                Text("\$${controller.totalPrice + 20}",
                                    style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500))
                              ],
                            ),
                          ],
                        )),
                    const SizedBox(
                      height: 10,
                    ),
                    Center(
                      child: SizedBox(
                        width: 300,
                        height: 50,
                        child: AppButton(
                          title: "Place Order",
                          onPressed: () {
                            controller.placeOrder();
                          },
                          backgroundColor: AppColors.successGreen,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
            );
          }),
        ));
  }
}

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
              onTap: () {
                showModalBottomSheet(
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
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
                              const Padding(
                                padding: EdgeInsets.symmetric(horizontal: 16.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
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
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Divider(),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
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
                                              backgroundColor:
                                                  AppColors.chipColor,
                                              label: Text(
                                                "COD",
                                                style: TextStyle(
                                                    fontSize: 18.0,
                                                    fontWeight: FontWeight.w700,
                                                    color:
                                                        AppColors.whiteColor),
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
                                    Divider(),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
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
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Divider(),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "Total Cost",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w700,
                                              fontSize: 18.0,
                                              color: AppColors.shadowTextColor),
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              "\$120",
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
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Divider(),
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
                              const Center(
                                child: SizedBox(
                                    width: 280,
                                    height: 50,
                                    child: AppButton(title: "Place Order")),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                            ],
                          ),
                        ),
                      );
                    });
              },
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
                      label: const Text(
                        "\$120",
                        style: TextStyle(
                            fontWeight: FontWeight.w700,
                            color: AppColors.whiteColor,
                            fontSize: 18.0),
                      ),
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
          ? Column(
              children: [
                const Divider(),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          ClipRRect(
                            child: Image.asset(
                              'assets/images/apple.png',
                              width: 100,
                              fit: BoxFit.contain,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          width: 180,
                                          child: AutoSizeText(
                                            "Natural Red Apple Natural Red Apple  Natural Red Apple  ",
                                            style: TextStyle(
                                                color: AppColors.blackColor,
                                                fontWeight: FontWeight.w700),
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                            maxFontSize: 18,
                                            minFontSize: 14.0,
                                          ),
                                        ),
                                        Text(
                                          "4,Price",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w600,
                                              color: AppColors.shadowTextColor,
                                              fontSize: 16.0),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      width: 150,
                                      height: 50,
                                      child: ProductStepper(
                                          counter: 1,
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
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: SizedBox(
                          height: 80,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              InkWell(
                                child: Icon(CupertinoIcons.multiply),
                              ),
                              Text(
                                "\$12",
                                style: TextStyle(
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
                const Divider()
              ],
            )
          : Center(
              child: SizedBox(
                width: 250,
                height: 60,
                child: AppButton(
                  title: "Log in First",
                  onPressed: () {
                    Get.toNamed(RouteName.LOGIN_SCREEN);
                  },
                ),
              ),
            ),
    );
  }
}

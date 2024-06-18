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
      floatingActionButton:
          GetBuilder<CartScreenController>(builder: (controller) {
        return controller.checkUserAreLogged
            ? controller.selectedCart.isNotEmpty
                ? InkWell(
                    onTap: () => Get.toNamed(RouteName.paymentScreen,
                        arguments: controller.selectedCart),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: 60,
                      margin: const EdgeInsets.only(
                          left: 20, right: 20, bottom: 20),
                      decoration: BoxDecoration(
                          color: AppColors.backgroundColor,
                          borderRadius: BorderRadius.circular(20)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          const SizedBox(),
                          Text(
                            "Proceed to Checkout (${controller.selectedCart.length})",
                            style: const TextStyle(
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
                : const Center()
            : const Center();
      }),
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
}

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nectar/routes/route_name.dart';
import 'package:nectar/screens/product_detail_screen/controller.dart';
import 'package:nectar/screens/widgets/app_button.dart';
import 'package:nectar/screens/widgets/rating_bar.dart';
import 'package:nectar/screens/widgets/slider.dart';
import 'package:nectar/screens/widgets/stepper.dart';
import 'package:nectar/utils/color.dart';

class ProductDetailScreen extends GetView<ProductDetailScreenController> {
  const ProductDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${controller.product.productName}"),
        centerTitle: true,
      ),
      backgroundColor: AppColors.whiteColor,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 3,
              child: Container(
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                    color: Color(0xffF2F3F2),
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(30),
                        bottomRight: Radius.circular(30))),
                child: Center(
                  child: ProductSlider(
                    carouselData: controller.product.productImages!,
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 5,
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 30,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              AutoSizeText(
                                controller.product.productName ?? "",
                                style: const TextStyle(
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.blackColor),
                                maxLines: 3,
                                overflow: TextOverflow.ellipsis,
                                maxFontSize: 20.0,
                                minFontSize: 16.0,
                              ),
                              Text(
                                "${controller.product.productUnit ?? " "}, price",
                                style: const TextStyle(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.shadowTextColor),
                              )
                            ],
                          ),
                          Obx(() => controller.addFavouriteLoader
                              ? const CircularProgressIndicator()
                              : IconButton(
                                  onPressed: () {
                                    controller.addFavouriteProducts(
                                        controller.product);
                                  },
                                  icon: const Icon(
                                    CupertinoIcons.heart,
                                    color: AppColors.shadowTextColor,
                                    weight: 10,
                                  )))
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GetBuilder<ProductDetailScreenController>(
                              builder: (controller) => ProductStepper(
                                    counter: controller.productCount,
                                    plusMethod: controller.plusMethod,
                                    minusMethod: controller.minusMethod,
                                  )),
                          Column(
                            children: [
                              Text("\$${controller.product.productPrice}"),
                              Text(
                                "\$${controller.product.productPrice! - ((controller.product.discount! / 100) * controller.product.productPrice!)}",
                                style: const TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 30.0,
                                    color: AppColors.blackColor),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      controller.product.productStock! < 5
                          ? Center(
                              child: Text(
                                "This product are limited,this product only have ${controller.product.productStock} ${controller.product.productUnit}",
                                style: const TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 18.0,
                                    color: Colors.red),
                              ),
                            )
                          : const Center(),
                      const SizedBox(
                        height: 10,
                      ),
                      const Divider(),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 10,
                          ),
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Product Details",
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.blackColor,
                                    fontSize: 20.0),
                              ),
                              Icon(
                                CupertinoIcons.chevron_down,
                                color: AppColors.blackColor,
                              )
                            ],
                          ),
                          Text(
                            controller.product.productDescription ?? "",
                            style: const TextStyle(
                                fontSize: 16.0,
                                color: AppColors.shadowTextColor,
                                fontWeight: FontWeight.w500),
                            textAlign: TextAlign.justify,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Divider()
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Nutrition's",
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                color: AppColors.blackColor,
                                fontSize: 20.0),
                          ),
                          Row(
                            children: [
                              Chip(
                                label: Text(
                                  "\$${controller.product.nutrition ?? "0"} gm",
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w700,
                                      color: AppColors.shadowTextColor,
                                      fontSize: 14.0),
                                ),
                                shape: RoundedRectangleBorder(
                                    side: const BorderSide(
                                        width: 0, color: Colors.transparent),
                                    borderRadius: BorderRadius.circular(10)),
                                elevation: 0,
                                backgroundColor: const Color(0xffF2F3F2),
                              ),
                              const SizedBox(
                                width: 20.0,
                              ),
                              const Icon(
                                CupertinoIcons.chevron_right,
                                color: AppColors.blackColor,
                              )
                            ],
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Divider(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Rating",
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                color: AppColors.blackColor,
                                fontSize: 20.0),
                          ),
                          ProductRatingBar(
                            rating:
                                controller.product.rating?.toDouble() ?? 0.0,
                            itemSize: 22.0,
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Center(
                          child: SizedBox(
                              width: 250,
                              height: 60,
                              child: AppButton(
                                title: controller.checkUserAreLogged
                                    ? "Add To Basket"
                                    : "Log In",
                                onPressed: controller.checkUserAreLogged
                                    ? () async {
                                        bool result =
                                            await controller.addToCart(
                                                product: controller.product);

                                        if (result) {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(const SnackBar(
                                                  content: Text(
                                                      "Add to the cart")));
                                        }
                                      }
                                    : () {
                                        Get.toNamed(RouteName.logInScreen);
                                      },
                              ))),
                      const SizedBox(
                        height: 20,
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

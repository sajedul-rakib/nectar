import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nectar/screens/product_detail_screen/controller.dart';
import 'package:nectar/screens/widgets/app_button.dart';
import 'package:nectar/screens/widgets/rating_bar.dart';
import 'package:nectar/screens/widgets/slider.dart';
import 'package:nectar/screens/widgets/snack_bar.dart';
import 'package:nectar/screens/widgets/stepper.dart';
import 'package:nectar/utils/color.dart';

class ProductDetailScreen extends GetView<ProductDetailScreenController> {
  const ProductDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: Column(
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 50,
                  ),
                  IconButton(
                      onPressed: () {
                        Get.back();
                      },
                      icon: const Icon(
                        CupertinoIcons.chevron_back,
                        color: AppColors.blackColor,
                      )),
                  Center(
                    child: ProductSlider(
                      carouselData: controller.product.productImage,
                      currentBannerIndex: controller.productSliderBannerIndex,
                      changeIndex: controller.changeIndex,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 4,
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: 300,
                              child: AutoSizeText(
                                controller.product.productName ?? "",
                                style: const TextStyle(
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.blackColor),
                                maxLines: 3,
                                overflow: TextOverflow.ellipsis,
                                maxFontSize: 20.0,
                                minFontSize: 16.0,
                              ),
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
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              CupertinoIcons.heart,
                              color: AppColors.shadowTextColor,
                              weight: 10,
                            ))
                      ],
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
                        Text(
                          "\$${controller.product.productPrice ?? "0"}",
                          style: const TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 30.0,
                              color: AppColors.blackColor),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Divider(),
                    Column(
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
                          "Nutritions",
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
                          "Nutritions",
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              color: AppColors.blackColor,
                              fontSize: 20.0),
                        ),
                        ProductRatingBar(
                          rating: controller.product.rating?.toDouble() ?? 0.0,
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
                              title: "Add To Basket",
                              onPressed: () {
                                snackBar(
                                    title: "Warning",
                                    message: "This is warning for you",
                                    contentType: 'fail');
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
    );
  }
}

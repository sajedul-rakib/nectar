import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nectar/routes/route_name.dart';
import 'package:nectar/screens/home_screen/controller.dart';
import 'package:nectar/screens/widgets/product_cart.dart';
import 'package:nectar/screens/widgets/slider.dart';
import 'package:nectar/utils/color.dart';

class HomeScreen extends GetView<HomeScreenController> {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.backgroundColor,
        title: Image.asset(
          'assets/images/logo.png',
          width: 120,
          fit: BoxFit.contain,
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: TextFormField(
                decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.search_rounded),
                    border: OutlineInputBorder(
                        borderSide: const BorderSide(
                            width: 1, color: AppColors.shadowTextColor),
                        borderRadius: BorderRadius.circular(10)),
                    hintText: "Search here"),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            //slider view
            GetBuilder<HomeScreenController>(builder: (controller) {
              return controller.sliderDataLoader
                  ? const Center(
                      child: CircularProgressIndicator(
                        color: AppColors.backgroundColor,
                        strokeWidth: 2.0,
                      ),
                    )
                  : ProductSlider(
                      carouselData: controller.carouselData,
                      autoPlay: true,
                    );
            }),
            Column(
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Exclusive Offer",
                        style: TextStyle(
                          fontSize: 22.0,
                          color: AppColors.blackColor,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      TextButton(
                          onPressed: null,
                          child: Text(
                            "See All",
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 16.0,
                                color: AppColors.backgroundColor),
                          )),
                    ],
                  ),
                ),
                GetBuilder<HomeScreenController>(builder: (controller) {
                  return controller.exclusiveOfferDataLoader
                      ? const Center(
                          child: CircularProgressIndicator(
                            color: AppColors.backgroundColor,
                            strokeWidth: 2.0,
                          ),
                        )
                      : SizedBox(
                          height: 300,
                          width: double.infinity,
                          child: GetBuilder<HomeScreenController>(
                              builder: (controller) {
                            return ListView.builder(
                                scrollDirection: Axis.horizontal,
                                shrinkWrap: true,
                                itemCount:
                                    controller.exclusiveOfferProduct.length,
                                itemBuilder: (context, index) {
                                  return ProductCart(
                                    product:
                                        controller.exclusiveOfferProduct[index],
                                  );
                                });
                          }),
                        );
                })
              ],
            ),
            Column(
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Best Selling",
                        style: TextStyle(
                          fontSize: 22.0,
                          color: AppColors.blackColor,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      TextButton(
                          onPressed: null,
                          child: Text(
                            "See All",
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 16.0,
                                color: AppColors.backgroundColor),
                          )),
                    ],
                  ),
                ),
                GetBuilder<HomeScreenController>(builder: (controller) {
                  return controller.bestSellingDataLoader
                      ? const Center(
                          child: CircularProgressIndicator(
                            color: AppColors.backgroundColor,
                            strokeWidth: 2.0,
                          ),
                        )
                      : SizedBox(
                          height: 300,
                          width: double.infinity,
                          child: GetBuilder<HomeScreenController>(
                              builder: (controller) {
                            return ListView.builder(
                                scrollDirection: Axis.horizontal,
                                // physics: const NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: controller.bestSellingProduct.length,
                                itemBuilder: (context, index) {
                                  return ProductCart(
                                    product:
                                        controller.bestSellingProduct[index],
                                  );
                                });
                          }),
                        );
                })
              ],
            ),
            Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                 Padding(
                  padding:const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                     const Text(
                        "Groceries",
                        style: TextStyle(
                          fontSize: 22.0,
                          color: AppColors.blackColor,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      TextButton(
                          onPressed: (){
                            Get.toNamed(RouteName.categorySearchScreen,arguments: "Fresh Fruits & Vegetable");
                          },
                          child:const Text(
                            "See All",
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 16.0,
                                color: AppColors.backgroundColor),
                          )),
                    ],
                  ),
                ),
                GetBuilder<HomeScreenController>(builder: (controller) {
                  return controller.groceriesDataLoader
                      ? const Center(
                          child: CircularProgressIndicator(
                            color: AppColors.backgroundColor,
                            strokeAlign: 2.0,
                          ),
                        )
                      : SizedBox(
                          height: 300,
                          width: double.infinity,
                          child: GetBuilder<HomeScreenController>(
                              builder: (controller) {
                            return ListView.builder(
                                scrollDirection: Axis.horizontal,
                                // physics: const NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: controller.groceriesProduct.length,
                                itemBuilder: (context, index) {
                                  return ProductCart(
                                    product: controller.groceriesProduct[index],
                                  );
                                });
                          }),
                        );
                })
              ],
            ),
            const SizedBox(
              height: 20,
            )
          ],
        ),
      ),
    );
  }
}

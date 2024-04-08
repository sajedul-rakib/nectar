import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nectar/screens/search_with_category_screen/index.dart';
import 'package:nectar/screens/widgets/product_cart.dart';
import 'package:nectar/utils/color.dart';
import 'package:nectar/utils/responsive.dart';

class CategorySearchScreen extends GetView<CategorySearchScreenController> {
  const CategorySearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          controller.title,
          style: const TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
      ),
      body: Scaffold(
        body: RefreshIndicator(
          color: AppColors.backgroundColor,
          onRefresh: () {
            return controller.getProductDataByCategory(controller.title);
          },
          child: Center(child: GetBuilder<CategorySearchScreenController>(
            builder: (controller) {
              return controller.pageLoader
                  ? const CircularProgressIndicator(
                      color: AppColors.backgroundColor,
                      strokeWidth: 2,
                    )
                  : controller.productList.isEmpty
                      ? const Center(
                          child: Text("Therer are no products founds here"),
                        )
                      : Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: GridView.builder(
                            itemCount: controller.productList.length,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                    mainAxisSpacing: 10,
                                    childAspectRatio: .7,
                                    crossAxisSpacing: 10,
                                    crossAxisCount:
                                        Responsive.isTablet(context) ? 4 : 2),
                            itemBuilder: (_, index) => ProductCart(
                              product: controller.productList[index],
                            ),
                          ),
                        );
            },
          )),
        ),
      ),
    );
  }
}

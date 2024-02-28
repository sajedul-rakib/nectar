import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nectar/screens/explore_screen/category_data.dart';
import 'package:nectar/screens/explore_screen/controller.dart';

import '../../utils/color.dart';

class ExploreScreen extends GetView<ExploreScreenController> {
  const ExploreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Find products by category",
          style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
      ),
      body: Scaffold(
        body: Center(
            child: GridView.builder(
                itemCount: controller.categoryData.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: .8, crossAxisCount: 2),
                itemBuilder: (context, index) => CategoryCart(
                    categoryDataModel: controller.categoryData[index]))),
      ),
    );
  }
}

class CategoryCart extends StatelessWidget {
  const CategoryCart({
    super.key,
    required this.categoryDataModel,
  });

  final CategoryDataModel categoryDataModel;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        height: 220,
        width: 220,
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: categoryDataModel.backgroundColor,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
                width: 1,
                color: categoryDataModel.borderColor ?? AppColors.shadowColor)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Image.asset(
                "${categoryDataModel.picAddress}",
                width: 180,
                fit: BoxFit.contain,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              categoryDataModel.categoryTitle ?? "",
              style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: AppColors.blackColor,
                  fontSize: 18.0),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

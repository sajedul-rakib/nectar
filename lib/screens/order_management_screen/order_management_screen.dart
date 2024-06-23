import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nectar/routes/route_name.dart';
import 'package:nectar/screens/order_management_screen/index.dart';
import 'package:nectar/screens/widgets/app_button.dart';
import 'package:nectar/screens/widgets/custom_progress_indicator.dart';
import 'package:nectar/utils/color.dart';

class OrderTrackingScreen extends GetView<OrderTrackingScreenController> {
  const OrderTrackingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
        backgroundColor: AppColors.whiteColor,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: const Text("Order Management"),
          centerTitle: true,
        ),
        body: GetBuilder<OrderTrackingScreenController>(builder: (controller) {
          return controller.pageLoader
              ? const Center(
                  child: CustomProgressIndicator(),
                )
              : ListView.builder(
                  itemCount: controller.orderData.length,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: const EdgeInsets.only(top: 10, left: 5, right: 5),
                      padding: const EdgeInsets.all(10),
                      width: size.width,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: AppColors.shadowColor,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Order: #${controller.orderData[index].orderId}",
                            style: const TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w600),
                          ),
                          const Text(
                            "Items :",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w500),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          SizedBox(
                            height: 120,
                            child: ListView.builder(
                                itemCount:
                                    controller.orderData[index].items!.length,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, listIndex) {
                                  return Padding(
                                    padding: const EdgeInsets.only(left: 8.0),
                                    child: Column(
                                      children: [
                                        Image.network(
                                          "${controller.orderData[index].items![listIndex].productShowImage}",
                                          width: 100,
                                          height: 100,
                                        ),
                                        SizedBox(
                                          width: 100,
                                          child: Text(
                                              "${controller.orderData[index].items![listIndex].productName}",
                                              style: const TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w500,
                                                  overflow:
                                                      TextOverflow.ellipsis)),
                                        ),
                                      ],
                                    ),
                                  );
                                }),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          SizedBox(
                              width: size.width,
                              height: 50,
                              child: AppButton(
                                title: "Manage order",
                                backgroundColor: AppColors.warningYellow,
                                onPressed: () {
                                  Get.toNamed(RouteName.orderDetailsScreen,
                                      arguments: controller.orderData[index]);
                                },
                              ))
                        ],
                      ),
                    );
                  });
        }));
  }
}

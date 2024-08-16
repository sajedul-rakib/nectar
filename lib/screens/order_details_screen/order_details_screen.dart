import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nectar/screens/order_details_screen/controller.dart';
import 'package:nectar/screens/widgets/app_button.dart';
import 'package:nectar/screens/widgets/text_form_field.dart';
import 'package:nectar/utils/color.dart';

class OrderDetailsScreen extends GetView<OrderDetailsScreenController> {
  OrderDetailsScreen({super.key});

  final TextEditingController _orderIdETController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.whiteColor,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: const Text("Order Details"),
          centerTitle: true,
        ),
        body: SafeArea(
            child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Order details :",
                  style: TextStyle(fontSize: 18),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  padding: const EdgeInsets.all(8.0),
                  decoration: const BoxDecoration(color: AppColors.shadowColor),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          const Text(
                            "Order id:  ",
                            style: TextStyle(
                                fontSize: 22, fontWeight: FontWeight.w700),
                          ),
                          Text(
                            "#${controller.orderDataModel.orderId}",
                            style: const TextStyle(
                                fontSize: 22, fontWeight: FontWeight.w500),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          const Text(
                            "Payment by: ",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w400),
                          ),
                          Text(
                            "${controller.orderDataModel.paymentMethod}",
                            style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                                overflow: TextOverflow.ellipsis),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          const Text(
                            "Payment status: ",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w400),
                          ),
                          Text(
                            controller.orderDataModel.paymentDone!
                                ? "Done"
                                : "None",
                            style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                                overflow: TextOverflow.ellipsis),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          const Text(
                            "Order place time: ",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w400),
                          ),
                          Text(
                            "${controller.orderDataModel.orderTime}",
                            style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                                overflow: TextOverflow.ellipsis),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  "Items :",
                  style: TextStyle(fontSize: 18),
                ),
                ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: controller.orderDataModel.items!.length,
                    itemBuilder: (_, index) {
                      return Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          margin: const EdgeInsets.symmetric(horizontal: 2),
                          padding: const EdgeInsets.all(8.0),
                          decoration:
                              const BoxDecoration(color: AppColors.shadowColor),
                          child: Row(
                            children: [
                              Expanded(
                                flex: 2,
                                child: (controller.orderDataModel.items![index]
                                                .productShowImage !=
                                            '' &&
                                        controller.orderDataModel.items![index]
                                                .productShowImage !=
                                            null)
                                    ? Image.network(
                                        controller.orderDataModel.items![index]
                                            .productShowImage!,
                                        width: 70,
                                        height: 70,
                                      )
                                    : const Icon(Icons.access_alarm_outlined),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                flex: 7,
                                child: Text(
                                  "${controller.orderDataModel.items![index].productName}",
                                  style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500,
                                      overflow: TextOverflow.ellipsis),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }),
                const SizedBox(
                  height: 10.0,
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
                    child: const Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Total Price :",
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w500),
                            ),
                            Text("\$20",
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w500))
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Delivery Fee :",
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w500),
                            ),
                            Text("\$20",
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w500))
                          ],
                        ),
                        Divider(
                          height: 10,
                          thickness: 2,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Total Payment :",
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w500),
                            ),
                            Text("\$20",
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w500))
                          ],
                        ),
                      ],
                    )),
                const SizedBox(
                  height: 10,
                ),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      GetBuilder<OrderDetailsScreenController>(
                          builder: (controller) {
                        return controller.showTextFormField
                            ? InputFormField(
                                isBackgroundFilled: true,
                                keyBoardType: TextInputType.number,
                                controller: _orderIdETController,
                                label: "Order id",
                                borderColor: AppColors.successGreen,
                                validation: (value) {
                                  if (value!.isNotEmpty) {
                                    return null;
                                  } else {
                                    return 'Enter order id without "#" this';
                                  }
                                },
                              )
                            : controller.orderStatus != null
                                ? Container(
                                    width: MediaQuery.of(context).size.width,
                                    padding: const EdgeInsets.all(8.0),
                                    decoration: const BoxDecoration(
                                        color: AppColors.shadowColor),
                                    child: Row(
                                      children: [
                                        const Text("Order status: ",
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.w400)),
                                        Text(
                                          "${controller.orderStatus}",
                                          style: const TextStyle(
                                              fontSize: 22,
                                              fontWeight: FontWeight.w700),
                                        ),
                                      ],
                                    ),
                                  )
                                : const Center();
                      }),
                      const SizedBox(
                        height: 10,
                      ),
                      GetBuilder<OrderDetailsScreenController>(
                          builder: (controller) {
                        return Center(
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width,
                            height: 50,
                            child: AppButton(
                              title: "Track order",
                              onPressed: controller.showTextFormField
                                  ? controller.orderStatus == null
                                      ? () {
                                          if (_formKey.currentState
                                                  ?.validate() ??
                                              true) {
                                            controller.getOrderStatus(
                                                orderId: _orderIdETController
                                                    .text
                                                    .trim());
                                          }
                                        }
                                      : null
                                  : controller.orderStatus == null
                                      ? () {
                                          controller.isShowTextFormField();
                                        }
                                      : null,
                              backgroundColor: AppColors.successGreen,
                            ),
                          ),
                        );
                      }),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Center(
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: 50,
                    child: AppButton(
                      title: "Cancel order",
                      onPressed: () {
                        controller.cancelOrder();
                      },
                      backgroundColor: AppColors.failureRed,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
        )));
  }
}

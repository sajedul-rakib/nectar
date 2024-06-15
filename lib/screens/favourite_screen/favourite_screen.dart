import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nectar/routes/route_name.dart';
import 'package:nectar/screens/favourite_screen/index.dart';
import 'package:nectar/screens/widgets/app_button.dart';

import '../../utils/color.dart';

class FavouriteScreen extends GetView<FavouriteScreenController> {
  const FavouriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        title: const Text(
          "Favourite",
          style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        actions: [
          GetBuilder<FavouriteScreenController>(builder: (controller) {
            return controller.enabledMultiSelection
                ? TextButton(
                    onPressed: () => controller.deleteFavouriteData(),
                    child: const Text(
                      "Delete",
                      style: TextStyle(
                          fontSize: 20,
                          color: AppColors.failureRed,
                          fontWeight: FontWeight.w600),
                    ))
                : const SizedBox();
          })
        ],
      ),
      body: controller.checkUserAreLogged
          ? GetBuilder<FavouriteScreenController>(builder: (controller) {
              return RefreshIndicator(
                onRefresh: () {
                  controller.favouriteProduct.clear();
                  controller.update();
                  return controller.getFavouriteProduct();
                },
                child: ListView.builder(
                    itemCount: controller.favouriteProduct.length,
                    itemBuilder: (_, index) {
                      return InkWell(
                        onTap: () {
                          Get.toNamed(RouteName.PRODUCT_DETAIL_SCREEN,
                              arguments: controller.favouriteProduct[index]);
                        },
                        onLongPress: () {
                          controller.permitForEnableSelection = true;
                          controller.selectFavouriteCart(
                              controller.favouriteProduct[index]);
                        },
                        child: Stack(
                          alignment: Alignment.topRight,
                          children: [
                            Card(
                              margin: const EdgeInsets.all(8.0),
                              color: AppColors.shadowColor,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Card(
                                        elevation: 0.0,
                                        color: AppColors.whiteColor,
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Image.network(
                                            '${controller.favouriteProduct[index].productShowImage}',
                                            width: 100,
                                            fit: BoxFit.contain,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                SizedBox(
                                                  width: 100,
                                                  child: AutoSizeText(
                                                    "${controller.favouriteProduct[index].productName}",
                                                    style: const TextStyle(
                                                      color:
                                                          AppColors.blackColor,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                    ),
                                                    maxLines: 2,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    maxFontSize: 18.0,
                                                    minFontSize: 14.0,
                                                  ),
                                                ),
                                                Text(
                                                  "${controller.favouriteProduct[index].productUnit},Price",
                                                  style: const TextStyle(
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      color: AppColors
                                                          .shadowTextColor,
                                                      fontSize: 16.0),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        "\$${controller.favouriteProduct[index].productPrice}",
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18.0,
                                            color: AppColors.blackColor),
                                      ),
                                      const Icon(CupertinoIcons.chevron_right)
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Visibility(
                                visible: controller.enabledMultiSelection,
                                child: InkWell(
                                  onTap: () => controller.selectFavouriteCart(
                                      controller.favouriteProduct[index]),
                                  child: Icon(
                                    controller.selectedFavouriteCart.contains(
                                            controller.favouriteProduct[index])
                                        ? Icons.check_circle_outline
                                        : Icons.circle_outlined,
                                    size: 40,
                                    color: AppColors.backgroundColor,
                                  ),
                                ))
                          ],
                        ),
                      );
                    }),
              );
            })
          : Center(
              child: SizedBox(
                width: 250,
                height: 60,
                child: AppButton(
                  title: "Log in first",
                  onPressed: () {
                    Get.toNamed(RouteName.LOGIN_SCREEN);
                  },
                ),
              ),
            ),
    );
  }
}

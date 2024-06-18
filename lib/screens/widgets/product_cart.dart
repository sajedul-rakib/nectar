import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nectar/model/product.dart';
import 'package:nectar/routes/route_name.dart';
import 'package:nectar/screens/widgets/rating_bar.dart';

import '../../utils/color.dart';

class ProductCart extends StatelessWidget {
  const ProductCart({
    super.key,
    required this.product,
  });

  final Product product;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.toNamed(RouteName.productDetailScreen, arguments: product);
      },
      child: Container(
        height: 300,
        width: 200,
        margin: const EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          color: AppColors.shadowColor,
          borderRadius: BorderRadius.circular(20),
          // border: Border.all(color: AppColors.shadowTextColor)
        ),
        child: Stack(
          children: [
            Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                Expanded(
                    flex: 1,
                    child: Image.network(
                      "${product.productShowImage}",
                      fit: BoxFit.contain,
                    )),
                const SizedBox(
                  height: 10,
                ),
                Expanded(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AutoSizeText(
                            "${product.productName}",
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18.0,
                              color: AppColors.backgroundColor,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            maxFontSize: 18.0,
                            minFontSize: 14.0,
                          ),
                          const SizedBox(
                            height: 2,
                          ),
                          Text(
                            "${product.productUnit},Price",
                            style: const TextStyle(
                                fontSize: 16.0,
                                color: AppColors.shadowTextColor),
                          ),
                          Row(
                            children: [
                              ProductRatingBar(
                                rating: product.rating?.toDouble() ?? 0.0,
                                itemSize: 18.0,
                              ),
                              Text(
                                "(${product.rating ?? ""})",
                                style: const TextStyle(
                                    fontSize: 16.0,
                                    color: AppColors.blackColor,
                                    fontWeight: FontWeight.w500),
                              )
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "\$${product.productPrice! - ((product.discount! / 100) * product.productPrice!)}",
                                style: const TextStyle(
                                    fontSize: 18.0,
                                    color: AppColors.blackColor,
                                    fontWeight: FontWeight.w600),
                              ),
                              product.discount != 0.0
                                  ? Text("${product.discount}% off")
                                  : const Center()
                            ],
                          )
                        ],
                      ),
                    ))
              ],
            )
          ],
        ),
      ),
    );
  }
}

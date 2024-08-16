import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:googleapis/analytics/v3.dart';
import 'package:nectar/utils/color.dart';

class ProductSlider extends StatelessWidget {
  const ProductSlider({
    super.key,
    required this.carouselData,
    this.autoPlay = false,
    this.imageWidth
  });

  final List<String> carouselData;
  final bool autoPlay;
  final double? imageWidth;

  @override
  Widget build(BuildContext context) {
    Size size= MediaQuery.of(context).size;

    return CarouselSlider(
        items: carouselData
            .map((imageUrl) => Container
          (width: size.width,
                  padding: const EdgeInsets.symmetric(horizontal: 6.0),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: AppColors.whiteColor),
                  child: Center(
                    child: Image.network(
                      imageUrl,
                      width: imageWidth,
                      fit: BoxFit.cover,
                    ),
                  ),
                ))
            .toList(),
        options: CarouselOptions(
          autoPlay: autoPlay,
          viewportFraction: 1,
        ));
  }
}

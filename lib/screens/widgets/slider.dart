import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class ProductSlider extends StatelessWidget {
  const ProductSlider({
    super.key,
    required this.carouselData,
    this.autoPlay = false,
  });

  final List<String> carouselData;
  final bool autoPlay;

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
        items: carouselData
            .map((imageUrl) => Container(
                  padding: const EdgeInsets.symmetric(horizontal: 6.0),
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(15)),
                  child: Center(
                    child: Image.network(
                      imageUrl,
                      fit: BoxFit.fitWidth,
                      width: MediaQuery.of(context).size.width,
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

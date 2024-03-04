import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class ProductSlider extends StatelessWidget {
  const ProductSlider({
    super.key,
    required this.carouselData,
    required this.currentBannerIndex,
    required this.changeIndex,
    this.autoPlay = false,
  });

  final List<String>? carouselData;
  final int currentBannerIndex;
  final Function(int) changeIndex;
  final bool autoPlay;

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
        items: carouselData
            ?.map((String? data) => Container(
                margin: const EdgeInsets.symmetric(horizontal: 6.0),
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(15)),
                width: MediaQuery.of(context).size.width,
                height: 50,
                child: Column(
                  children: [
                    Center(
                      child: Image.network(
                        data.toString(),
                        fit: BoxFit.cover,
                        width: 200,
                      ),
                    ),
                    // Container(
                    //   padding: const EdgeInsets.symmetric(vertical: 4.0),
                    //   width: 60,
                    //   height: 30,
                    //   decoration: BoxDecoration(
                    //       borderRadius: BorderRadius.circular(20),
                    //       color: AppColors.blackColor.withOpacity(.3)),
                    //   child: Center(
                    //     child: Text(
                    //       "${currentBannerIndex + 1}/${carouselData.length}",
                    //       style: const TextStyle(
                    //           fontWeight: FontWeight.w400,
                    //           color: AppColors.blackColor,
                    //           fontSize: 16.0),
                    //     ),
                    //   ),
                    // ),
                  ],
                )))
            .toList(),
        options: CarouselOptions(
            autoPlay: autoPlay,
            viewportFraction: 1,
            onPageChanged: (int index, _) {
              changeIndex(index);
            }));
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:nectar/utils/color.dart';

class ProductRatingBar extends StatelessWidget {
  const ProductRatingBar({
    super.key, required this.rating, required this.itemSize,
  });

  final double rating;
  final double itemSize;

  @override
  Widget build(BuildContext context) {
    return RatingBarIndicator(itemBuilder: (context,index){
      return const Icon(Icons.star,color:AppColors.backgroundColor,);
    },itemCount: 5,itemSize: itemSize,rating: rating,);
  }
}

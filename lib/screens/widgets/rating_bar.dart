import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class ProductRatingBar extends StatelessWidget {
  const ProductRatingBar({
    super.key, required this.rating, required this.itemSize,
  });

  final double rating;
  final double itemSize;

  @override
  Widget build(BuildContext context) {
    return RatingBarIndicator(itemBuilder: (context,index){
      return const Icon(Icons.star,color:Color(0xffF3603F),);
    },itemCount: 5,itemSize: itemSize,rating: rating,);
  }
}

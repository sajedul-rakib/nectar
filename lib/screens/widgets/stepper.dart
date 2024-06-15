import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../utils/color.dart';

class ProductStepper extends StatelessWidget {
  const ProductStepper(
      {super.key,
      required this.counter,
      required this.plusMethod,
      required this.minusMethod});

  final int counter;
  final VoidCallback plusMethod;
  final VoidCallback minusMethod;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InkWell(
            onTap: minusMethod,
            child: const Icon(
              CupertinoIcons.minus,
              color: AppColors.shadowTextColor,
            )),
        Container(
          margin:const EdgeInsets.symmetric(horizontal: 5.0),
          padding:const EdgeInsets.all(10.0),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(width: 2,color: AppColors.shadowTextColor)
          ),
          child: Text(
            counter.toString(),
            style: const TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.w700,
                color: AppColors.blackColor),
          ),
        ),
        InkWell(
            onTap: plusMethod,
            child: const Icon(
              CupertinoIcons.plus,
              color: AppColors.backgroundColor,
            ))
      ],
    );
  }
}

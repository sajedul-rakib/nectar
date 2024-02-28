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
        IconButton(
            onPressed: minusMethod,
            icon: const Icon(
              CupertinoIcons.minus,
              color: AppColors.shadowTextColor,
            )),
        Chip(
          elevation: 0,
          shape: RoundedRectangleBorder(
              side:
                  const BorderSide(width: 2, color: AppColors.shadowTextColor),
              borderRadius: BorderRadius.circular(10)),
          label: Text(
            counter.toString(),
            style: const TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.w700,
                color: AppColors.blackColor),
          ),
        ),
        IconButton(
            onPressed: plusMethod,
            icon: const Icon(
              CupertinoIcons.plus,
              color: AppColors.backgroundColor,
            ))
      ],
    );
  }
}

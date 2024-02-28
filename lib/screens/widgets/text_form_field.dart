import 'package:flutter/material.dart';

import '../../utils/color.dart';

class InputFormField extends StatelessWidget {
  const InputFormField({
    super.key,
    required this.label,
    this.controller, this.suffixIcon,  this.validation,
  });

  final String label;
  final TextEditingController? controller;
  final IconData? suffixIcon;
  final Function(String? value)? validation;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: (String? value){
        if(validation!=null){
         return validation!(value);
        }else {
          return null;
        }
      },
      decoration: InputDecoration(
        suffixIcon:Icon(suffixIcon),
          label: Text(
        label,
        style: const TextStyle(
            fontFamily: 'montserrat',
            fontSize: 16.0,
            fontWeight: FontWeight.w700,
            color: AppColors.shadowTextColor),
      )),
    );
  }
}

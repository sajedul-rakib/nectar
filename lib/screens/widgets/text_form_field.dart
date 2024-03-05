import 'package:flutter/material.dart';

import '../../utils/color.dart';

// class InputFormField extends StatelessWidget {
//   const InputFormField({
//     super.key,
//     required this.label,
//     this.controller,
//     this.suffixIcon1,
//     this.suffixIcon2,
//     this.validation,
//   });

//   final String label;
//   final TextEditingController? controller;
//   final IconData? suffixIcon1;
//   final IconData? suffixIcon2;
//   final Function(String? value)? validation;

//   @override
//   Widget build(BuildContext context) {
//     bool isSecure = false;
//     return TextFormField(
//       controller: controller,
//       validator: (String? value) {
//         if (validation != null) {
//           return validation!(value);
//         } else {
//           return null;
//         }
//       },
//       obscureText: isSecure,
//       decoration: InputDecoration(
//           suffixIcon: IconButton(
//               onPressed: () {
//                 isSecure = !isSecure;
//               },
//               icon: Icon(isSecure ? suffixIcon1 : suffixIcon2)),
//           label: Text(
//             label,
//             style: const TextStyle(
//                 fontSize: 16.0,
//                 fontWeight: FontWeight.w700,
//                 color: AppColors.shadowTextColor),
//           )),
//     );
//   }
// }

class InputFormField extends StatefulWidget {
  const InputFormField(
      {super.key,
      required this.label,
      this.controller,
      this.suffixIcon1,
      this.suffixIcon2,
      this.validation});

  final String label;
  final TextEditingController? controller;
  final IconData? suffixIcon1;
  final IconData? suffixIcon2;
  final Function(String? value)? validation;

  @override
  State<InputFormField> createState() => _InputFormFieldState();
}

bool isSecure = true;

class _InputFormFieldState extends State<InputFormField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      validator: (String? value) {
        if (widget.validation != null) {
          return widget.validation!(value);
        } else {
          return null;
        }
      },
      obscureText: isSecure,
      decoration: InputDecoration(
          suffixIcon: IconButton(
              onPressed: () {
                isSecure = !isSecure;
                setState(() {});
              },
              icon: Icon(isSecure ? widget.suffixIcon1 : widget.suffixIcon2)),
          label: Text(
            widget.label,
            style: const TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.w700,
                color: AppColors.shadowTextColor),
          )),
    );
  }
}

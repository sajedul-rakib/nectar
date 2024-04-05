import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';

void snackBar(
    {required String title,
    required ContentType contentType,
    required String message,
    required BuildContext context}) {
  final snackbar = SnackBar(
    elevation: 0,
    behavior: SnackBarBehavior.floating,
    backgroundColor: Colors.transparent,
    content: AwesomeSnackbarContent(
        title: title, message: message, contentType: contentType),
  );

  ScaffoldMessenger.of(context).showSnackBar(snackbar);
}

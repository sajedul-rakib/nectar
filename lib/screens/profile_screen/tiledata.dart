import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TileData {
  String title;
  IconData icon;
  Function() onPressed;

  TileData({required this.title, required this.icon, required this.onPressed});
}

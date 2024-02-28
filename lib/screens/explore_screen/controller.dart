import 'dart:ui';

import 'package:get/get.dart';

import 'category_data.dart';

class ExploreScreenController extends GetxController {
  List<CategoryDataModel> categoryData = [
    CategoryDataModel(
        backgroundColor: const Color(0xff53B175).withOpacity(.3),
        borderColor: const Color(0xff53B175).withOpacity(.7),
        picAddress:'assets/images/freshfruit.png',
        categoryTitle:'Fresh Fruits & Vegetable '),

    CategoryDataModel(
        backgroundColor: const Color(0xffF8A44C).withOpacity(.3),
        borderColor: const Color(0xffF8A44C).withOpacity(.7),
        picAddress:'assets/images/freshfruit.png',
        categoryTitle:'Cooking Oil & Ghee '),

    CategoryDataModel(
        backgroundColor: const Color(0xffF7A593).withOpacity(.25),
        borderColor: const Color(0xffF7A593),
        picAddress:'assets/images/freshfruit.png',
        categoryTitle:'Meat & Fish'),

    CategoryDataModel(
        backgroundColor: const Color(0xffD3B0E0).withOpacity(.25),
        borderColor: const Color(0xffD3B0E0),
        picAddress:'assets/images/freshfruit.png',
        categoryTitle:'Bakery & Snacks '),

    CategoryDataModel(
        backgroundColor: const Color(0xffFDE598).withOpacity(.25),
        borderColor: const Color(0xffFDE598),
        picAddress:'assets/images/freshfruit.png',
        categoryTitle:'Dairy & Eggs'),

    CategoryDataModel(
        backgroundColor: const Color(0xffB7DFF5).withOpacity(.25),
        borderColor: const Color(0xffB7DFF5),
        picAddress:'assets/images/freshfruit.png',
        categoryTitle:'Beverages'),


  ];
}

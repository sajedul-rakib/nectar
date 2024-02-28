import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nectar/screens/bottom_navigation_bar/controller.dart';
import 'package:nectar/screens/cart_screen/cart_screen.dart';
import 'package:nectar/screens/explore_screen/explore_screen.dart';
import 'package:nectar/screens/favourite_screen/favourite_screen.dart';
import 'package:nectar/screens/home_screen/home_screen.dart';
import 'package:nectar/screens/profile_screen/index.dart';

class BottomNavBar extends GetView<BottomNavigationBarController> {
  const BottomNavBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    List<Widget> screens = [
      const HomeScreen(),
      const ExploreScreen(),
      const CartScreen(),
      const FavouriteScreen(),
      const ProfileScreen(),
    ];

    return Scaffold(
      bottomNavigationBar:
          GetBuilder<BottomNavigationBarController>(builder: (controller) {
        return BottomNavigationBar(
          currentIndex: controller.currentIndex,
          onTap: (int index) {
            controller.changeCurrentIndex(index);
          },
          items: const [
            BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.house), label: "Shop"),
            BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.doc_text_search), label: "Explore"),
            BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.cart), label: "Cart"),
            BottomNavigationBarItem(
                icon: Icon(Icons.favorite_border_rounded), label: "Favourite"),
            BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.person), label: "Account"),
          ],
        );
      }),
      body: GetBuilder<BottomNavigationBarController>(
        builder: (controller) {
          return SafeArea(child: screens[controller.currentIndex]);
        },
      ),
    );
  }
}

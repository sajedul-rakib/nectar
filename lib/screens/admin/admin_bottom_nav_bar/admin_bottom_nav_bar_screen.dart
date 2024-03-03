import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nectar/screens/admin/admin_bottom_nav_bar/controller.dart';
import 'package:nectar/screens/admin/admin_profile/admin_profile_screen.dart';
import 'package:nectar/screens/admin/admin_screen/admin_screen.dart';
import 'package:nectar/screens/admin/order_list_screen/index.dart';
import 'package:nectar/screens/admin/product_list_screen/index.dart';

class AdminBottomNavBarScreen extends GetView<AdminBottomNavBarController> {
  const AdminBottomNavBarScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    List<Widget> screens = [
      AdminScreen(),
      const ProductListScreen(),
      const OrderListScreen(),
      const AdminProfileScreen(),
    ];

    return Scaffold(
      bottomNavigationBar: Obx(() => BottomNavigationBar(
            currentIndex: controller.currentIndex,
            onTap: (int index) {
              controller.changeIndex(index);
            },
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(CupertinoIcons.house), label: "Add Product"),
              BottomNavigationBarItem(
                  icon: Icon(CupertinoIcons.doc_text_search),
                  label: "Product List"),
              BottomNavigationBarItem(
                  icon: Icon(CupertinoIcons.cart), label: "Order List"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.person_2_outlined), label: "Profile"),
            ],
          )),
      body: Obx(() => SafeArea(child: screens[controller.currentIndex])),
    );
  }
}

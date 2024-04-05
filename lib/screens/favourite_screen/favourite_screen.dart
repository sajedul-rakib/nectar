import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nectar/routes/route_name.dart';
import 'package:nectar/screens/favourite_screen/index.dart';
import 'package:nectar/screens/widgets/app_button.dart';

import '../../utils/color.dart';

class FavouriteScreen extends GetView<FavouriteScreenController> {
  const FavouriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Favourite",
          style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
      ),
      body: controller.checkUserAreLogged
          ? Column(
              children: [
                const Divider(),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: 100,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          ClipRRect(
                            child: Image.asset(
                              'assets/images/apple.png',
                              width: 100,
                              fit: BoxFit.contain,
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      width: 180,
                                      child: AutoSizeText(
                                        "Natural Red Apple Natural Red Apple  Natural Red Apple ",
                                        style: TextStyle(
                                          color: AppColors.blackColor,
                                          fontWeight: FontWeight.w600,
                                        ),
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        maxFontSize: 18.0,
                                        minFontSize: 14.0,
                                      ),
                                    ),
                                    Text(
                                      "4,Price",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          color: AppColors.shadowTextColor,
                                          fontSize: 16.0),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const Row(
                        children: [
                          Text(
                            "\$12",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18.0,
                                color: AppColors.blackColor),
                          ),
                          Icon(CupertinoIcons.chevron_right)
                        ],
                      ),
                    ],
                  ),
                ),
                const Divider()
              ],
            )
          : Center(
              child: SizedBox(
                width: 250,
                height: 60,
                child: AppButton(
                  title: "Log in first",
                  onPressed: () {
                    Get.toNamed(RouteName.LOGIN_SCREEN);
                  },
                ),
              ),
            ),
    );
  }
}

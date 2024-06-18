import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nectar/routes/route_name.dart';
import 'package:nectar/screens/profile_screen/controller.dart';
import 'package:nectar/screens/widgets/app_button.dart';
import 'package:nectar/utils/color.dart';

class ProfileScreen extends GetView<ProfileScreenController> {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.whiteColor,
        body: SafeArea(
          child: controller.userAreLoggedIn
              ? SingleChildScrollView(
                  child: Column(
                    children: [
                      GetBuilder<ProfileScreenController>(
                          builder: (controller) {
                        return Padding(
                          padding: const EdgeInsets.only(
                              left: 8.0, right: 8.0, top: 8.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: 50,
                                height: 50,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(500),
                                  child: (controller.userData.profilePic !=
                                              null &&
                                          controller.userData.profilePic != '')
                                      ? Image.network(controller
                                          .userData.profilePic
                                          .toString())
                                      : const Icon(
                                          Icons.person,
                                          size: 32.0,
                                        ),
                                ),
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  (controller.userData.fullName != null &&
                                          controller.userData.fullName != '')
                                      ? Text(
                                          "${controller.userData.fullName}",
                                          style: const TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 18.0,
                                              color: AppColors.blackColor),
                                        )
                                      : const Text(
                                          "Unknown",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 18.0,
                                              color: AppColors.blackColor),
                                        ),
                                  (controller.userData.email != null &&
                                          controller.userData.email != '')
                                      ? Text(
                                          "${controller.userData.email}",
                                          style: const TextStyle(
                                              fontSize: 16.0,
                                              fontWeight: FontWeight.w700,
                                              color: AppColors.blackColor),
                                        )
                                      : const Text(
                                          "Unknown",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 18.0,
                                              color: AppColors.blackColor),
                                        ),
                                ],
                              )
                            ],
                          ),
                        );
                      }),
                      const SizedBox(
                        height: 20,
                      ),
                      const Divider(),
                      ListView.separated(
                        itemCount: TileData.tileData.length,
                        // physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return ListTile(
                            onTap: () => TileData.tileData[index].onPressed(),
                            leading: Icon(
                              TileData.tileData[index].icon,
                            ),
                            title: Text(
                              TileData.tileData[index].title,
                              style: const TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.blackColor,
                                  fontSize: 16.0),
                            ),
                            trailing: const Icon(Icons.chevron_right),
                          );
                        },
                        separatorBuilder: (context, index) => const Divider(),
                      ),
                      const Divider(),
                      const SizedBox(
                        height: 20,
                      ),
                      !controller.userAreLoggedIn
                          ? const SizedBox()
                          : Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16.0),
                              child: ListTile(
                                leading: const Icon(
                                  Icons.logout,
                                  color: AppColors.backgroundColor,
                                ),
                                onTap: () {
                                  controller.logOut();
                                },
                                title: const Text(
                                  "Log Out",
                                  style: TextStyle(
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.w500,
                                      color: AppColors.backgroundColor),
                                  textAlign: TextAlign.center,
                                ),
                                tileColor: const Color(0xffF2F3F2),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20)),
                              ),
                            )
                    ],
                  ),
                )
              : Center(
                  child: SizedBox(
                    width: 250,
                    height: 60,
                    child: AppButton(
                      title: "Log In",
                      onPressed: () {
                        Get.toNamed(RouteName.logInScreen);
                      },
                    ),
                  ),
                ),
        ));
  }
}

class TileData {
  String title;
  IconData icon;
  Function() onPressed;

  TileData({required this.title, required this.icon, required this.onPressed});

  static List<TileData> tileData = [
    TileData(
      title: "My Orders",
      icon: CupertinoIcons.bag,
      onPressed: () {
        Get.toNamed(RouteName.orderTrackingScreen);
      },
    ),
    TileData(
      title: "My Details",
      icon: CupertinoIcons.doc_text_search,
      onPressed: () => Get.toNamed(RouteName.userDetailScreen),
    ),
    TileData(
      title: "Notifications",
      icon: CupertinoIcons.bell,
      onPressed: () {
        log("my notification");
      },
    ),
    TileData(
      title: "Help",
      icon: CupertinoIcons.question_circle,
      onPressed: () {
        log("help");
      },
    ),
    TileData(
      title: "About",
      icon: CupertinoIcons.exclamationmark_circle,
      onPressed: () {
        log("about");
      },
    ),
  ];
}

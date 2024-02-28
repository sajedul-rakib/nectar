import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:nectar/model/User_data_mode.dart';
import 'package:nectar/routes/route_name.dart';
import 'package:nectar/screens/profile_screen/tiledata.dart';
import 'package:nectar/screens/widgets/snack_bar.dart';
import 'package:nectar/share/save_user_data.dart';

class ProfileScreenController extends GetxController {
  UserData? _userData;

  //get
  UserData? get userData => _userData;

  List<TileData> tileData = [
    TileData(title: "Orders", icon: CupertinoIcons.bag),
    TileData(title: "My Details", icon: CupertinoIcons.doc_text_search),
    TileData(title: "Delivery Address", icon: CupertinoIcons.map),
    TileData(title: "Payment Method", icon: CupertinoIcons.creditcard),
    TileData(title: "Notifications", icon: CupertinoIcons.bell),
    TileData(title: "Help", icon: CupertinoIcons.question_circle),
    TileData(title: "About", icon: CupertinoIcons.exclamationmark_circle),
  ];

  Future<UserData?> getUserData() async {
    String fullName = await SaveUserData.getData(key: "fullName");
    String email = await SaveUserData.getData(key: "email");
    String address = await SaveUserData.getData(key: "address");
    String number = await SaveUserData.getData(key: "number");
    String profilePic = await SaveUserData.getData(key: "profilePic");
    log("profile pic ${profilePic.toString()}");
    _userData = UserData(
        fullName: fullName,
        email: email,
        address: address,
        phoneNumber: number,
        profilePic: profilePic);
    update();
    return _userData;
  }

  Future<void> logOut() async {
    FirebaseAuth auth = FirebaseAuth.instance;
    await SaveUserData.deleteUserData();
    Future.delayed(
        const Duration(seconds: 2), () async => await auth.signOut());
    snackBar(
        title: 'Log out',
        message: 'Log out successfully',
        contentType: 'success');
    Get.offAllNamed(RouteName.LOGIN_SCREEN);
  }

  @override
  void onInit() {
    getUserData();
    super.onInit();
  }
}

import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:nectar/model/user_data_model.dart';
import 'package:nectar/routes/route_name.dart';
import 'package:nectar/screens/profile_screen/tiledata.dart';
import 'package:nectar/screens/widgets/snack_bar.dart';
import 'package:nectar/share/save_data.dart';

class ProfileScreenController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _store = FirebaseFirestore.instance;
  bool _userAreLoggedIn = false;

  UserModel _userData = UserModel.emptyUser;

  //get
  UserModel get userData => _userData;
  bool get userAreLoggedIn => _userAreLoggedIn;

  List<TileData> tileData = [
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

  void _checkUserAreLogged() {
    User? loggedUser = _auth.currentUser;

    if (loggedUser != null) {
      _userAreLoggedIn = true;
      update();
    }
  }

  Future<void> getLoggedUserData() async {
    final loggedUserData = await _store
        .collection("user")
        .where("token", isEqualTo: _auth.currentUser!.uid)
        .limit(1)
        .get();
    _userData = UserModel.fromJson(loggedUserData.docs.first.data());
    update();
  }

  Future<void> logOut() async {
    SaveData.clearData();
    await _auth.signOut();
    snackBar(
        title: "Log Out",
        contentType: ContentType.success,
        message: "Log out successfully",
        context: Get.key.currentContext!);
    Get.offAllNamed(RouteName.logInScreen);
  }

  @override
  void onInit() {
    _checkUserAreLogged();
    _userAreLoggedIn ? getLoggedUserData() : null;
    super.onInit();
  }
}

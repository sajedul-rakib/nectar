

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

  UserModel? _userData;

  //get
  UserModel? get userData => _userData;

  List<TileData> tileData = [
    TileData(title: "Orders", icon: CupertinoIcons.bag),
    TileData(title: "My Details", icon: CupertinoIcons.doc_text_search),
    TileData(title: "Delivery Address", icon: CupertinoIcons.map),
    TileData(title: "Payment Method", icon: CupertinoIcons.creditcard),
    TileData(title: "Notifications", icon: CupertinoIcons.bell),
    TileData(title: "Help", icon: CupertinoIcons.question_circle),
    TileData(title: "About", icon: CupertinoIcons.exclamationmark_circle),
  ];

  Future<void> getLoggedUserData() async {
    final loggedUserData = await _store
        .collection("user")
        .where("token", isEqualTo: _auth.currentUser!.uid)
        .limit(1)
        .get();
    _userData = UserModel.fromJson(loggedUserData.docs.first.data());
  }

  Future<void> logOut() async {
    SaveData.clearData();
    await _auth.signOut();
    snackBar(
        title: "Log Out",
        contentType: ContentType.success,
        message: "Log out successfully",
        context: Get.key.currentContext!);
    Get.offAllNamed(RouteName.LOGIN_SCREEN);
  }

  @override
  void onInit() {
    getLoggedUserData();
    super.onInit();
  }
}

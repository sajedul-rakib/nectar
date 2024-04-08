import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:nectar/model/User_data_mode.dart';
import 'package:nectar/routes/route_name.dart';
import 'package:nectar/screens/profile_screen/tiledata.dart';
import 'package:nectar/screens/widgets/snack_bar.dart';
import 'package:nectar/share/save_data.dart';

class ProfileScreenController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _store = FirebaseFirestore.instance;

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

  Future<Map<String, dynamic>> getLoggedUserData() async {
    return _store
        .collection("user")
        .where("token", isEqualTo: _auth.currentUser!.uid)
        .limit(1)
        .get()
        .then((value) {
      return value.docs.first.data();
    });
  }

  Future<UserData?> getUserData() async {
    Map<String, dynamic> loggedUserData = await getLoggedUserData();
    User? loggedUser = _auth.currentUser;

    if (loggedUser != null) {
      _userData = UserData(
          fullName: loggedUserData['fullName'] ?? loggedUser.displayName,
          email: loggedUserData['email'] ?? loggedUser.email,
          profilePic: loggedUserData['profilePic'],
          phoneNumber: loggedUserData['phoneNumber'],
          address: loggedUserData['address'],
          token: loggedUser.uid);
      update();
      return _userData;
    } else {
      return null;
    }
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
    getUserData();
    super.onInit();
  }
}

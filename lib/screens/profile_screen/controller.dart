import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:nectar/model/user_data_model.dart';
import 'package:nectar/routes/route_name.dart';
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

  void _checkUserAreLogged() {
    User? loggedUser = _auth.currentUser;

    if (loggedUser != null) {
      _userAreLoggedIn = true;
      update();
    }
  }

  Future<UserModel> getLoggedUserData() async {
    try {
      final loggedUserData = await _store
          .collection("user")
          .where("token", isEqualTo: _auth.currentUser!.uid)
          .limit(1)
          .get();
      _userData = UserModel.fromJson(loggedUserData.docs.first.data());
      update();
      return _userData;
    } catch (e) {
      log(e.toString());
      rethrow;
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
    Get.offAllNamed(RouteName.logInScreen);
  }

  @override
  void onInit() {
    _checkUserAreLogged();
    _userAreLoggedIn ? getLoggedUserData() : null;
    super.onInit();
  }
}

import 'dart:developer';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nectar/model/user_data_model.dart';

class UserDetailScreenController extends GetxController {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseStorage _firebaseStorage = FirebaseStorage.instance;
  num _uploadProgress = 0;
  bool _uploadSuccess = false;

  //text editing controller
  TextEditingController _nameETController = TextEditingController();
  TextEditingController _emailETController = TextEditingController();
  TextEditingController _phoneNumberETController = TextEditingController();
  TextEditingController _addressETController = TextEditingController();

  UserModel _userModel = UserModel.emptyUser;

  //get method
  UserModel get userModel => _userModel;

  TextEditingController get nameETController => _nameETController;
  TextEditingController get emailETController => _emailETController;
  TextEditingController get phoneNumberETController => _phoneNumberETController;
  TextEditingController get addressETController => _addressETController;

  num get uploadProgress => _uploadProgress;
  bool get uploadSuccess => _uploadSuccess;

  //get user data
  Future<void> getUserData() async {
    try {
      final loggedUserData = await _firebaseFirestore
          .collection("user")
          .where("token", isEqualTo: _firebaseAuth.currentUser!.uid)
          .get();
      _userModel = UserModel.fromJson(loggedUserData.docs.first.data());

      _nameETController.text = _userModel.fullName!;
      _emailETController.text = _userModel.email!;
      _phoneNumberETController.text = _userModel.phoneNumber!;
      _addressETController.text = _userModel.address!;

      update();
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  //upload profile pic
  Future<bool> uploadProfilePic(XFile profilePic) async {
    try {
      final rootDirectory = _firebaseStorage.ref();
      final fileExt = profilePic.name.split(".").last;
      final uniqueName =
          "profile_pic-${DateTime.now().microsecondsSinceEpoch}.$fileExt";
      final childDirectory = rootDirectory.child("profile_pic/$uniqueName");
      UploadTask uploadTask = childDirectory.putFile(File(profilePic.path));

      final task = await uploadTask.whenComplete(() => null);
      String downloadUrl = await task.ref.getDownloadURL();

      if (downloadUrl.isNotEmpty) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  @override
  void onInit() {
    getUserData();
    super.onInit();
  }
}

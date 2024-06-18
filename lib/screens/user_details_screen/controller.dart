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

  bool _editLoader = false;

  //text editing controller
  final TextEditingController _nameETController = TextEditingController();
  final TextEditingController _emailETController = TextEditingController();
  final TextEditingController _phoneNumberETController =
      TextEditingController();
  final TextEditingController _addressETController = TextEditingController();

  UserModel _userModel = UserModel.emptyUser;

  //get method
  UserModel get userModel => _userModel;

  bool get editLoader => _editLoader;

  TextEditingController get nameETController => _nameETController;
  TextEditingController get emailETController => _emailETController;
  TextEditingController get phoneNumberETController => _phoneNumberETController;
  TextEditingController get addressETController => _addressETController;

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

  //upload profile pic to firestore
  Future<String> _addProfilePicToFirebaseStorage(XFile profilePic) async {
    try {
      final rootDirectory = _firebaseStorage.ref();
      final fileExt = profilePic.name.split(".").last;
      final uniqueName =
          "profile_pic-${DateTime.now().microsecondsSinceEpoch}.$fileExt";
      final childDirectory = rootDirectory.child("profile_pic/$uniqueName");
      UploadTask uploadTask = childDirectory.putFile(File(profilePic.path));

      final task = await uploadTask.whenComplete(() => null);
      String downloadUrl = await task.ref.getDownloadURL();

      return downloadUrl;
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }

//add profile pic url to firestore
  Future<void> uploadProfilePic(XFile profilePic) async {
    try {
      String profilePicUrl = await _addProfilePicToFirebaseStorage(profilePic);
      if (profilePicUrl != '') {
        final loggedUser = await _firebaseFirestore
            .collection("user")
            .where("token", isEqualTo: _firebaseAuth.currentUser!.uid)
            .get();

        final userId = loggedUser.docs.first.id;

        _firebaseFirestore
            .collection("user")
            .doc(userId)
            .update({..._userModel.toJson(), "profilePic": profilePicUrl});
      }
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  //update the user data
  Future<void> updateUserData() async {
    _editLoader = true;
    update();
    try {
      final loggedUser = await _firebaseFirestore
          .collection("user")
          .where("token", isEqualTo: _firebaseAuth.currentUser!.uid)
          .get();

      final userId = loggedUser.docs.first.id;

      _firebaseFirestore.collection("user").doc(userId).update({
        ..._userModel.toJson(),
        "fullName": _nameETController.text.trim(),
        "email": _emailETController.text.trim(),
        "address": _addressETController.text.trim(),
        "phoneNumber": _phoneNumberETController.text.trim()
      });
      _editLoader = false;
      update();
    } catch (e) {
      log(e.toString());
      _editLoader = false;
      update();
      rethrow;
    }
  }

  @override
  void onInit() {
    getUserData();
    super.onInit();
  }
}

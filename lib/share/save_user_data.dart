import 'dart:developer';

import 'package:nectar/model/User_data_mode.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SaveUserData {
  static Future<void> isFirstTime(bool sayYesorNo) async {
    SharedPreferences _prep = await SharedPreferences.getInstance();
    _prep.getBool('isFirstTimeInstalled');
  }

  //save user data in local storage;
  static Future<void> saveUserData({required UserData userData}) async {
    log("save user data first name -${userData.fullName}");
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString("fullName", userData.fullName!);
    pref.setString("email", userData.email!);
    pref.setString("address", userData.address!);
    pref.setString("number", userData.phoneNumber!);
    pref.setString("profilePic", userData.profilePic!);
    pref.setString("token", userData.token!);
  }

  static Future<String> getData({required String key}) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getString(key)!;
  }

  //delete user data from local stroage
  static Future<void> deleteUserData() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.clear();
  }
}

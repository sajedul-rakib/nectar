import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:nectar/routes/route_name.dart';
import 'package:nectar/screens/widgets/snack_bar.dart';
import 'package:nectar/share/save_data.dart';

class AdminLogInScreenController extends GetxController {
  //firebase firestore
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  //firebase auth
  final FirebaseAuth _auth = FirebaseAuth.instance;
  //Text Editing Controller
  final TextEditingController _verifyTokenETController =
      TextEditingController();
  final TextEditingController _emailETController = TextEditingController();

  final TextEditingController _passwordETController = TextEditingController();

  //get
  TextEditingController get verifyTokenETController => _verifyTokenETController;
  TextEditingController get emailETController => _emailETController;
  TextEditingController get passwordETController => _passwordETController;

  Future<String?> verifyAdminToken({required String token}) async {
    final getToken = await _firestore.collection("admins").get();
    String? adminToken;

    for (var doc in getToken.docs) {
      if (doc.get('verifyToken') == token) {
        adminToken = doc.get("verifyToken");
      }
    }

    return adminToken;
  }

  Future<void> verifyAdmin({required String token}) async {
    String? getToken = await verifyAdminToken(token: token);
    getToken != null
        ? Get.toNamed(RouteName.ADMIN_LOG_IN_SCREEN)
        : snackBar(
            title: "Unvalid admin token",
            message:
                "You are not a admin / You are not verifed admin.Contact with nectar team for admin membership",
            contentType: ContentType.warning,
            context: Get.key.currentContext!);
  }

  Future<User?> signInAdmin(
      {required String email, required String password}) async {
    try {
      final credential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      return credential.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        //snackbar
        snackBar(
            title: "Not Found",
            message:
                "Not user found for that email.Enter your correct email address or sign in first",
            contentType: ContentType.failure,
            context: Get.key.currentContext!);
        return null;
      } else if (e.code == 'wrong-password') {
        //snackbar
        snackBar(
            title: "Wrong Password",
            message: "Wrong password provided for that user",
            contentType: ContentType.failure,
            context: Get.key.currentContext!);
        return null;
      }
      return null;
    } catch (e) {
      //snackbar
      snackBar(
          title: "Failed to log In",
          message: "Failed to log in.Try again.",
          contentType: ContentType.failure,
          context: Get.key.currentContext!);
      return null;
    }
  }

  Future<void> logIn({required String email, required String password}) async {
    bool getValidAdmin = await _firestore
        .collection("admins")
        .where("email", isEqualTo: email)
        .limit(1)
        .get()
        .then((value) {
      if (value.docs.first.data()['email'] == email) {
        return true;
      } else {
        return false;
      }
    });
    if (getValidAdmin) {
      User? user = await signInAdmin(email: email, password: password);
      if (user != null) {
        SaveData.saveUserRole(role: "admin");
        snackBar(
            title: "Log in Successful",
            message: "Admin log in successfully",
            contentType: ContentType.success,
            context: Get.key.currentContext!);
        Get.offAllNamed(RouteName.ADMIN_BOTTOM_NAV_BARSCREEN);
      } else {
        snackBar(
            title: "Invalid admin",
            message: "You are not valid admin.Contact with nectar team",
            contentType: ContentType.failure,
            context: Get.key.currentContext!);
      }
    }
  }
}

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:nectar/routes/route_name.dart';
import 'package:nectar/screens/widgets/snack_bar.dart';
import 'package:nectar/share/save_data.dart';

class AdminProfileScreenController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> logOut() async {
    SaveData.clearData();
    await _auth.signOut();
    snackBar(
        title: "Log Out",
        message: "Log out successfully",
        contentType: "success");
    Get.offAllNamed(RouteName.LOGIN_SCREEN);
  }
}

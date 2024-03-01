import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:nectar/routes/route_name.dart';
import 'package:nectar/screens/widgets/snack_bar.dart';
import 'package:nectar/share/save_data.dart';

class AdminScreenController extends GetxController {
//firebase auth
  FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> logOut() async {
    SaveData.clearData();
    await _auth.signOut();
    Get.offAllNamed(RouteName.LOGIN_SCREEN);
    snackBar(
        title: "Log out Successfully",
        message: "Admin log out successfully",
        contentType: "success");
  }
}

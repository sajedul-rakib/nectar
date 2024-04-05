import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class CartScreenController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final Rx<bool> _checkUserAreLogged = false.obs;

  bool get checkUserAreLogged => _checkUserAreLogged.value;

  void userAreLoggedIn() {
    User? user = _auth.currentUser;
    if (user != null) {
      _checkUserAreLogged.value = true;
      update();
    }
  }

  @override
  void onInit() {
    userAreLoggedIn();
    super.onInit();
  }
}

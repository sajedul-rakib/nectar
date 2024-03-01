import 'package:shared_preferences/shared_preferences.dart';

class SaveData {
  static Future<void> saveUserRole({required String role}) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString("role", role);
  }

  static Future<String?> getUserRole({required String role}) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getString("role");
  }

  static Future<void> clearData() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.clear();
  }
}

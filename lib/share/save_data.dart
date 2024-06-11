import 'package:shared_preferences/shared_preferences.dart';

class SaveData {
  static  Future<void> setBoolFirstOpenThisApp(bool isFirst)async{
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setBool("isFirstOpenThisApp",isFirst);
  }

  static  Future<bool?> isFirstOpen()async{
    SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getBool("isFirstOpenThisApp");
  }


  static Future<void> clearData() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.clear();
  }
}

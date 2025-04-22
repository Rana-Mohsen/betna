
import 'package:shared_preferences/shared_preferences.dart';

class UserInfo {
  static String? userName = "";
  static String? userId = "";
  static String? userEmail = "";

  static Future<void> saveUserInfo(String name, String id) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString("name_$name", name);
    await prefs.setString("id_$name", id);
  }

  static Future<void> saveUserEmail(String name, String email) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString("email_$name", email);
  }

  static Future<void> getUserInfo(String name) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    userId = prefs.getString("id_$name");
    userName = prefs.getString("name_$name");
    userEmail = prefs.getString("email_$name");

    // return UserModel.fromJson(jsonDecode(value));
  }
}

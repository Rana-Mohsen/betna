import 'dart:convert';

import 'package:betna/constants.dart';
import 'package:betna/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserInfo {
 
  static Future<void> saveUserInfoSharedPreference(UserModel user) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(kCacheUserInfo, jsonEncode(user.toJson()));

  }

  static Future<UserModel> getUserInfoSharedPreference() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? value = prefs.getString(kCacheUserInfo);
    if(value == null){
      return UserModel(email: "User@email",name: "User");
    }
    return UserModel.fromJson(jsonDecode(value));
  }
}

import 'dart:convert';

import 'package:betna/core/services/api.dart';

class AuthApi {
  final String baseUrl = "https://zbooma.com/furniture_api/auth/";
   Future<dynamic> loginUser({
    required Map<String, dynamic> body,
  }) async {
    var data = await Api().post(
      url: "${baseUrl}login.php",
      body: jsonEncode(body),
    );
     return data;
  }

  Future<dynamic> signupUser({
    required Map<String, dynamic> body,
  }) async {
    Map<String, dynamic> data = await Api().post(
      url: "${baseUrl}login.php",
      body: jsonEncode(body),
    );
    return data;
  }
}

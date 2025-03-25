import 'dart:convert';

import 'package:betna/core/services/api.dart';
import 'package:betna/core/utils/snack_bar.dart';
import 'package:betna/core/widgets/bottom_navigation_bar.dart';
import 'package:flutter/material.dart';

class AuthApi {
  final String baseUrl = "https://zbooma.com/furniture_api/auth/";
   Future<dynamic> loginUser({
    required Map<String, dynamic> body,
    required BuildContext context,
  }) async {
    var data = await Api().post(
      url: "${baseUrl}login.php",
      body: jsonEncode(body),
    );
     return data;
  }

  Future<dynamic> signupUser({
    required Map<String, dynamic> body,
    required BuildContext context,
  }) async {
    Map<String, dynamic> data = await Api().post(
      url: "${baseUrl}login.php",
      body: jsonEncode(body),
    );
    return data;
  }
}

import 'package:betna/core/utils/snack_bar.dart';
import 'package:betna/core/widgets/bottom_navigation_bar.dart';
import 'package:flutter/material.dart';

void checkError(Map<String, dynamic> respBody, BuildContext context) {
     if (respBody.containsKey("errors") && respBody["status"]=="error") {
      // Map<String, dynamic> errors = response["errors"];
      print(respBody);
      snackBarMessage(context, "name or email already exists");
    }
    snackBarMessage(context, "signed up successfully");
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => BottomNavigation()),
    );
  }
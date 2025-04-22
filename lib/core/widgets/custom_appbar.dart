import 'package:betna/core/utils/font_styles.dart';
import 'package:betna/core/widgets/profile_image.dart';
import 'package:flutter/material.dart';

AppBar customAppBar({required String title, Function()? onTapBackIcon}) {
  return AppBar(
    leading: GestureDetector(
      onTap: onTapBackIcon,
      child: const Icon(Icons.arrow_back_ios_new),
    ),
    actions: const [
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 4),
        child: ProfileImage(),
      ),
    ],
    title: Text(
      title,
      style: FontStyles.textStyle24.copyWith(fontWeight: FontWeight.w500),
    ),
  );
}

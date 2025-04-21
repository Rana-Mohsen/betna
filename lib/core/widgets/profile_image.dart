import 'package:betna/constants.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class ProfileImage extends StatelessWidget {
  const ProfileImage({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: Container(
        height: 7.h,
        width: 7.h,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: kSecondaryColor,
        ),
        child: Image.asset(
          "assets/images/profile_placeholder.png",
          fit: BoxFit.contain,
          // width: 23.w,
        ),
      ),
    );
  }
}

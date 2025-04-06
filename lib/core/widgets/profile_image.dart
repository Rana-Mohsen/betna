import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class ProfileImage extends StatelessWidget {
  const ProfileImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 7.h,
      decoration: const BoxDecoration(
        //  color: Colors.white,
        shape: BoxShape.circle,
      ),
      child: Image.asset(
        "assets/images/profile_image.png",
        fit: BoxFit.contain,
        // width: 23.w,
      ),
    );
  }
}

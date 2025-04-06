import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class OtherLoginMethods extends StatelessWidget {
  const OtherLoginMethods({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          icon: Image.asset("assets/icons/auth/google.png", width: 8.w),
          onPressed: () {},
        ),
        IconButton(
          icon: Image.asset("assets/icons/auth/facebook.png", width: 5.w),
          onPressed: () {},
        ),
        IconButton(
          icon: Image.asset("assets/icons/auth/twitter.png", width: 8.w),
          onPressed: () {},
        ),
      ],
    );
  }
}

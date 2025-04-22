import 'package:betna/core/utils/font_styles.dart';
import 'package:betna/views/profile/widgets/profile_view_body.dart';
import 'package:flutter/material.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "My Profile",
          style: FontStyles.textStyle24.copyWith(fontWeight: FontWeight.w500),
        ),
      ),
      body: const ProfileViewBody(),
    );
  }
}

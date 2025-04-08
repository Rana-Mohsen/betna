import 'package:betna/constants.dart';
import 'package:betna/core/utils/app_routes.dart';
import 'package:betna/core/utils/font_styles.dart';
import 'package:betna/core/widgets/profile_image.dart';
import 'package:betna/core/widgets/search_textfield.dart';
import 'package:betna/views/home/widgets/custom_slider.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sizer/sizer.dart';

class HomeBodyTop extends StatelessWidget {
  const HomeBodyTop({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: 50.w,
              child: Text(
                "Let's furnish your home",
                style: FontStyles.textStyle24,
              ),
            ),
            ProfileImage(),
          ],
        ),
        Row(
          children: [
            IconButton(
              onPressed: () => context.push(AppRoutes.kNotificationView),
              icon: Icon(Icons.notifications_none, color: kPrimaryColor),
            ),
            Flexible(child: SearchTextfield(nav: true)),
          ],
        ),
        CustomSlider(),
      ],
    );
  }
}

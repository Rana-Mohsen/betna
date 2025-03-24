import 'package:betna/constants.dart';
import 'package:betna/core/utils/font_styles.dart';
import 'package:betna/core/widgets/profile_image.dart';
import 'package:betna/core/widgets/search_textfield.dart';
import 'package:betna/views/home/widgets/custom_slider.dart';
import 'package:flutter/material.dart';
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
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(Icons.notifications_none, color: kPrimaryColor),
            ),
            SearchTextfield(),
          ],
        ),
        CustomSlider(),
      ],
    );
  }
}

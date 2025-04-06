import 'package:betna/core/utils/font_styles.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class ImageWithText extends StatelessWidget {
  const ImageWithText({super.key, required this.imagePath, required this.text});
  final String imagePath;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 15,
      children: [
        SizedBox(height: 21.h, child: Image.asset(imagePath)),
        Text(
          text,
          style: FontStyles.textStyle24.copyWith(fontWeight: FontWeight.w500),
        ),
      ],
    );
  }
}

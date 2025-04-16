import 'package:betna/constants.dart';
import 'package:betna/models/onboarding_content_model.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';

class CustomDotIndecator extends StatelessWidget {
  const CustomDotIndecator({
    super.key,
    required this.currentIndex,
  });

  final int currentIndex;

  @override
  Widget build(BuildContext context) {
    return DotsIndicator(
      dotsCount: content.length,
      position: currentIndex.toDouble(),
      decorator: DotsDecorator(
        color: kPrimaryColor,
        activeColor: kPrimaryColor,
        spacing: const EdgeInsets.only(left: 8, bottom: 10),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        size: const Size(7.0, 7.0),
        activeSize: const Size(28.0, 7.0),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }
}
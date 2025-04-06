import 'package:betna/constants.dart';
import 'package:betna/core/utils/font_styles.dart';
import 'package:flutter/material.dart';

class CustomLable extends StatelessWidget {
  const CustomLable({super.key, required this.lable, this.onTap});
  final String lable;
  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 16, top: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(lable, style: FontStyles.textStyle22),
          GestureDetector(
            onTap: onTap,
            child: Text(
              "See all",
              style: FontStyles.textStyle16.copyWith(
                fontWeight: FontWeight.w600,
                color: kPrimaryColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

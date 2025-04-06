import 'package:betna/constants.dart';
import 'package:betna/core/utils/font_styles.dart';
import 'package:betna/core/widgets/profile_image.dart';
import 'package:flutter/material.dart';

class SearchCategory extends StatefulWidget {
  const SearchCategory({super.key});

  @override
  State<SearchCategory> createState() => _SearchCategoryState();
}

class _SearchCategoryState extends State<SearchCategory> {
  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 5,
      children: [
        CircleAvatar(
          radius: 30,
          backgroundColor: kBackgroundColor,
          child: const CircleAvatar(
            backgroundColor: kBackgroundColor,

            backgroundImage: AssetImage("assets/images/chair.png"),
          ),
        ),
        Text(
          "Sofa",
          style: FontStyles.textStyle16.copyWith(color: Color(0xff3F3F3F)),
        ),
      ],
    );
  }
}

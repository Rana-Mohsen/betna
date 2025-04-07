import 'package:betna/constants.dart';
import 'package:betna/core/utils/font_styles.dart';
import 'package:flutter/material.dart';

class SearchCategory extends StatefulWidget {
  const SearchCategory({super.key, required this.image, required this.name});
  final String image;
  final String name;
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
          radius: 33,
          backgroundColor: kBackgroundColor,
          child: CircleAvatar(
            backgroundColor: kBackgroundColor,

            backgroundImage: AssetImage(widget.image),
          ),
        ),
        Text(
          widget.name,
          style: FontStyles.textStyle16.copyWith(color: Color(0xff3F3F3F)),
        ),
      ],
    );
  }
}

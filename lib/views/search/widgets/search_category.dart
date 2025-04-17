import 'package:betna/constants.dart';
import 'package:betna/core/utils/app_routes.dart';
import 'package:betna/core/utils/font_styles.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sizer/sizer.dart';

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
        GestureDetector(
          onTap: () => context.push(AppRoutes.kSeeAllview, extra: widget.name),
          child: Container(
            height: 10.h,
            width: 18.w,
            decoration: BoxDecoration(
              color: kBackgroundColor,
              shape: BoxShape.circle,
            ),
            child: Image.asset(widget.image),
          ),
        ),
        Text(
          widget.name,
          textAlign: TextAlign.center,
          style: FontStyles.textStyle16.copyWith(color: Color(0xff3F3F3F)),
        ),
      ],
    );
  }
}

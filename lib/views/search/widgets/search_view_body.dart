import 'package:betna/constants.dart';
import 'package:betna/core/utils/font_styles.dart';
import 'package:betna/views/search/widgets/search_category.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class SearchViewBody extends StatefulWidget {
  const SearchViewBody({super.key});

  @override
  State<SearchViewBody> createState() => _SearchViewBodyState();
}

class _SearchViewBodyState extends State<SearchViewBody> {
  List<Map<String, dynamic>> categories = [
    {"image": "assets/images/categories/sofa.png", "name": "Sofa"},
    {"image": "assets/images/categories/chair.png", "name": "Chair"},
    {"image": "assets/images/categories/antiques.png", "name": "Antique"},
    {"image": "assets/images/categories/sofa.png", "name": "Sofa"},
    {"image": "assets/images/categories/chair.png", "name": "Chair"},
    {"image": "assets/images/categories/antiques.png", "name": "Antiques"},
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 20,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Popular search",
          style: FontStyles.textStyle20.copyWith(color: kBrownBlackColor),
        ),
        SizedBox(
          height: 30.h,
          child: GridView.count(
            physics: NeverScrollableScrollPhysics(),
            padding: const EdgeInsets.only(right: 24.0),
            crossAxisCount: 4,
            childAspectRatio: 100.w / (100.h / 1.3),
            crossAxisSpacing: 14,
            mainAxisSpacing: 10,
            children: List.generate(categories.length, (index) {
              if (index == categories.length - 1) {
                return SearchCategory(
                  image: "assets/icons/more.png",
                  name: "More",
                );
              }
              return SearchCategory(
                image: categories[index]["image"],
                name: categories[index]["name"],
              );
            }),
          ),
        ),
        Text(
          "Recently search",
          style: FontStyles.textStyle20.copyWith(color: kBrownBlackColor),
        ),
      ],
    );
  }
}

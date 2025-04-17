import 'package:betna/constants.dart';
import 'package:betna/core/utils/font_styles.dart';
import 'package:betna/view_models/home/category_cubit/categories_cubit.dart';
import 'package:betna/views/search/widgets/search_category.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

class SearchViewBodyCategory extends StatefulWidget {
  const SearchViewBodyCategory({super.key});

  @override
  State<SearchViewBodyCategory> createState() => _SearchViewBodyCategoryState();
}

class _SearchViewBodyCategoryState extends State<SearchViewBodyCategory> {
  final Map<String, dynamic> categories = {
    "انتريه": "assets/images/categories/sofa.png",
    "ركنه": "assets/images/categories/chair.png",
    "سفره": "assets/images/categories/antiques.png",
    "غرف نوم اطفال": "assets/images/categories/antiques.png",
    "غرف نوم كلاسيك": "assets/images/categories/sofa.png",
    // {"image": "assets/images/categories/chair.png", "name": "Chair"},
    // {"image": "assets/images/categories/antiques.png", "name": "Antiques"},
  };
  @override
  Widget build(BuildContext context) {
    var ctg = BlocProvider.of<CategoriesCubit>(context).ctgList;
    return Column(
      spacing: 20,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Popular search",
          style: FontStyles.textStyle20.copyWith(color: kBrownBlackColor),
        ),
        SizedBox(
          height: 35.h,
          child: GridView.count(
            physics: NeverScrollableScrollPhysics(),
            padding: const EdgeInsets.only(right: 24.0),
            crossAxisCount: 4,
            childAspectRatio: 100.w / (100.h / 1.1),
            crossAxisSpacing: 14,
            mainAxisSpacing: 10,
            children: List.generate(ctg.length + 1, (index) {
              if (index == ctg.length) {
                return SearchCategory(
                  image: "assets/icons/more.png",
                  name: "More",
                );
              }
              return SearchCategory(
                image: categories[ctg[index].name],
                name: ctg[index].name,
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

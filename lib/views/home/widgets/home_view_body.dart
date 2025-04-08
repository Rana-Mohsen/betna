import 'package:betna/constants.dart';
import 'package:betna/core/widgets/custom_lable.dart';
import 'package:betna/view_models/home/categories_cubit.dart';
import 'package:betna/views/home/widgets/custom_choice_chip.dart';
import 'package:betna/views/home/widgets/custom_listview.dart';
import 'package:betna/views/home/widgets/home_body_top.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: kMainPadding,
          child: SizedBox(height: 50.h, child: HomeBodyTop()),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 16),
          child: Column(
            spacing: 14,
            children: [
              CustomLable(lable: "Categories", onTap: () {}),
              CustomChoiceChip(),
              BlocBuilder<CategoriesCubit, CategoriesState>(
                builder: (context, state) {
                  if (state is CategoriesChoosed && state.lable != "All") {
                    return Column(
                      spacing: 15,
                      children: [
                        CustomLable(lable: state.lable, onTap: () {}),
                        CustomListView(
                          categoryItemList: itemList[state.lable]!.toList(),
                        ),
                        SizedBox(height: 5),
                      ],
                    );
                  } else {
                    return SizedBox(
                      height: 132.h,
                      child: ListView.builder(
                        padding: EdgeInsets.all(0),
                        itemExtent: 260,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: categoriesList.length,
                        itemBuilder:
                            (context, index) => Column(
                              spacing: 15,
                              children: [
                                CustomLable(
                                  lable: categoriesList[index],
                                  onTap: () {},
                                ),
                                CustomListView(
                                  categoryItemList:
                                      itemList[categoriesList[index]]!.toList(),
                                ),
                              ],
                            ),
                      ),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}

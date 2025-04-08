import 'package:betna/constants.dart';
import 'package:betna/core/utils/app_routes.dart';
import 'package:betna/core/widgets/custom_lable.dart';
import 'package:betna/view_models/home/categories_cubit.dart';
import 'package:betna/views/home/widgets/custom_choice_chip.dart';
import 'package:betna/views/home/widgets/custom_listview.dart';
import 'package:betna/views/home/widgets/home_body_top.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:sizer/sizer.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: kMainPadding,
          child: SizedBox(height: 50.h, child: HomeBodyTop()),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            spacing: 14,
            children: [
              CustomLable(
                lable: "Categories",
                onTap: () {
                  context.push(AppRoutes.kSearchView);
                },
              ),
              CustomChoiceChip(),
              BlocBuilder<CategoriesCubit, CategoriesState>(
                builder: (context, state) {
                  if (state is CategoriesChoosed && state.lable != "All") {
                    // print(state.lable);
                    return Column(
                      spacing: 15,
                      children: [
                        CustomLable(
                          lable: state.lable,
                          onTap: () {
                            context.push(
                              AppRoutes.kSeeAllview,
                              extra: state.lable.toLowerCase(),
                            );
                          },
                        ),
                        CustomListView(
                          categoryItemList: itemList[state.lable.toLowerCase()]!.toList(),
                        ),
                        SizedBox(height: 5),
                      ],
                    );
                  } else {
                    print("here");
                    return ListView.builder(
                      shrinkWrap: true,
                      padding: EdgeInsets.all(0),
                      itemExtent: 260,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: categoriesList.length,
                      itemBuilder: (context, index) {
                        print(categoriesList[index] + index.toString());
                        return Column(
                          spacing: 15,
                          children: [
                            CustomLable(
                              lable: categoriesList[index],
                              onTap: () {
                                context.push(
                                  AppRoutes.kSeeAllview,
                                  extra: categoriesList[index],
                                );
                              },
                            ),
                            CustomListView(
                              categoryItemList:
                                  itemList[categoriesList[index].toLowerCase()]!
                                      .toList(),
                            ),
                          ],
                        );
                      },
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

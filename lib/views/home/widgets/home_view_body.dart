import 'package:betna/core/widgets/custom_lable.dart';
import 'package:betna/views/home/widgets/custom_choice_chip.dart';
import 'package:betna/views/home/widgets/custom_listview.dart';
import 'package:betna/views/home/widgets/home_body_top.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: SizedBox(
            height: 50.h,
             child: HomeBodyTop(),
             ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 16),
          child: Column(
            spacing: 14,
            children: [
              CustomLable(lable: "Categories", onTap: () {}),
              CustomChoiceChip(),
              CustomLable(lable: "Chair", onTap: () {}),
              CustomListView(),
              CustomLable(lable: "Chair", onTap: () {}),
              CustomListView(),
            ],
          ),
        ),
      ],
    );
  }
}

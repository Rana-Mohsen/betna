import 'package:betna/constants.dart';
import 'package:betna/view_models/home/categories_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:sizer/sizer.dart';

class CustomChoiceChip extends StatefulWidget {
  const CustomChoiceChip({super.key});

  @override
  State<CustomChoiceChip> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomChoiceChip> {
  List<bool> isSel = List.generate(6, (index) {
    return index == 0 ? true : false;
  });

  List<Map<String, dynamic>> lables = [
    {"lable": "All", "icon": null},
    {"lable": "Chair", "icon": Icons.chair_alt_outlined},
    {"lable": "Sofa", "icon": Icons.chair},
    {"lable": "Antique", "icon": Icons.desk_outlined},
    {"lable": "Chair", "icon": Icons.chair_alt_outlined},
  ];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      //  width: 100.w,
      height: 5.h,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: List.generate(5, (index) {
          return Padding(
            padding: const EdgeInsets.only(right: 16),
            child: ChoiceChip(
              side:
                  isSel[index]
                      ? BorderSide.none
                      : BorderSide(color: Color(0xff9AADAF), width: 1.2),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(22),
              ),
              showCheckmark: false,
              //padding: const EdgeInsets.all(8),
              label:
                  index == 0
                      ? Text(lables[index]["lable"])
                      : Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icon(
                            lables[index]["icon"],
                            color: isSel[index] ? Colors.white : kPrimaryColor,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 8),
                            child: Text(lables[index]["lable"]),
                          ),
                        ],
                      ),
              labelStyle: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: isSel[index] ? Colors.white : kPrimaryColor,
              ),
              selectedColor: kPrimaryColor,
              backgroundColor: kBackgroundColor,
              selected: isSel[index],
              onSelected: (bool selected) {
                setState(() {
                  isSel.fillRange(0, 6, false);
                  isSel[index] = selected;
                  if (index == 0) {
                    BlocProvider.of<CategoriesCubit>(context).allCategory();
                  } else {
                    BlocProvider.of<CategoriesCubit>(context).chooseCategory(
                      lable: lables[index]["lable"],
                    );
                  }
                });
              },
            ),
          );
        }),
      ),
    );
  }
}

import 'package:betna/constants.dart';
import 'package:betna/core/utils/font_styles.dart';
import 'package:betna/core/widgets/add_icon.dart';
import 'package:betna/core/widgets/favorite_icon.dart';
import 'package:betna/core/widgets/item_rating.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CustomItemCard extends StatelessWidget {
  const CustomItemCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: SizedBox(
          height: 20.h,
          child: Row(
            children: [
              Flexible(
                child: Container(
                  color: kBackgroundColor,
                  child: Row(
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: FavoriteIcon(),
                      ),
                      Flexible(
                        child: Image.asset(
                          "assets/images/chair.png",
                          width: 30.w,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                color: Color(0xffD4DDDD),
                width: 48.w,
                child: Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Row(
                        children: [
                          Text("Modern chair", style: FontStyles.textStyle16),
                          ItemRating(),
                        ],
                      ),
                      Row(
                        spacing: 60,
                        children: [
                          Text(
                            "\$100",
                            style: FontStyles.textStyle18.copyWith(
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const AddIcon(size: 25),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

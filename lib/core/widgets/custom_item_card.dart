import 'package:betna/constants.dart';
import 'package:betna/core/utils/font_styles.dart';
import 'package:betna/core/widgets/add_icon.dart';
import 'package:betna/core/widgets/favorite_icon.dart';
import 'package:betna/core/widgets/item_rating.dart';
import 'package:betna/models/Item_model.dart';
import 'package:betna/views/home/product_view.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CustomItemCard extends StatelessWidget {
  const CustomItemCard({super.key, required this.item});
  final ItemModel item;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: GestureDetector(
        onTap:
            () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ProductView(item: item)),
            ),
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
                          child: FavoriteIcon(item: item),
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
                          spacing: 5,
                          children: [
                            Text(item.name, style: FontStyles.textStyle16),
                            ItemRating(),
                          ],
                        ),
                        Row(
                          spacing: 60,
                          children: [
                            Text(
                              "\$${item.price}",
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
      ),
    );
  }
}

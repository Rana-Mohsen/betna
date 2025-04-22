import 'package:betna/constants.dart';
import 'package:betna/core/utils/app_routes.dart';
import 'package:betna/core/utils/font_styles.dart';
import 'package:betna/core/widgets/add_icon.dart';
import 'package:betna/core/widgets/favorite_icon.dart';
import 'package:betna/core/widgets/item_rating.dart';
import 'package:betna/models/cart_model.dart';
import 'package:betna/models/item_model.dart';
import 'package:betna/views/cart/widgets/cart_add_icon.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sizer/sizer.dart';

class CustomOrderItemCard extends StatelessWidget {
  const CustomOrderItemCard({super.key, required this.item});
  final CartModel item;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: GestureDetector(
        onTap:
            () =>
                GoRouter.of(context).push(AppRoutes.kProductView, extra: item),

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
                        // Align(
                        //   alignment: Alignment.topLeft,
                        //   child: FavoriteIcon(item: item),
                        // ),
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
                  color: const Color(0xffD4DDDD),
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
                            const ItemRating(),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "\$${item.price}",
                              style: FontStyles.textStyle18.copyWith(
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 16.0),
                              child: CartAddIcon(size: 25, item: item),
                            ),
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

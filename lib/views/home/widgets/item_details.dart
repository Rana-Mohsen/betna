import 'package:betna/constants.dart';
import 'package:betna/core/utils/font_styles.dart';
import 'package:betna/core/utils/functions/snack_bar.dart';
import 'package:betna/core/widgets/custom_button.dart';
import 'package:betna/core/widgets/item_rating.dart';
import 'package:betna/models/Item_model.dart';
import 'package:betna/view_models/cart/cart_list/cart_list_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

class ItemDetails extends StatelessWidget {
  const ItemDetails({super.key, required this.item});
  final ItemModel item;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45.h,
      decoration: const BoxDecoration(color: Colors.white),
      child: Padding(
        padding: const EdgeInsets.only(top: 60, left: 16, right: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              spacing: 5,
              children: [
                Text(
                  item.name,
                  style: FontStyles.textStyle24.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const ItemRating(iconSize: 15, fontSize: 14),
                const Spacer(flex: 1),
                Text(
                  "\$${item.price}",
                  style: FontStyles.textStyle24.copyWith(
                    color: kPrimaryColor,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            const Text("Details", style: FontStyles.textStyle16),
            Text(
              "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
              style: FontStyles.textStyle14.copyWith(color: kGrayColor),
            ),
            SizedBox(
              height: 9.h,
              child: ListView.builder(
                itemCount: 3,
                scrollDirection: Axis.horizontal,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder:
                    (context, index) => GestureDetector(
                      onTap: () {},
                      child: Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(13),
                          child: Image.asset("assets/images/chair2.png"),
                        ),
                      ),
                    ),
              ),
            ),
            const SizedBox(height: 16),
            CustomButton(
              text: "Add to cart",
              onTap: () {
                checkCart(context);
              },
            ),
          ],
        ),
      ),
    );
  }

  void checkCart(BuildContext context) {
    if (cartList.contains(item)) {
      snackBarMessage(context, 'Item already in cart');
    } else {
      BlocProvider.of<CartListCubit>(context).addItem(item);
      snackBarMessage(context, 'Item added to cart');
    }
  }
}

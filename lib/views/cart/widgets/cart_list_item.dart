import 'package:betna/constants.dart';
import 'package:betna/core/Local_Storage/user_info.dart';
import 'package:betna/core/utils/font_styles.dart';
import 'package:betna/core/widgets/item_rating.dart';
import 'package:betna/core/widgets/item_count.dart';
import 'package:betna/models/cart_model.dart';
import 'package:betna/view_models/cart/cart_list/cart_list_cubit.dart';
import 'package:betna/views/cart/widgets/cart_item_count.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

class CartListItem extends StatefulWidget {
  const CartListItem({super.key, required this.item});
  final CartModel item;

  @override
  State<CartListItem> createState() => _CartListItemState();
}

class _CartListItemState extends State<CartListItem> {
  bool showOption = false;

  
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: GestureDetector(
          onHorizontalDragUpdate: (details) {
            setState(() {
              if (details.delta.dx > 0) {
                showOption = false;
              } else if (details.delta.dx < 0) {
                showOption = true;
              }
            });
          },
          child: SizedBox(
            height: 20.h,
            child: Row(
              children: [
                Flexible(
                  child: AnimatedContainer(
                    duration: Duration(milliseconds: 500),
                    //width: showOption ? 34.w : 45.w,
                    color: kBackgroundColor,
                    child: Row(
                      children: [
                        // Align(
                        //   alignment: Alignment.topLeft,
                        //   child: FavoriteIcon(item: widget.item),
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
                  color: Color(0xffD4DDDD),
                  width: 45.w,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Row(
                          children: [
                            Text(
                              widget.item.name,
                              style: FontStyles.textStyle16,
                            ),
                            ItemRating(),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: 20.w,
                              child: Text(
                                "\$${widget.item.price}",
                                style: FontStyles.textStyle18.copyWith(
                                  fontWeight: FontWeight.w600,
                                  overflow: TextOverflow.fade,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 16.0),
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),

                                  color: const Color(0xff73888A),
                                ),
                                child: CartItemCount(
                                  item: widget.item,
                                  countPadding: EdgeInsets.symmetric(
                                    horizontal: 0,
                                  ),

                                  iconPadding: EdgeInsets.symmetric(
                                    horizontal: 6,
                                    vertical: 3,
                                  ),
                                  iconSize: 12,
                                  fontSize: 14,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    BlocProvider.of<CartListCubit>(
                      context,
                    ).removeItemList(UserInfo.userId!,widget.item.id.toString());

                    ScaffoldMessenger.of(
                      context,
                    ).showSnackBar(SnackBar(content: Text('Item removed')));
                  },
                  child: AnimatedContainer(
                    duration: Duration(milliseconds: 300),
                    width: showOption ? 10.w : 0.0,
                    child: Container(
                      color: kPrimaryColor,
                      alignment: Alignment.center,
                      child: Icon(Icons.delete_outline, color: Colors.white),
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

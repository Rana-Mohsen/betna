import 'package:betna/constants.dart';
import 'package:betna/core/Local_Storage/local_cart.dart';
import 'package:betna/core/Local_Storage/user_info.dart';
import 'package:betna/core/utils/font_styles.dart';
import 'package:betna/models/cart_model.dart';
import 'package:betna/view_models/cart/cart_list/cart_list_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartItemCount extends StatefulWidget {
  final CartModel item;
  final double iconSize;
  final double fontSize;
  final EdgeInsetsGeometry iconPadding;
  final EdgeInsetsGeometry countPadding;

  const CartItemCount({
    super.key,
    this.iconSize = 24.0,
    this.fontSize = 16.0,
    required this.iconPadding,
    required this.countPadding,
    required this.item,
  });

  @override
  State<CartItemCount> createState() => _CartItemCountState();
}

class _CartItemCountState extends State<CartItemCount> {
  late List<CartModel> cartList;

  @override
  Widget build(BuildContext context) {
    var bloc = BlocProvider.of<CartListCubit>(context);
    return Padding(
      padding: widget.iconPadding,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        spacing: 4,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          customCountIcon(
            icon: Icons.add,
            iconSize: widget.iconSize,
            onTap: () async {
              setState(() {
                //widget.item.count++;
                //bloc.cartList.add(widget.item);
                bloc.editItem(widget.item.id, widget.item.quantity + 1);
                // bloc.addItem({
                //   "user_id": UserInfo.userId ?? "",
                //   "product_id": productId,
                //   "quantity": 1,
                // });
              });
            },
          ),
          Padding(
            padding: widget.countPadding,
            child: BlocBuilder<CartListCubit, CartListState>(
              builder: (context, state) {
                cartList = BlocProvider.of<CartListCubit>(context).cartList;
                if (state is CartCountLoading) {
                  return const SizedBox(
                    height: 15,
                    width: 15,
                    child: kCircleProggress,
                  );
                }
                return Text(
                  widget.item.quantity.toString(),
                  style: FontStyles.textStyle24.copyWith(
                    fontSize: widget.fontSize,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                );
              },
            ),
          ),
          customCountIcon(
            icon: Icons.remove,
            iconSize: widget.iconSize,
            onTap: () {
              if (widget.item.quantity > 0) {
                setState(() {
                  if (widget.item.quantity - 1 > 0) {
                    bloc.editItem(widget.item.id, widget.item.quantity - 1);
                  } else {
                    bloc.removeItemList(
                      UserInfo.userId!,
                      widget.item.id.toString(),
                    );
                  }
                });
              }
            },
          ),
        ],
      ),
    );
  }

  Widget customCountIcon({
    required VoidCallback onTap,
    required IconData icon,
    required double iconSize,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xffF5F5F5),
          borderRadius: BorderRadius.circular(iconSize / 2),
        ),
        child: Padding(
          padding: EdgeInsets.all(iconSize * 0.2),
          child: Icon(icon, color: kPrimaryColor, size: iconSize),
        ),
      ),
    );
  }
}

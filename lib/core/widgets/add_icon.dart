import 'package:betna/constants.dart';
import 'package:betna/core/utils/functions/add_items_to_cart.dart';
import 'package:betna/models/item_model.dart';
import 'package:betna/view_models/cart/cart_list/cart_list_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddIcon extends StatelessWidget {
  const AddIcon({super.key, this.size = 20, required this.item});
  final double? size;
  final ItemModel item;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:
          () => BlocProvider.of<CartListCubit>(
            context,
          ).addItem({"user_id": kUserId, "product_id": item.id, "quantity": 1}),
      child: Container(
        padding: EdgeInsets.all(2),
        decoration: BoxDecoration(shape: BoxShape.circle, color: kPrimaryColor),
        child: Icon(Icons.add, size: size, color: Colors.white),
      ),
    );
  }
}

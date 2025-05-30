import 'package:betna/constants.dart';
import 'package:betna/core/Local_Storage/user_info.dart';
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
      onTap: () {
        BlocProvider.of<CartListCubit>(
          context,
        ).addItem({"user_id": UserInfo.userId, "product_id": item.id, "quantity": 1});
        
        BlocProvider.of<CartListCubit>(context).getCartList(UserInfo.userId??"");
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(const SnackBar(content: Text('Item added to cart')));
      },
      child: Container(
        padding: const EdgeInsets.all(2),
        decoration: const BoxDecoration(shape: BoxShape.circle, color: kPrimaryColor),
        child: Icon(Icons.add, size: size, color: Colors.white),
      ),
    );
  }
}

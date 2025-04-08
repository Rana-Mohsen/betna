import 'package:betna/constants.dart';
import 'package:betna/core/utils/functions/add_items_to_cart.dart';
import 'package:betna/models/Item_model.dart';
import 'package:flutter/material.dart';

class AddIcon extends StatelessWidget {
  const AddIcon({super.key, this.size = 20, required this.item});
  final double? size;
  final ItemModel item;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => AddItemsToCart.singleItem(context,item),
      child: Container(
        padding: EdgeInsets.all(2),
        decoration: BoxDecoration(shape: BoxShape.circle, color: kPrimaryColor),
        child: Icon(Icons.add, size: size, color: Colors.white),
      ),
    );
  }

  
}

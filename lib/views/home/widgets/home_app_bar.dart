import 'package:betna/core/widgets/favorite_icon.dart';
import 'package:betna/models/Item_model.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key, required this.item});
final ItemModel item;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100.w,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: () => Navigator.pop(context),
            icon: Icon(Icons.arrow_back_ios_new),
          ),
          FavoriteIcon(size: 30, padding: 4, item: item,),
        ],
      ),
    );
  }
}

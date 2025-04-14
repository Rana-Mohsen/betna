import 'package:betna/models/item_model.dart';
import 'package:betna/views/home/widgets/listview_item.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CustomListView extends StatelessWidget {
  const CustomListView({super.key, required this.categoryItemList});
  final List<ItemModel> categoryItemList;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 23.h,
      child: ListView.builder(
        itemCount: categoryItemList.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: ListViewItem(item: categoryItemList[index]),
          );
        },
      ),
    );
  }
}

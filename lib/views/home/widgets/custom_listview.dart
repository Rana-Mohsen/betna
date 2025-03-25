import 'package:betna/constants.dart';
import 'package:betna/views/home/product_view.dart';
import 'package:betna/views/home/widgets/listview_item.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CustomListView extends StatelessWidget {
  const CustomListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 23.h,
      child: ListView.builder(
        itemCount: 5,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProductView(item: itemList[index]),
                  ),
                );
              },
              child: ListViewItem(item: itemList[index]),
            ),
          );
        },
      ),
    );
  }
}

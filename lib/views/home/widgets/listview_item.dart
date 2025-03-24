import 'package:betna/constants.dart';
import 'package:betna/core/widgets/favorite_icon.dart';
import 'package:betna/views/home/widgets/listview_item_bottom.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class ListViewItem extends StatelessWidget {
  const ListViewItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 31.w,
      decoration: BoxDecoration(
        color: kBackgroundColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Stack(
          alignment: AlignmentDirectional.center,
          children: [
            Align(alignment: Alignment.topRight, child: FavoriteIcon()),
            Positioned(
              top: 4.h,
              child: Image.asset("assets/images/chair.png", width: 22.w),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                padding: EdgeInsets.all(8),
                height: 9.h,
                color: kSecondaryColor,
                child: ListviewItemBottom(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


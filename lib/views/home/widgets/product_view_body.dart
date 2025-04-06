import 'package:betna/constants.dart';
import 'package:betna/models/Item_model.dart';
import 'package:betna/views/home/widgets/home_app_bar.dart';
import 'package:betna/core/widgets/item_count.dart';
import 'package:betna/views/home/widgets/image_view.dart';
import 'package:betna/views/home/widgets/item_details.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class ProductViewBody extends StatefulWidget {
  const ProductViewBody({super.key, required this.item});
  final ItemModel item;
  @override
  State<ProductViewBody> createState() => _ProductViewBodyState();
}

class _ProductViewBodyState extends State<ProductViewBody> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: kBackgroundColor,
      child: Stack(
        alignment: Alignment.topCenter,
        children: [

          Positioned(
            top: 10.h,
            child: SizedBox(
              width: 90.w,
              height: 42.h,
              child: FittedBox(child: ImageView()),
            ),
          ),
          Positioned(top: 5.h, child: HomeAppBar(item: widget.item)),
          Align(
            alignment: Alignment.bottomCenter,
            child: ItemDetails(item: widget.item),
          ),
          Positioned(
            bottom: 40.h,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),

                color: const Color(0xff73888A),
                border: Border.all(color: Colors.white, width: 6),
              ),
              child: ItemCount(
                item: widget.item,
                iconPadding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                countPadding: EdgeInsets.symmetric(horizontal: 16),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

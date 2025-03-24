import 'package:betna/constants.dart';
import 'package:betna/views/home/widgets/home_app_bar.dart';
import 'package:betna/core/widgets/item_count.dart';
import 'package:betna/views/home/widgets/item_details.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class ProductViewBody extends StatefulWidget {
  const ProductViewBody({super.key});

  @override
  State<ProductViewBody> createState() => _ProductViewBodyState();
}

class _ProductViewBodyState extends State<ProductViewBody> {
  @override
  Widget build(BuildContext context) {
    // bool isFav = widget.article.isFav;
    return Container(
      color: kBackgroundColor,
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          Positioned(
            top: 10.h,
            child: SizedBox(
              height: 40.h,
              child: Image.asset(
                "assets/images/chair.png",

                fit: BoxFit.contain,
              ),
            ),
          ),
          Positioned(top: 5.h, child: HomeAppBar()),
          Align(alignment: Alignment.bottomCenter, child: ItemDetails()),
          Positioned(
            bottom: 40.h,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),

                color: const Color(0xff73888A),
                border: Border.all(color: Colors.white, width: 6),
              ),
              child: ItemCount(
                iconPadding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                countPadding: EdgeInsets.symmetric(horizontal: 16),
                onAdd: () {},
                onRemove: () {},
              ),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:betna/constants.dart';
import 'package:betna/core/utils/font_styles.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CartInfo extends StatefulWidget {
  const CartInfo({super.key});

  @override
  State<CartInfo> createState() => _CartInfoState();
}

class _CartInfoState extends State<CartInfo> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      height: 17.h,
      width: double.infinity,
      decoration: BoxDecoration(
        color: kBackgroundColor,
        border: Border.all(color: Color(0xff9AADAF)),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        spacing: 20,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Total price", style: TextStyle(fontSize: 20)),
              Text(
                "\$100",
                style: FontStyles.textStyle22.copyWith(
                  fontWeight: FontWeight.w600,
                  color: kPrimaryColor,
                ),
              ),
            ],
          ),

          Text(
            "2 Items",
            style: FontStyles.textStyle18.copyWith(color: kGrayColor),
          ),
        ],
      ),
    );
  }
}

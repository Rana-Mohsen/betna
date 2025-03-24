import 'package:betna/constants.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class SliderItem extends StatelessWidget {
  const SliderItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 25.h,
        //width: 90.w,
        decoration: BoxDecoration(
          color: kBackgroundColor,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 40.w,
              child: Text(
                "30% OFF",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 30.sp,
                  color: Color(0xff9B5619),
                  fontFamily: "Lobster",
                  // overflow: TextOverflow.visible,
                ),
              ),
            ),
            Flexible(
              child: SizedBox(
                width: 25.h,
                child: Image.asset("assets/images/chair.png"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

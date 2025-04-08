import 'package:betna/constants.dart';
import 'package:betna/core/widgets/custom_button.dart';
import 'package:betna/core/widgets/custom_item_card.dart';
import 'package:betna/core/widgets/search_textfield.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class MyOrderViewBody extends StatefulWidget {
  const MyOrderViewBody({super.key,});
  @override
  State<MyOrderViewBody> createState() => _MyOrderViewBodyState();
}

class _MyOrderViewBodyState extends State<MyOrderViewBody> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        spacing: 25,
        children: [
          SearchTextfield(cameraIcon: false),
          SizedBox(
            height: 43.h,
            child: ListView.builder(
              itemCount: cartList.length,
              itemBuilder: (context, index) => CustomItemCard(item: cartList[index],),
            ),
          ),
          CustomButton(onTap: () {}, text: "You have 3 item in cart "),
        ],
      ),
    );
  }
}

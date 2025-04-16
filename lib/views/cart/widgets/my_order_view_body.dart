import 'package:betna/core/widgets/custom_button.dart';
import 'package:betna/core/widgets/custom_item_card.dart';
import 'package:betna/core/widgets/search_textfield.dart';
import 'package:betna/models/item_model.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class MyOrderViewBody extends StatefulWidget {
  const MyOrderViewBody({super.key, required this.cartList});
  final List<ItemModel> cartList;
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
              itemCount: widget.cartList.length,
              itemBuilder:
                  (context, index) => CustomItemCard(item: widget.cartList[index]),
            ),
          ),
          CustomButton(
            onTap: () {},
            text: "You have ${widget.cartList.length} item in cart ",
          ),
        ],
      ),
    );
  }
}

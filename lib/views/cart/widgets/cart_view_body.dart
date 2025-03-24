import 'package:betna/core/widgets/custom_button.dart';
import 'package:betna/views/cart/my_order_view.dart';
import 'package:betna/views/cart/widgets/cart_info.dart';
import 'package:betna/views/cart/widgets/cart_list_item.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CartViewBody extends StatefulWidget {
  const CartViewBody({super.key});

  @override
  State<CartViewBody> createState() => _CartViewBodyState();
}

class _CartViewBodyState extends State<CartViewBody> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        spacing: 20,
        children: [
          SizedBox(
            height: 45.h,
            child: ListView.builder(
              itemCount: 3,
              itemBuilder: (context, index) => CartListItem(),
            ),
          ),
          CartInfo(),
          CustomButton(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MyOrderView()),
              );
            },
            text: "Check out",
          ),
        ],
      ),
    );
  }
}

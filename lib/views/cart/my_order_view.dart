import 'package:betna/constants.dart';
import 'package:betna/core/widgets/custom_appbar.dart';
import 'package:betna/models/cart_model.dart';
import 'package:betna/models/item_model.dart';
import 'package:betna/views/cart/widgets/my_order_view_body.dart';
import 'package:flutter/material.dart';

class MyOrderView extends StatefulWidget {
  const MyOrderView({super.key, required this.cartList});
  final List<CartModel> cartList;

  @override
  State<MyOrderView> createState() => _MyOrderViewState();
}

class _MyOrderViewState extends State<MyOrderView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(
        title: "My Cart",
        onTapBackIcon: () => Navigator.pop(context),
      ),
      body: Padding(
        padding: kMainPadding,
        child: MyOrderViewBody(cartList: widget.cartList,),
      ),
    );
  }
}

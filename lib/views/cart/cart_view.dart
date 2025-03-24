import 'package:betna/core/widgets/bottom_navigation_bar.dart';
import 'package:betna/core/widgets/custom_appbar.dart';
import 'package:betna/views/cart/widgets/cart_view_body.dart';
import 'package:flutter/material.dart';

class CartView extends StatefulWidget {
  const CartView({super.key});

  @override
  State<CartView> createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(
        title: "My Cart",
        onTapBackIcon:
            () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => BottomNavigation()),
            ),
      ),
      body: CartViewBody(),
    );
  }
}

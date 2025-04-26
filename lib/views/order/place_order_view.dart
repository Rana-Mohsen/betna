import 'package:betna/core/widgets/custom_appbar.dart';
import 'package:betna/views/order/widget/place_order_view_body.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class PlaceOrderView extends StatelessWidget {
  const PlaceOrderView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(
        title: "Place Order",
        onTapBackIcon: () => context.pop(),
      ),
      body: const SingleChildScrollView(child: PlaceOrderViewBody()),
    );
  }
}

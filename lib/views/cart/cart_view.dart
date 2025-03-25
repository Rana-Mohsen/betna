import 'package:betna/constants.dart';
import 'package:betna/core/widgets/bottom_navigation_bar.dart';
import 'package:betna/core/widgets/custom_appbar.dart';
import 'package:betna/models/Item_model.dart';
import 'package:betna/view_models/cart/cart_list/cart_list_cubit.dart';
import 'package:betna/views/cart/widgets/cart_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
      body: BlocBuilder<CartListCubit, CartListState>(
        builder: (context, state) {
          if (state is CartListEmpty || cartList.isEmpty) {
            return Center(child: Text("Empty cart! \n Add items"));
          }
    
          return CartViewBody();
        },
      ),
    );
  }
}

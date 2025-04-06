import 'package:betna/constants.dart';
import 'package:betna/core/utils/app_routes.dart';
import 'package:betna/core/widgets/custom_button.dart';
import 'package:betna/view_models/cart/cart_list/cart_list_cubit.dart';
import 'package:betna/views/cart/my_order_view.dart';
import 'package:betna/views/cart/widgets/cart_info.dart';
import 'package:betna/views/cart/widgets/cart_list_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
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
            child: BlocBuilder<CartListCubit, CartListState>(
              builder: (context, state) {
                return ListView.builder(
                  itemCount: cartList.length,
                  itemBuilder:
                      (context, index) => CartListItem(item: cartList[index]),
                );
              },
            ),
          ),
          CartInfo(),
          CustomButton(
            onTap: () {
              GoRouter.of(context).push(AppRoutes.kMyOrderView);
            },
            text: "Check out",
          ),
        ],
      ),
    );
  }
}

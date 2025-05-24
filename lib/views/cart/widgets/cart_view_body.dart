import 'package:betna/constants.dart';
import 'package:betna/core/utils/app_routes.dart';
import 'package:betna/core/widgets/custom_button.dart';
import 'package:betna/models/cart_model.dart';
import 'package:betna/view_models/cart/cart_list/cart_list_cubit.dart';
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
  late List<CartModel> cartList;

  @override
  Widget build(BuildContext context) {
    cartList = BlocProvider.of<CartListCubit>(context).cartList;

    return Column(
      spacing: 20,
      children: [
        SizedBox(
          height: 45.h,
          child: ListView.builder(
            itemCount: cartList.length,
            itemBuilder: (context, index) {
              return CartListItem(item: cartList[index]);
            },
          ),
        ),
        CartInfo(cartListLength: cartList.length),
        CustomButton(
          onTap: () {
            GoRouter.of(context).push(AppRoutes.kMyOrderView, extra: cartList);
          },
          text: "Check out",
        ),
      ],
    );
  }
}

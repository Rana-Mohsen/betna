import 'package:betna/constants.dart';
import 'package:betna/core/utils/font_styles.dart';
import 'package:betna/view_models/cart/cart_list/cart_list_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

class CartInfo extends StatefulWidget {
  const CartInfo({super.key, required this.cartListLength});
  final int cartListLength;

  @override
  State<CartInfo> createState() => _CartInfoState();
}

class _CartInfoState extends State<CartInfo> {
  @override
  Widget build(BuildContext context) {
    var bloc = BlocProvider.of<CartListCubit>(context);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      height: 17.h,
      width: double.infinity,
      decoration: BoxDecoration(
        color: kBackgroundColor,
        border: Border.all(color: const Color(0xff9AADAF)),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        spacing: 20,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text("Total price", style: TextStyle(fontSize: 20)),
              BlocBuilder<CartListCubit, CartListState>(
                builder: (context, state) {
                  
                    return Text(
                      "\$${bloc.totalPrice}",
                      style: FontStyles.textStyle22.copyWith(
                        fontWeight: FontWeight.w600,
                        color: kPrimaryColor,
                      ),
                    );
                 
                },
              ),
            ],
          ),

          Text(
            "${widget.cartListLength} Items",
            style: FontStyles.textStyle18.copyWith(color: kGrayColor),
          ),
        ],
      ),
    );
  }
}

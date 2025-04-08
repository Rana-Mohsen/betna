import 'package:betna/constants.dart';
import 'package:betna/core/utils/functions/snack_bar.dart';
import 'package:betna/models/Item_model.dart';
import 'package:betna/view_models/cart/cart_list/cart_list_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class AddItemsToCart{
  static void singleItem(BuildContext context, ItemModel item) {
    if (cartList.contains(item)) {
      snackBarMessage(context, 'Item already in cart');
    } else {
      BlocProvider.of<CartListCubit>(context).addItem(item);
      snackBarMessage(context, 'Item added to cart');
    }
  }

   static void multiItems(BuildContext context, ItemModel item) {
     for (var favItem in favList) {
              if (!cartList.contains(favItem)) {
                BlocProvider.of<CartListCubit>(context).addItem(favItem);
              }
            }
            snackBarMessage(context, "All items added to cart");
  }
}

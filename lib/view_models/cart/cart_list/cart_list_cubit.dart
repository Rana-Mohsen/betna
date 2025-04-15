import 'package:betna/constants.dart';
import 'package:betna/core/services/cart_api.dart';
import 'package:betna/models/cart_model.dart';
import 'package:betna/models/item_model.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'cart_list_state.dart';

class CartListCubit extends Cubit<CartListState> {
  CartListCubit(this._api) : super(CartListInitial());
  double totalPrice = 0;
  List<CartModel> cartList = [];

  final CartApi _api;
  Future<void> getCartList(String userID, List<ItemModel> products) async {
    var cartItems = await _api.getItemCart(userID);
    //print(products);
    cartItems.fold(
      (left) {
        emit(CartError(left.errMessage));
      },
      (right) {
        // for (var item in right) {
        //   ItemModel match = products.where((p) => p.id == item.id).first;
        //   if (match != null) {
        //     match.count = item.quantity;
        //     match.price = item.price;
        //     cartList.add(match);
        //   }
        // }
        cartList = right;
        if (right.isEmpty) {
          emit(CartListEmpty());
        } else {
          emit(CartSuccess(cartList));
        }
      },
    );
  }
  // removeItem(String ctg, ItemModel item) {
  //   for (ItemModel itm in itemList[ctg]!) {
  //     if (itm.name == item.name) {
  //       item.count = 0;
  //       break;
  //     }
  //   }
  //   cartTotalPrice();
  //   cartList.remove(item);
  //   emit(CartListItemChanged());
  //   if (cartList.isEmpty) {
  //     emit(CartListEmpty());
  //   }
  // }

  addItem(Map<String, dynamic> body) async {
    var data = await _api.addToCart(body);
    //print(products);
    data.fold(
      (left) {
        emit(CartError(left.errMessage));
      },
      (right) {
        emit(CartListItemChanged());
      },
    );
    // if (item.count == 0) {
    //   item.count++;
    //   cartList.add(item);
    // } else {
    //   cartList.add(item);
    // }
    // cartTotalPrice();

    // emit(CartListItemChanged());
  }

  cartTotalPrice() {
    totalPrice = 0;
    for (var item in cartList) {
      totalPrice += int.parse(item.price);
    }
    emit(CartListItemChanged());
  }
}

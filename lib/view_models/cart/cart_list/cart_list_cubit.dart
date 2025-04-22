import 'package:betna/core/Local_Storage/local_cart.dart';
import 'package:betna/core/Local_Storage/user_info.dart';
import 'package:betna/core/services/cart_api.dart';
import 'package:betna/models/cart_model.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'cart_list_state.dart';

class CartListCubit extends Cubit<CartListState> {
  CartListCubit(this._api, this.localCart) : super(CartListInitial());
  double totalPrice = 0;
  List<CartModel> cartList = [];
  final LocalCart localCart;
  final CartApi _api;

  Future<void> getCartList(String userID) async {
    emit(CartListLoading());
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
        localCart.updateCart(UserInfo.userId!, cartList);

        if (right.isEmpty) {
          emit(CartListEmpty());
        } else {
          emit(CartSuccess(cartList));
          cartTotalPrice();
        }
      },
    );
  }

  Future<void> removeItemList(String userID, String itemId) async {
    emit(CartListLoading());

    var data = await _api.deleteCartItem(userID, {"cart_id": itemId});
    //print(products);
    data.fold(
      (left) {
        emit(CartError(left.errMessage));
      },
      (right) {
        localCart.removeItemFromCart(UserInfo.userId!, int.parse(itemId));

        cartList.removeWhere((i) => i.id.toString() == itemId);
        if (cartList.isEmpty) {
          emit(CartListEmpty());
        } else {
          cartTotalPrice();
        }
      },
    );
  }

  addItem(Map<String, dynamic> body) async {
    var data = await _api.addToCart(body);
    //print(data);
    data.fold(
      (left) {
        emit(CartError(left.errMessage));
      },
      (right) {
        localCart.addItemToCart(UserInfo.userId!, body["product_id"]);
        getCartList(UserInfo.userId!);
        // cartTotalPrice();
      },
    );
  }

  editItem(int cartId, int quantity) async {
    var data = await _api.editCart(UserInfo.userId!, {
      "cart_id": cartId,
      "quantity": quantity,
    });
    // print(data);
    data.fold(
      (left) {
        emit(CartError(left.errMessage));
      },
      (right) {
        //localCart.addItemToCart(UserInfo.userId!, body["product_id"]);
        getCartList(UserInfo.userId!);
        // cartTotalPrice();
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
      totalPrice += double.parse(item.price);
    }
    emit(CartListItemChanged());
  }
}

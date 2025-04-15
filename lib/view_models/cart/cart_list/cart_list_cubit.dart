import 'package:betna/constants.dart';
import 'package:betna/core/services/cart_api.dart';
import 'package:betna/models/cart_model.dart';
import 'package:betna/models/item_model.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'cart_list_state.dart';

class CartListCubit extends Cubit<CartListState> {
  CartListCubit(this._api) : super(CartListInitial());
  double totalPrice = 0;

  final CartApi _api;
  Future<void> getProducts(String userID) async {
    var cartItems = await _api.getItemCart(userID);
    //print(products);
    cartItems.fold(
      (left) {
        emit(CartError(left.errMessage));
      },
      (right) {
          emit(CartSuccess(right));
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

  addItem(ItemModel item) {
    if (item.count == 0) {
      item.count++;
      cartList.add(item);
    } else {
      cartList.add(item);
    }
    cartTotalPrice();

    emit(CartListItemChanged());
  }

  cartTotalPrice() {
    totalPrice = 0;
    for (var item in cartList) {
      totalPrice += item.totalPrice();
    }
    emit(CartListItemChanged());
  }
}

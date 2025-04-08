
import 'package:betna/constants.dart';
import 'package:betna/models/Item_model.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'cart_list_state.dart';

class CartListCubit extends Cubit<CartListState> {
  CartListCubit() : super(CartListInitial());
  double totalPrice = 0;
  removeItem(String ctg, ItemModel item) {
    for (ItemModel itm in itemList[ctg]!) {
      if (itm.name == item.name) {
        item.count = 0;
        break;
      }
    }
    cartTotalPrice();
    cartList.remove(item);
    emit(CartListItemChanged());
    if (cartList.isEmpty) {
      emit(CartListEmpty());
    }
  }

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
  // incrementPrice(ItemModel item) {
  //   totalPrice += int.parse(item.price);
  // }

  // decrmentPrice(ItemModel item) {
  //   totalPrice -= int.parse(item.price);
  // }
}

import 'package:betna/constants.dart';
import 'package:betna/models/Item_model.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'cart_list_state.dart';

class CartListCubit extends Cubit<CartListState> {
  CartListCubit() : super(CartListInitial());
  removeItem(ItemModel item) {
    cartList.remove(item);
    emit(CartListItemRemoved());
    if (cartList.isEmpty) {
      emit(CartListEmbty());
    }
  }

}

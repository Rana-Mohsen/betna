part of 'cart_list_cubit.dart';

@immutable
abstract class CartListState {}

class CartListInitial extends CartListState {}

class CartListLoading extends CartListState {}

class CartListItemChanged extends CartListState {}

class CartListEmpty extends CartListState {}

class CartSuccess extends CartListState {
  final List<CartModel> cartList;

  CartSuccess(this.cartList);
}

class CartError extends CartListState {
  final String errMessage;

  CartError(this.errMessage);
}

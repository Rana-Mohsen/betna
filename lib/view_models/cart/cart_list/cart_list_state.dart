part of 'cart_list_cubit.dart';

@immutable
abstract class CartListState {}

class CartListInitial extends CartListState {}

class CartListItemChanged extends CartListState {}

class CartListEmpty extends CartListState {}



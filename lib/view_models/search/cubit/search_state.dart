part of 'search_cubit.dart';

@immutable
sealed class SearchState {}

final class SearchInitial extends SearchState {}

final class SearchEmpty extends SearchState {}

final class SearchChanged extends SearchState {
  final List<ItemModel> searchedProducts;

  SearchChanged(this.searchedProducts);

}

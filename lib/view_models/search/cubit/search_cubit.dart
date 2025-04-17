import 'package:betna/models/item_model.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(SearchInitial());
  filterSearch(String searchWord, List<ItemModel> productsList) {
    List<ItemModel> results = [];
    if (searchWord.isEmpty) {
      results = productsList;
    } else {
      results =
          productsList
              .where(
                (product) => product.name.toLowerCase().contains(
                  searchWord.toLowerCase(),
                ),
              )
              .toList();
    }

    emit(SearchChanged(results));
  }
}

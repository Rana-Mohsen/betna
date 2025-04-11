import 'package:betna/constants.dart';
import 'package:betna/models/item_model.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'favorite_state.dart';

class FavoriteCubit extends Cubit<FavoriteState> {
  FavoriteCubit() : super(FavoriteInitial());

  favoritBody() {
    if (favList.isEmpty) {
      emit(FavoriteEmpty());
    } else {
      emit(FavoriteChanged());
    }
  }

  addFavorit(ItemModel fav) {
    favList.add(fav);
    fav.isFav = true;
  }

  removeFavorit(ItemModel fav) {
    favList.remove(fav);
    fav.isFav = false;
  }
  
}

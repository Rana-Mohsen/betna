import 'package:betna/constants.dart';
import 'package:betna/core/Local_Storage/local_cart.dart';
import 'package:betna/core/Local_Storage/user_info.dart';
import 'package:betna/core/services/products_api.dart';
import 'package:betna/models/item_model.dart';
import 'package:betna/models/local_cart_model.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  final ProductsApi _api;
  List<ItemModel> productList = [];
  String selectedCategory = 'All';

  ProductsCubit(this._api) : super(ProductsInitial());
  Future<void> getProducts([String? category]) async {
    selectedCategory = category ?? 'All';
    emit(ProductsLoading());
    var products = await _api.getProducts();
    //print(products);
    List<LocalCartModel> localCartList = await LocalCart().getCartItems(
      UserInfo.userId!,
    );

    products.fold(
      (left) {
        emit(ProductsError(left.errMessage));
      },
      (right) {
        productList = right;
        for (var item in productList) {
          item.isFav = favList.any((fav) => fav.id == item.id);
          // LocalCartModel? localCartItem =
          //     localCartList
          //         .where((local) => local.productId == item.id)
          //         .firstOrNull;

          // if (localCartItem != null) {
          //   item.count = localCartItem.quantity!;
          // }
        }

        _emitFilteredList();
      },
    );
  }

  void toggleFavorite(ItemModel item) {
    item.isFav = !item.isFav;
    if (item.isFav) {
      favList.add(item);
    } else {
      favList.removeWhere((i) => i.id == item.id);
    }
    //emit(ProductsSuccess(List.from(productList)));
    _emitFilteredList();
  }

  void _emitFilteredList() {
    if (selectedCategory != 'All') {
      final filtered =
          productList
              .where((product) => product.categoryName == selectedCategory)
              .toList();
      emit(ProductsSuccess(filtered));
    } else {
      emit(ProductsSuccess(productList));
    }
  }
}

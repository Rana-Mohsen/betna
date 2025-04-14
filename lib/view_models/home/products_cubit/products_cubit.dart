import 'package:betna/core/services/products_api.dart';
import 'package:betna/models/product_model.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  final ProductsApi _api;
  List<ProductModel> productList = [];

  ProductsCubit(this._api) : super(ProductsInitial());
  Future<void> getProducts([String? category]) async {
    var products = await _api.getProducts();
    //print(products);
    products.fold(
      (left) {
        emit(ProductsError(left.errMessage));
      },
      (right) {
        productList = right;
        if (category != null && category != 'All') {
          final filtered = productList.where((product)=>product.categoryName==category).toList();
          emit(ProductsSuccess(filtered));
        } else {
          emit(ProductsSuccess(right));
        }
      },
    );
  }
}

import 'package:betna/core/errors/failures.dart';
import 'package:betna/core/errors/server_failure.dart';
import 'package:betna/core/services/api.dart';
import 'package:betna/models/item_model.dart';
import 'package:betna/models/product_model.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class ProductsApi {
  final Api _api;
  final String baseUrl = "https://zbooma.com/furniture_api/products/";

  ProductsApi(this._api);

  Future<Either<Failures, dynamic>> getProducts() async {
    try {
      var data = await _api.get(url: "${baseUrl}get_products.php");

      List<ItemModel> products = [];
      for (var ctg in data['products']) {
        var product = ProductModel.fromJson(ctg);
        products.add(ItemModel.fromProductModel(product));
      }
      return right(products);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }

      return left(ServerFailure(e.toString()));
    }
  }
}

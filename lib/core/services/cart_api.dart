import 'package:betna/core/errors/failures.dart';
import 'package:betna/core/errors/server_failure.dart';
import 'package:betna/core/services/api.dart';
import 'package:betna/models/cart_model.dart';
import 'package:betna/models/product_model.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class CartApi {
  final Api _api;
  final String baseUrl = "https://zbooma.com/furniture_api/cart/";

  CartApi(this._api);

  Future<Either<Failures, dynamic>> addToCart(Map<String, dynamic> body) async {
    try {
      var data = await _api.post(url: "${baseUrl}cart.php", body: body);

      if (data["status"] == "success") {
        return right(data);
      } else {
        return left(ServerFailure(data["message"]));
      }
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  Future<Either<Failures, dynamic>> getItemCart(String userId) async {
    try {
      var data = await _api.get(url: "${baseUrl}cart.php?user_id=$userId");
      List<CartModel> cartList = [];
      for (var item in data['cart']) {
        cartList.add(CartModel.fromJson(item));
      }
      if (data["status"] == "success") {
      return right(cartList);
      } else {
        return left(ServerFailure(data["message"]));
      }
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}

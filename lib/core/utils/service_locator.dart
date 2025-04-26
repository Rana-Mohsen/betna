import 'package:betna/core/services/api_service/api.dart';
import 'package:betna/core/services/api_service/auth_api.dart';
import 'package:betna/core/services/api_service/cart_api.dart';
import 'package:betna/core/services/api_service/category.api.dart';
import 'package:betna/core/services/api_service/products_api.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;
void setupServiceLocator() {
  getIt.registerSingleton<Api>(Api(Dio()));
  getIt.registerSingleton<AuthApi>(AuthApi(getIt.get<Api>()));
  getIt.registerSingleton<CategoryApi>(CategoryApi(getIt.get<Api>()));
  getIt.registerSingleton<ProductsApi>(ProductsApi(getIt.get<Api>()));
  getIt.registerSingleton<CartApi>(CartApi(getIt.get<Api>()));
}

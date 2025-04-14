
import 'package:betna/core/services/api.dart';
import 'package:betna/core/services/auth_api.dart';
import 'package:betna/core/services/category.api.dart';
import 'package:betna/core/services/products_api.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;
void setupServiceLocator() {
  getIt.registerSingleton<Api>(Api(Dio()));
  getIt.registerSingleton<AuthApi>(AuthApi(getIt.get<Api>()));
    getIt.registerSingleton<CategoryApi>(CategoryApi(getIt.get<Api>()));
    getIt.registerSingleton<ProductsApi>(ProductsApi(getIt.get<Api>()));

}
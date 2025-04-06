
import 'package:betna/core/services/api.dart';
import 'package:betna/core/services/auth_api.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;
void setupServiceLocator() {
  getIt.registerSingleton<Api>(Api(Dio()));
  getIt.registerSingleton<AuthApi>(AuthApi(getIt.get<Api>()));
}
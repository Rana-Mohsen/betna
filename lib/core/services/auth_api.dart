import 'dart:convert';

import 'package:betna/core/errors/failures.dart';
import 'package:betna/core/errors/server_failure.dart';
import 'package:betna/core/services/api.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class AuthApi {
  final String baseUrl = "https://zbooma.com/furniture_api/auth/";
  Future<Either<Failures,dynamic>> loginUser({
    required Map<String, dynamic> body,
  }) async {
    try {
      var data = await Api().post(
        url: "${baseUrl}login.php",
        body: jsonEncode(body),
      );
      return right(data);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  Future<Either<Failures,dynamic>> signupUser({required Map<String, dynamic> body}) async {
    try {
  Map<String, dynamic> data = await Api().post(
    url: "${baseUrl}login.php",
    body: jsonEncode(body),
  );
  return right(data);

} catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}

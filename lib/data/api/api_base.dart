import 'dart:async';

import 'package:apricotspace_task/data/api/api_response.dart';
import 'package:dio/dio.dart';

class BaseApi {
  Future<ApiResponse<T>> fetch<T>({
    required Future<Response<dynamic>> request,
    required T Function(Response res) fallback,
  }) async {
    try {
      final result = await request;
      return ApiResponse<T>(
        response: fallback(result),
      );
    } on DioException catch (e) {
      return ApiResponse(error: e);
    }
  }
}

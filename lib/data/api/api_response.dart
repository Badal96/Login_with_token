import 'package:dio/dio.dart';

class ApiResponse<T> {
  final T? response;
  final DioException? error;

  ApiResponse({
    this.response,
    this.error,
  });
}

import 'package:apricotspace_task/data/api/api_base.dart';
import 'package:dio/dio.dart';

import 'api_response.dart';

class Authentication extends BaseApi {
  final Dio client;
  Authentication({required this.client});

  Future<ApiResponse<Map<String, dynamic>>> login(String email, String password) async {
    return fetch(
      request: client.post(
        '/api/sign-in',
        data: {'email': email, 'password': password},
      ),
      fallback: (res) => res.data,
    );
  }

  Future<ApiResponse<Map<String, dynamic>>> register(
      String username, String email, String password) async {
    return fetch(
      request: client.post(
        '/api/signup',
        data: {'username': username, 'email': email, 'password': password},
      ),
      fallback: (res) => res.data,
    );
  }

  Future<ApiResponse<Map<String, dynamic>>> sendVerificationCode(
    String email,
  ) async {
    return fetch(
      request: client.post(
        '/api/verify/send-code',
        data: {
          'email': email,
        },
      ),
      fallback: (res) => res.data,
    );
  }

  Future<ApiResponse<dynamic>> verifyCode(String email, String code) async {
    return fetch(
      request: client.post(
        '/api/verify/verify-code',
        data: {'email': email, 'code': code},
      ),
      fallback: (res) => res.data,
    );
  }
}

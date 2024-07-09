import 'package:apricotspace_task/data/api/authentication.dart';
import 'package:apricotspace_task/data/services/guard.dart';
import 'package:apricotspace_task/data/services/storage.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_cubit.freezed.dart';
part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final Authentication client;
  final LocalData local;
  final AuthProvider authProvider;

  LoginCubit({required this.authProvider, required this.client, required this.local})
      : super(const LoginState());

  void toggleObscure() async {
    emit(state.copyWith(obscure: !state.obscure));
  }

  Future<bool> login({
    required String email,
    required String password,
    required void Function(DioException err) onError,
  }) async {
    emit(state.copyWith(isLoading: true));
    var response = await client.login(email, password);
    if (response.response != null) {
      if (response.response?['success'] == true) {
        final token = response.response?['data']['token'];
        local.storeToken(token);
        authProvider.setToken(token);
      }
    }
    if (response.error != null) {
      emit(state.copyWith(isLoading: false));

      onError(response.error!);
    } else {
      emit(state.copyWith(isLoading: false));
      return true;
    }
    emit(state.copyWith(isLoading: false));
    return false;
  }
}

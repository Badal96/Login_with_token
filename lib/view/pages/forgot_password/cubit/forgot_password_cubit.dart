import 'package:apricotspace_task/data/api/authentication.dart';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'forgot_password_cubit.freezed.dart';
part 'forgot_password_state.dart';

class ForgotPasswordCubit extends Cubit<ForgotPasswordState> {
  final Authentication client;
  ForgotPasswordCubit({required this.client}) : super(const ForgotPasswordState());

  Future<void> sendForgotPassword({
    required String email,
    required void Function() onSuccess,
    required void Function(DioException err) onError,
  }) async {
    emit(state.copyWith(isLoading: true));
    var response = await client.sendVerificationCode(email);
    if (response.response != null) {
      if (response.response?['success'] == true) {
        emit(state.copyWith(isLoading: false));
        onSuccess();
        return;
      }
    }
    if (response.error != null) {
      emit(state.copyWith(isLoading: false));
      onError(response.error!);
    }
    emit(state.copyWith(isLoading: false));
  }
}

import 'package:apricotspace_task/data/api/authentication.dart';
import 'package:apricotspace_task/data/services/storage.dart';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'sign_up_cubit.freezed.dart';
part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  final Authentication client;
  final LocalData localData;
  SignUpCubit({required this.localData, required this.client}) : super(const SignUpState());

  Future<void> register({
    required String email,
    required String password,
    required String username,
    required void Function() onSuccess,
    required void Function(DioException err) onError,
  }) async {
    emit(state.copyWith(isLoading: true));
    var response = await client.register(username, email, password);

    if (response.error != null) {
      // Status code is 422 as other field validations, not clear when to push to verify screen
      if (response.error?.response?.data['message'] == 'User not verification.') {
        final sendCodeResponse = await client.sendVerificationCode(email);
        if (sendCodeResponse.response != null) {
          onSuccess();
        } else {
          onError(sendCodeResponse.error!);
        }
      } else {
        onError(response.error!);
      }
    }
    if (response.response != null) {
      final sendCodeResponse = await client.sendVerificationCode(email);
      if (sendCodeResponse.response != null) {
        onSuccess();
        localData.storeToken(response.response?['data']['token']);
      } else {
        onError(sendCodeResponse.error!);
      }
    }
    emit(state.copyWith(isLoading: false));
  }

  void toggleObscure() async {
    emit(state.copyWith(obscure: !state.obscure));
  }
}

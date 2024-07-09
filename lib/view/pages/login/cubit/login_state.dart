part of 'login_cubit.dart';

@freezed
class LoginState with _$LoginState {
  const factory LoginState({
    @Default(true) bool obscure,
    @Default(false) bool isLoading,
  }) = _LoginState;
}

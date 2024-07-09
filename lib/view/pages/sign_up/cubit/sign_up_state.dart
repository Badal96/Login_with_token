part of 'sign_up_cubit.dart';

@freezed
class SignUpState with _$SignUpState {
  const factory SignUpState({
    @Default(true) bool obscure,
    @Default(false) bool isLoading,
  }) = _SignUpState;
}

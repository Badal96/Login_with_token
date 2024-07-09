part of 'verify_code_cubit.dart';

@freezed
class VerifyCodeState with _$VerifyCodeState {
  const factory VerifyCodeState({
    @Default(0) int currentIndex,
  }) = _VerifyCodeState;

  factory VerifyCodeState.initial() => const VerifyCodeState();
  factory VerifyCodeState.error() => const VerifyCodeState();
  factory VerifyCodeState.success() => const VerifyCodeState();
}

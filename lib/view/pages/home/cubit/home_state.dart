part of 'home_cubit.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState({
    @Default(true) bool obscure,
    @Default(false) bool isLoading,
  }) = _HomeState;
}

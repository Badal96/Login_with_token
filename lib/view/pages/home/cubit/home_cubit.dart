import 'package:apricotspace_task/data/services/guard.dart';
import 'package:apricotspace_task/data/services/storage.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_cubit.freezed.dart';
part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final AuthProvider auth;
  final LocalData local;
  HomeCubit({required this.local, required this.auth}) : super(const HomeState());

  void logout() {
    local.deleteToken();
    auth.logOut();
  }
}

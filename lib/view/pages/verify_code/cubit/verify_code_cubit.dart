import 'dart:async';

import 'package:apricotspace_task/data/api/authentication.dart';
import 'package:apricotspace_task/data/services/guard.dart';
import 'package:apricotspace_task/data/services/storage.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'verify_code_cubit.freezed.dart';
part 'verify_code_state.dart';

class VerifyCodeCubit extends Cubit<VerifyCodeState> {
  final Authentication client;
  final LocalData localData;
  final AuthProvider authProvider;
  VerifyCodeCubit({required this.authProvider, required this.localData, required this.client})
      : super(VerifyCodeState.initial());

  Future<void> verify({
    required String email,
    required String code,
    required VoidCallback onSuccess,
  }) async {
    var response = await client.verifyCode(email, code);
    print(response);
    if (response.error != null) {
      emit(VerifyCodeState.error());
    } else {
      emit(VerifyCodeState.success());
      Future.delayed(const Duration(seconds: 1), onSuccess);
    }
  }

  void changeIndex(int index) {
    emit(state.copyWith(currentIndex: index));
  }

  Future<void> sendCod(String email) async {
    emit(VerifyCodeState.initial());
    final result = await client.sendVerificationCode(email);
    print(result);
  }
}

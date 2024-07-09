import 'package:apricotspace_task/data/services/storage.dart';
import 'package:flutter/material.dart';

class AuthProvider extends ChangeNotifier {
  final LocalData local;
  String? _token;
  AuthProvider({required this.local});

  String? get getToken => _token;
  Future<void> checkUserLocalData() async {
    String? localToken = await local.getToken();

    if (localToken != null) {
      setToken(localToken);
    }
  }

  void logOut() {
    _token = null;
    notifyListeners();
  }

  void setToken(String localToken) {
    _token = localToken;
    notifyListeners();
  }
}

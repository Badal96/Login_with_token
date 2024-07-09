import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class LocalData {
  final storage = const FlutterSecureStorage();

  Future<void> storeToken(String token) async {
    await storage.write(key: 'token', value: token);
  }

  Future<String?> getToken() async {
    final token = await storage.read(key: 'token');
    return token;
  }

  Future<void> deleteToken() async {
    await storage.delete(key: 'token');
  }
}

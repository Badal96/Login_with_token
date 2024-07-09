import 'package:apricotspace_task/data/api/authentication.dart';
import 'package:apricotspace_task/data/services/guard.dart';
import 'package:apricotspace_task/data/services/storage.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

void call() {
  sl.registerLazySingleton<AuthProvider>(() => AuthProvider(local: sl()));
  sl.registerLazySingleton<LocalData>(() => LocalData());
  sl.registerLazySingleton<Dio>(() => Dio(BaseOptions(baseUrl: 'https://stylrapi.production.am')));

  sl.registerLazySingleton<Authentication>(() => Authentication(client: sl()));
}

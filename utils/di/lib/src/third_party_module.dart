import 'package:di/config/config.dart';
import 'package:di/di.dart';
import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

class ThirdPartyModule {
  Future<void> call() async {
    di.registerLazySingleton(() => InternetConnectionChecker());
    di.registerLazySingleton(() => Dio(BaseOptions(baseUrl: Config.baseUrl)));
    di.registerLazySingleton(() => const FlutterSecureStorage());
  }
}

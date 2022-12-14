import 'package:api/src/data/api_interceptor.dart';
import 'package:api/src/repository/api_repository.dart';
import 'package:api/src/repository/api_repository_impl.dart';
import 'package:api/src/data/dio_service.dart';
import 'package:api/src/data/logging_interceptor.dart';
import 'package:api/src/data/network_info.dart';
import 'package:design_system/design_system.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

final sl = GetIt.instance;

class ApiModule {
  static Future<void> init() async {
    sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));
    sl.registerLazySingleton<ApiRepository>(() => ApiRepositoryImpl(sl()));
    sl.registerLazySingleton(
      () => DioService(
        dioClient: sl(),
        interceptors: [ApiInterceptor(sl(), sl()), LoggingInterceptor()],
      ),
    );

    //third party dependency
    sl.registerLazySingleton(() => InternetConnectionChecker());
    sl.registerLazySingleton(() => Dio(BaseOptions(baseUrl: Config.baseUrl)));
  }
}

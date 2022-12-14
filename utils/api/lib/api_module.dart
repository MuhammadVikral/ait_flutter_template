import 'package:api/src/data/api_interceptor.dart';
import 'package:api/src/data/dio_service.dart';
import 'package:api/src/data/logging_interceptor.dart';
import 'package:api/src/data/network_info.dart';
import 'package:api/src/repository/api_repository.dart';
import 'package:api/src/repository/api_repository_impl.dart';
import 'package:design_system/design_system.dart';
import 'package:dio/dio.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

class ApiModule {
  Future<void> call() async {
    di.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(di()));
    di.registerLazySingleton<ApiRepository>(() => ApiRepositoryImpl(di()));
    di.registerLazySingleton(
      () => DioService(
        dioClient: di(),
        interceptors: [ApiInterceptor(di(), di()), LoggingInterceptor()],
      ),
    );

    //third party dependency
    di.registerLazySingleton(() => InternetConnectionChecker());
    di.registerLazySingleton(() => Dio(BaseOptions(baseUrl: Config.baseUrl)));
  }
}

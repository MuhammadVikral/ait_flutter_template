import 'package:api/src/data/api_interceptor.dart';
import 'package:api/src/data/logging_interceptor.dart';
import 'package:common_dependency/common_dependency.dart';

final sl = GetIt.instance;

class ApiModule {
  static Future<void> init() async {
    sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));
    sl.registerLazySingleton(() => ApiService(sl()));
    sl.registerLazySingleton(
      () => DioService(
        dioClient: sl(),
        interceptors: [ApiInterceptor(sl(), sl()), LoggingInterceptor()],
      ),
    );
    sl.registerLazySingleton<TokenKeyValue>(() => TokenkeyValueImpl(sl()));

    //third party dependency
    sl.registerLazySingleton(() => InternetConnectionChecker());
    sl.registerLazySingleton(() => Dio(BaseOptions(baseUrl: Config.baseUrl)));
    sl.registerLazySingleton(() => const FlutterSecureStorage());
  }
}

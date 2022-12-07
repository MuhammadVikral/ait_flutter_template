import 'package:common_dependency/common_dependency.dart';
import 'package:design_system/src/api/api_interceptor.dart';
import 'package:design_system/src/api/logging_interceptor.dart';
import 'package:design_system/src/config/config.dart';

final sl = GetIt.instance;

class DesignSystemModule {
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

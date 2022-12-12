import 'package:api/api.dart';
import 'package:di/di.dart';

class ApiModule {
  Future<void> call() async {
    di.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(di()));
    di.registerLazySingleton(() => ApiService(di()));
    di.registerLazySingleton(
      () => DioService(
        dioClient: di(),
        interceptors: [ApiInterceptor(di(), di()), LoggingInterceptor()],
      ),
    );
    di.registerLazySingleton<TokenKeyValue>(() => TokenkeyValueImpl(di()));
    //third party dependency
  }
}

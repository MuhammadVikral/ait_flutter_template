import 'package:common_dependency/common_dependency.dart';

final sl = GetIt.instance;

class DesignSystemModule {
  Future<void> init() async {
    sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));
    sl.registerLazySingleton(() => InternetConnectionChecker());
  }
}

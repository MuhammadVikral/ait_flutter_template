import 'package:common_dependency/common_dependency.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

final sl = GetIt.instance;

class DesignSystemModule {
  Future<void> init() async {
    sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));
    sl.registerLazySingleton(() => InternetConnectionChecker());
  }
}

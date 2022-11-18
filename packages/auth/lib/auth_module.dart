import 'package:auth/src/data/datasources/auth_local_ds.dart';
import 'package:auth/src/data/datasources/auth_remote_ds.dart';
import 'package:auth/src/data/repositories/auth_repository_impl.dart';
import 'package:auth/src/domain/repositories/auth_repositories.dart';
import 'package:auth/src/domain/use_case/login_use_case.dart';
import 'package:common_dependency/common_dependency.dart';
import 'package:mocktail/mocktail.dart';

final sl = GetIt.instance;

class AuthModule {
  static Future<void> init() async {
    sl.registerFactory(() => LoginCubit(loginClient: sl()));
    sl.registerLazySingleton(() => LoginUseCase(sl()));
    sl.registerLazySingleton<AuthRepositories>(
      () => AuthRepositoriesImpl(
        networkInfo: sl(),
        memory: sl(),
        service: sl(),
      ),
    );

    sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));
    sl.registerLazySingleton<AuthRemoteDataSource>(
      () => AuthRemoteDataSourceImpl(),
    );
    sl.registerLazySingleton<AuthLocalDataSource>(
      () => AuthLocalDataSourceImpl(),
    );
    sl.registerLazySingleton(() => InternetConnectionChecker());
  }

  static Future<void> initTest() async {
    sl.registerFactory(() => LoginCubit(loginClient: sl()));
    sl.registerLazySingleton(() => LoginUseCase(sl()));
    sl.registerLazySingleton<AuthRepositories>(
      () => AuthRepositoriesImpl(
        networkInfo: sl(),
        memory: sl(),
        service: sl(),
      ),
    );

    sl.registerLazySingleton<NetworkInfo>(() => MockNetworkInfo());
    sl.registerLazySingleton<AuthRemoteDataSource>(
      () => AuthRemoteDataSourceImpl(),
    );
    sl.registerLazySingleton<AuthLocalDataSource>(
      () => AuthLocalDataSourceImpl(),
    );
    sl.registerLazySingleton(() => InternetConnectionChecker());
  }
}

class MockNetworkInfo extends Mock implements NetworkInfo {}

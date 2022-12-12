// ignore_for_file: depend_on_referenced_packages

import 'package:auth/auth.dart';
import 'package:di/di.dart';

// final sl = GetIt.instance;

class AuthModule {
  Future<void> call() async {
    //Cubit
    di.registerFactory(() => LoginCubit(loginClient: di()));
    di.registerFactory(() => AuthCubit(di()));
    //UseCase
    di.registerLazySingleton(() => LoginUseCase(di()));
    di.registerLazySingleton(() => CheckLoggedInUseCase(di()));
    //Repository
    di.registerLazySingleton<AuthRepositories>(
      () => AuthRepositoriesImpl(
        networkInfo: di(),
        memory: di(),
        service: di(),
      ),
    );
    //DataSource
    di.registerLazySingleton<AuthRemoteDataSource>(
      () => AuthRemoteDataSourceImpl(di()),
    );
    di.registerLazySingleton<AuthLocalDataSource>(
      () => AuthLocalDataSourceImpl(di()),
    );
  }
}

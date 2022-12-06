// ignore_for_file: depend_on_referenced_packages

import 'package:auth/src/data/datasources/auth_local_ds.dart';
import 'package:auth/src/data/datasources/auth_remote_ds.dart';
import 'package:auth/src/data/repositories/auth_repository_impl.dart';
import 'package:auth/src/domain/repositories/auth_repositories.dart';
import 'package:auth/src/domain/use_case/check_loggedin_usecase.dart';
import 'package:auth/src/domain/use_case/login_use_case.dart';
import 'package:common_dependency/common_dependency.dart';

// final sl = GetIt.instance;

class AuthModule {
  static Future<void> init() async {
    //Cubit
    sl.registerFactory(() => LoginCubit(loginClient: sl()));
    sl.registerFactory(() => AuthCubit(sl()));
    //UseCase
    sl.registerLazySingleton(() => LoginUseCase(sl()));
    sl.registerLazySingleton(() => CheckLoggedInUseCase(sl()));
    sl.registerLazySingleton(() => GetTokenUseCase(sl()));
    //Repository
    sl.registerLazySingleton<AuthRepositories>(
      () => AuthRepositoriesImpl(
        networkInfo: sl(),
        memory: sl(),
        service: sl(),
      ),
    );
    //DataSource
    sl.registerLazySingleton<AuthRemoteDataSource>(
      () => AuthRemoteDataSourceImpl(sl()),
    );
    sl.registerLazySingleton<AuthLocalDataSource>(
      () => AuthLocalDataSourceImpl(sl()),
    );
  }
}

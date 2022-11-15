import 'package:auth/src/data/repositories/auth_repository_impl.dart';
import 'package:auth/src/domain/repositories/auth_repositories.dart';
import 'package:auth/src/domain/use_case/login_use_case.dart';
import 'package:common_dependency/common_dependency.dart';

final sl = GetIt.instance;

class AuthModule {
  static Future<void> init() async {
    sl.registerFactory(() => LoginCubit(loginClient: sl()));
    sl.registerLazySingleton(() => LoginUseCase(sl()));
    sl.registerLazySingleton<AuthRepositories>(() => AuthRepositoriesImpl());
  }
}

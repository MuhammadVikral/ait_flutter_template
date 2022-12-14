import 'package:caching/caching.dart';
import 'package:caching/src/repository/caching_token_repository_impl_caching_token_repository.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';

class CachingModule {
  final di = GetIt.I;
  Future<void> call() async {
    di.registerLazySingleton<CachingTokenRepository>(
        () => CachingTokenRepositoryImpl(di()));
    //3rd party Package
    di.registerLazySingleton(() => const FlutterSecureStorage());
  }
}

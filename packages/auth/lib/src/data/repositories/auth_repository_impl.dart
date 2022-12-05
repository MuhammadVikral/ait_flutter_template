import 'package:auth/src/data/datasources/auth_local_ds.dart';
import 'package:auth/src/data/datasources/auth_remote_ds.dart';
import 'package:auth/src/domain/repositories/auth_repositories.dart';
import 'package:common_dependency/common_dependency.dart';

class AuthRepositoriesImpl implements AuthRepositories {
  final NetworkInfo networkInfo;
  final AuthLocalDataSource memory;
  final AuthRemoteDataSource service;

  AuthRepositoriesImpl({
    required this.networkInfo,
    required this.memory,
    required this.service,
  });
  @override
  Future<Either<Failure, Unit>> getInitialToken() async {
    if (await networkInfo.isConnected) {
      try {
        final token = await service.getInitialToken();
        try {
          await memory.setTokens(token);
        } catch (e) {
          return Left(CacheFailure());
        }
        return const Right(unit);
      } catch (e) {
        return Left(NetworkFailure());
      }
    } else {
      return Left(NetworkFailure());
    }
  }

  @override
  Future<Either<Failure, Unit>> login(LoginEntity body) async {
    return Left(NetworkFailure());
  }

  @override
  Future<Either<Failure, bool>> hasToken() {
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Unit>> refreshToken() {
    throw UnimplementedError();
  }
}

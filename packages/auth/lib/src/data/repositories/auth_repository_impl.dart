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
  Future<Either<Failure, bool>> hasToken() async {
    try {
      final token = await memory.getTokens();
      bool hasToken = token != null;
      return Right(hasToken);
    } catch (e) {
      return Left(CacheFailure());
    }
  }

  @override
  Future<Either<Failure, Unit>> refreshToken() async {
    if (await networkInfo.isConnected == false) {
      return Left(NetworkFailure());
    } else {
      try {
        final res = await service.refreshToken();
        if (res != null) {
          await memory.setTokens(res);
        }
        return const Right(unit);
      } catch (e) {
        if (e is CustomException) {
          if (e.failure == UnAuthorizedFailure()) {}
          return Left(e.failure);
        } else {
          return Left(ServerFailure());
        }
      }
    }
  }

  @override
  Future<Either<Failure, Unit>> login(LoginEntity body) async {
    return Left(NetworkFailure());
  }

  @override
  Future<Either<Failure, TokenModel?>> getToken() async {
    try {
      TokenModel? token = await memory.getTokens();
      return Right(token);
    } catch (e) {
      return Left(CacheFailure());
    }
  }
}

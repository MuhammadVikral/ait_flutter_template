import 'package:auth/src/data/datasources/auth_local_ds.dart';
import 'package:auth/src/data/datasources/auth_remote_ds.dart';
import 'package:auth/src/data/model/login_model.dart';
import 'package:auth/src/domain/entities/login_entity.dart';
import 'package:auth/src/domain/repositories/auth_repository.dart';
import 'package:common_dependency/common_dependency.dart';

class AuthRepositoriesImpl implements AuthRepository {
  final NetworkInfo networkInfo;
  final AuthLocalDataSource memory;
  final AuthRemoteDataSource service;

  AuthRepositoriesImpl({
    required this.networkInfo,
    required this.memory,
    required this.service,
  });

  @override
  Future<Either<Failure, bool>> checkLoggedIn() async {
    final hasToken = await memory.getTokens();
    if (hasToken != null) {
      if (hasToken.whichToken == WhichToken.guess) {
        return const Right(false);
      } else {
        try {
          await service.getProfile();
          return const Right(true);
        } catch (e) {
          if (e is CustomException) {
            if (e.failure == UnAuthorizedFailure()) {
              return const Right(false);
            } else {}
            return Left(e.failure);
          } else {
            return Left(UnRecognizedFailure());
          }
        }
      }
    } else {
      final callGetInitialToken = await getInitialToken();
      return callGetInitialToken.fold(
        (l) => Left(l),
        (r) => const Right(false),
      );
    }
  }

  @override
  Future<Either<Failure, Unit>> login(LoginEntity body) async {
    if (await networkInfo.isConnected == false) {
      return Left(NetworkFailure());
    } else {
      try {
        final res = await service.login(LoginModel.fromEntity(body));
        try {
          await memory.setTokens(whichToken: WhichToken.user, token: res);
        } catch (e) {
          return Left(CacheFailure());
        }
        return const Right(unit);
      } catch (e) {
        if (e is CustomException) {
          return Left(e.failure);
        } else {
          return Left(UnRecognizedFailure());
        }
      }
    }
  }

  Future<Either<Failure, Unit>> getInitialToken() async {
    if (await networkInfo.isConnected) {
      try {
        final token = await service.getInitialToken();
        try {
          await memory.setTokens(whichToken: WhichToken.guess, token: token);
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
}

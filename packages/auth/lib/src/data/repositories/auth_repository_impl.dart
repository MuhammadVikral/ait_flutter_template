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
  Future<Either<Failure, bool>> checkLoggedIn() async {
    final hasToken = await memory.getTokens();
    if (hasToken != null) {
      final callRefreshToken = await refreshToken(hasToken.whichToken);
      return callRefreshToken.fold(
        (l) => Left(l),
        (r) async {
          if (r) {
            if (hasToken.whichToken == WhichToken.user) {
              return const Right(true);
            }
            return const Right(false);
          } else {
            final callGetInitialToken = await getInitialToken();
            return callGetInitialToken.fold(
              (l) => Left(l),
              (r) => const Right(false),
            );
          }
        },
      );
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

  Future<Either<Failure, bool>> refreshToken(WhichToken whichToken) async {
    if (await networkInfo.isConnected == false) {
      return Left(NetworkFailure());
    } else {
      try {
        final res = await service.refreshUserToken(whichToken);
        if (res != null) {
          await memory.setTokens(whichToken: whichToken, token: res);
        }
        return const Right(true);
      } catch (e) {
        if (e is CustomException) {
          if (e.failure == UnAuthorizedFailure()) {
            return const Right(false);
          }
          return Left(e.failure);
        } else {
          return Left(ServerFailure());
        }
      }
    }
  }
}

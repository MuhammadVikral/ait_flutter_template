import 'package:auth/src/domain/repositories/auth_repositories.dart';
import 'package:common_dependency/common_dependency.dart';

class CheckLoggedInUseCase {
  final AuthRepositories repositories;

  CheckLoggedInUseCase(this.repositories);
  Future<Either<Failure, bool>> call() async {
    final hasToken = await repositories.hasToken();
    return hasToken.fold(
      (l) => Left(CacheFailure()),
      (r) async {
        if (r) {
          final refreshToken = await repositories.refreshToken();
          return refreshToken.fold(
            (l) {
              print(l);
              return l == UnAuthorizedFailure() ? const Right(false) : Left(l);
            },
            (r) => const Right(true),
          );
        } else {
          final getInitialToken = await repositories.getInitialToken();
          return getInitialToken.fold(
            (l) => Left(l),
            (r) => const Right(false),
          );
        }
      },
    );
  }
}

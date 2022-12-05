import 'package:auth/src/domain/repositories/auth_repositories.dart';
import 'package:common_dependency/common_dependency.dart';

class CheckLoggedInUseCase {
  final AuthRepositories repositories;

  CheckLoggedInUseCase(this.repositories);
  Future<Either<Failure, bool>> call() async {
    final isLoggedIn = await repositories.checkLoggedIn();
    return isLoggedIn.fold(
      (l) => Left(CacheFailure()),
      (r) async {
        if (r) {
          return const Right(true);
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

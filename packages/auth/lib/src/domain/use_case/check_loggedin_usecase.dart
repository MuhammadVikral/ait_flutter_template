import 'package:auth/src/domain/repositories/auth_repository.dart';
import 'package:common_dependency/common_dependency.dart';

class CheckLoggedInUseCase {
  final AuthRepository repositories;

  CheckLoggedInUseCase(this.repositories);
  Future<Either<Failure, bool>> call() async {
    return repositories.checkLoggedIn();
  }
}

import 'package:auth/src/domain/repositories/auth_repositories.dart';
import 'package:common_dependency/common_dependency.dart';

class LoginUseCase {
  final AuthRepositories repository;

  LoginUseCase(this.repository);
  Future<Either<Failure, Unit>> call({
    required LoginInput username,
    required PasswordInput password,
  }) async {
    bool isValid = Formz.validate([username, password]).isValid;
    if (!isValid) {
      return Left(UseCaseFailure());
    } else {
      final _service = await repository.login(LoginEntity(
        email: username.value,
        password: password.value,
      ));
      return _service.fold(
        (l) => Left(l),
        (r) => const Right(unit),
      );
    }
  }
}

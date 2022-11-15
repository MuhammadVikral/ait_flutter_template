import 'package:auth/src/domain/entities/login_entity.dart';
import 'package:auth/src/domain/repositories/auth_repositories.dart';
import 'package:common_dependency/common_dependency.dart';

class AuthRepositoriesImpl extends AuthRepositories {
  @override
  Future<Either<Failure, Unit>> login(LoginEntity body) async {
    return Left(NetworkFailure());
  }
}

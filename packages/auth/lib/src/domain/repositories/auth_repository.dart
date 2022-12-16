import 'package:auth/src/domain/entities/login_entity.dart';
import 'package:common_dependency/common_dependency.dart';

abstract class AuthRepository {
  Future<Either<Failure, bool>> checkLoggedIn();
  Future<Either<Failure, Unit>> login(LoginEntity body);
}

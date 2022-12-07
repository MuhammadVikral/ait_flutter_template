import 'package:common_dependency/common_dependency.dart';

abstract class AuthRepositories {
  Future<Either<Failure, bool>> checkLoggedIn();
  Future<Either<Failure, Unit>> login(LoginEntity body);
}

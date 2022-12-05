import 'package:common_dependency/common_dependency.dart';

abstract class AuthRepositories {
  Future<Either<Failure, Unit>> getInitialToken();
  Future<Either<Failure, bool>> hasToken();
  Future<Either<Failure, Unit>> refreshToken();
  Future<Either<Failure, Unit>> login(LoginEntity body);
}

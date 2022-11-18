import 'package:common_dependency/common_dependency.dart';

abstract class AuthRemoteDataSource {
  Future<Either<Failure, Unit>> getInitialToken();
  Future<Either<Failure, Unit>> refreshToken();
  Future<Either<Failure, Unit>> login();
  Future<Either<Failure, Unit>> logout();
}

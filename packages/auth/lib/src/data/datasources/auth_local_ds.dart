import 'package:common_dependency/common_dependency.dart';

abstract class AuthLocalDataSource {
  Future<Either<Failure, Unit>> setTokens();
  Future<Either<Failure, Unit>> getTokens();
}

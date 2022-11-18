import 'package:common_dependency/common_dependency.dart';

abstract class AuthRemoteDataSource {
  Future<Either<Failure, Unit>> getInitialToken();
  Future<Either<Failure, Unit>> refreshToken();
  Future<Either<Failure, Unit>> login();
  Future<Either<Failure, Unit>> logout();
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  @override
  Future<Either<Failure, Unit>> getInitialToken() {
    // TODO: implement getInitialToken
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Unit>> login() {
    // TODO: implement login
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Unit>> logout() {
    // TODO: implement logout
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Unit>> refreshToken() {
    // TODO: implement refreshToken
    throw UnimplementedError();
  }
}

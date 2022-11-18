import 'package:common_dependency/common_dependency.dart';

abstract class AuthLocalDataSource {
  Future<Either<Failure, Unit>> setTokens();
  Future<Either<Failure, Unit>> getTokens();
}

class AuthLocalDataSourceImpl implements AuthLocalDataSource {
  @override
  Future<Either<Failure, Unit>> getTokens() {
    // TODO: implement getTokens
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Unit>> setTokens() {
    // TODO: implement setTokens
    throw UnimplementedError();
  }
}

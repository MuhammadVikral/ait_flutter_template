import 'package:ait_flutter_template/features/auth/domain/entities/userentity.dart';
import 'package:ait_flutter_template/core/exception/failure.dart';
import 'package:ait_flutter_template/features/auth/domain/repositories/auth_repository.dart';
import 'package:dartz/dartz.dart';

class AuthRepositoryImpl implements AuthRepository {
  @override
  Future<Either<Failure, UserEntity>> autoLogin() {
    // TODO: implement autoLogin
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, UserEntity>> login() {
    // TODO: implement login
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Unit>> logout() {    // TODO: implement logout
    throw UnimplementedError();
  }
}

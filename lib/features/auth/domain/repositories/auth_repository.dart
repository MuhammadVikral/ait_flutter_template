import 'package:ait_flutter_template/core/exception/failure.dart';
import 'package:ait_flutter_template/features/auth/domain/entities/userentity.dart';
import 'package:dartz/dartz.dart';

abstract class IAuthRepository {
  Future<Either<Failure, UserEntity>> login();
  Future<Either<Failure, Unit>> logout();
  Future<Either<Failure, UserEntity>> autoLogin();
}

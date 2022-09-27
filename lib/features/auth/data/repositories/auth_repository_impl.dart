import 'package:ait_flutter_template/features/auth/data/datasources/auth_data_source.dart';
import 'package:ait_flutter_template/features/auth/domain/entities/userentity.dart';
import 'package:ait_flutter_template/core/exception/failure.dart';
import 'package:ait_flutter_template/features/auth/domain/repositories/auth_repository.dart';
import 'package:dartz/dartz.dart';

class AuthRepository implements IAuthRepository {
  final IAuthDataSource service;

  AuthRepository(this.service);
  @override
  Future<Either<Failure, UserEntity>> autoLogin() {
    // TODO: implement autoLogin
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, UserEntity>> login() async {
    try {
      final result = await service.login();
      return Right(result);
    } on NetworkFailure {
      return Left(
        NetworkFailure(),
      );
    } catch (e) {
      return Left(
        DomainFailure(),
      );
    }
  }

  @override
  Future<Either<Failure, Unit>> logout() {
    // TODO: implement logout
    throw UnimplementedError();
  }
}

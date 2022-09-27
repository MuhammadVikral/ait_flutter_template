import 'package:ait_flutter_template/core/exception/failure.dart';
import 'package:ait_flutter_template/features/auth/domain/entities/userentity.dart';
import 'package:dartz/dartz.dart';

abstract class IAuthDataSource {
  Future<UserEntity> login();
}

class AuthDataSource implements IAuthDataSource {
  @override
  Future<UserEntity> login() {
    // TODO: implement login
    throw UnimplementedError();
  }
}

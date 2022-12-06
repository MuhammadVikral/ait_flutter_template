import 'package:common_dependency/common_dependency.dart';

abstract class AuthRemoteDataSource {
  Future<TokenModel> getInitialToken();
  Future<TokenModel?> refreshToken();
  Future<Either<Failure, Unit>> login();
  Future<Either<Failure, Unit>> logout();
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final ApiService service;

  AuthRemoteDataSourceImpl(this.service);
  @override
  Future<TokenModel> getInitialToken() async {
    return await service.setData<TokenModel>(
      endpoint: '/oauth/auth',
      data: {"app": "test", "key": "oJi1WeLsmh7nVily0MrB"},
      converter: (response) {
        return TokenModel.fromJson(response.data ?? {});
      },
    );
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
  Future<TokenModel?> refreshToken() async {
    return await service.setData<TokenModel>(
      endpoint: '/user/auth/refresh',
      data: {},
      requiresAuthToken: true,
      converter: (response) {
        return TokenModel.fromJson(response.data ?? {});
      },
    );
  }
}

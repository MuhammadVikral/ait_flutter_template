import 'package:auth/src/data/model/login_model.dart';
import 'package:common_dependency/common_dependency.dart';

abstract class AuthRemoteDataSource {
  Future<TokenModel> getInitialToken();
  Future<TokenModel?> refreshUserToken(WhichToken whichToken);
  Future<TokenModel> login(LoginModel body);
  Future<void> getProfile();
  Future<Either<Failure, Unit>> logout();
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final ApiRepository service;

  AuthRemoteDataSourceImpl(this.service);
  @override
  Future<TokenModel> getInitialToken() async {
    return await service.setData<TokenModel>(
      endpoint: AuthEndpoint.getInitialToken,
      data: {"app": "test", "key": "oJi1WeLsmh7nVily0MrB"},
      converter: (response) {
        return TokenModel.fromJson(response.data ?? {});
      },
    );
  }

  @override
  Future<TokenModel> login(LoginModel body) async {
    return await service.setData<TokenModel>(
      endpoint: AuthEndpoint.login,
      requiresAuthToken: true,
      data: body.toJson(),
      converter: (response) {
        return TokenModel.fromJson(response.data ?? {});
      },
    );
  }

  @override
  Future<Either<Failure, Unit>> logout() {
    throw UnimplementedError();
  }

  @override
  Future<TokenModel?> refreshUserToken(WhichToken whichToken) async {
    final uri = whichToken == WhichToken.guess
        ? AuthEndpoint.refreshGuessToken
        : AuthEndpoint.refreshUserToken;
    return await service.setData<TokenModel>(
      endpoint: uri,
      requiresRefreshToken: true,
      converter: (response) {
        return TokenModel.fromJson(response.data ?? {});
      },
    );
  }

  @override
  Future<void> getProfile() async {
    return await service.getData(
      endpoint: AuthEndpoint.getProfile,
      requiresAuthToken: true,
      converter: (response) {},
    );
  }
}

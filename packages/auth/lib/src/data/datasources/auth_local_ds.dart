import 'package:common_dependency/common_dependency.dart';

abstract class AuthLocalDataSource {
  Future<void> setTokens(
      {required WhichToken whichToken, required TokenModel token});
  Future<void> deleteTokens();
  Future<TokenKeyModel?> getTokens();
}

class AuthLocalDataSourceImpl implements AuthLocalDataSource {
  final TokenKeyValue storage;

  AuthLocalDataSourceImpl(this.storage);
  @override
  Future<TokenKeyModel?> getTokens() async {
    final token = await storage.getToken();
    return token;
  }

  @override
  Future<void> setTokens(
      {required WhichToken whichToken, required TokenModel token}) async {
    await storage.setToken(whichToken: whichToken, token: token);
  }

  @override
  Future<void> deleteTokens() async {
    await storage.deleteToken();
  }
}

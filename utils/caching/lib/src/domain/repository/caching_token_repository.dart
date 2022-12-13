import 'package:caching/src/data/models/token_key_model.dart';

abstract class CachingTokenRepository {
  Future<TokenKeyModel?> getToken();
  Future<void> setToken({
    required WhichToken whichToken,
    required String token,
  });
  Future<void> deleteToken();
}

import 'package:caching/src/model/token_key_model.dart';
import 'package:caching/src/model/token_model.dart';

abstract class CachingTokenRepository {
  Future<TokenKeyModel?> getToken();
  Future<void> setToken({
    required WhichToken whichToken,
    required TokenModel token,
  });
  Future<void> deleteToken();
}

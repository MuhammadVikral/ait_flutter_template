import 'dart:convert';

import 'package:common_dependency/common_dependency.dart';
import 'package:design_system/src/api/model/token_key_model.dart';

abstract class TokenKeyValue {
  Future<TokenKeyModel?> getToken();
  Future<void> setToken({
    required WhichToken whichToken,
    required TokenModel token,
  });
  Future<void> deleteToken();
}

class TokenkeyValueImpl implements TokenKeyValue {
  final FlutterSecureStorage storage;

  TokenkeyValueImpl(this.storage);

  @override
  Future<TokenKeyModel?> getToken() async {
    String hasUserToken = await storage.read(key: 'token') ?? '';
    String hasGuessToken = await storage.read(key: 'guess_token') ?? '';
    if (hasUserToken.isNotEmpty) {
      return TokenKeyModel(
        whichToken: WhichToken.user,
        token: decodeToken(hasUserToken),
      );
    }
    if (hasUserToken.isEmpty && hasGuessToken.isNotEmpty) {
      return TokenKeyModel(
          whichToken: WhichToken.guess, token: decodeToken(hasGuessToken));
    }
    return null;
  }

  @override
  Future<void> setToken({
    required WhichToken whichToken,
    required TokenModel token,
  }) async {
    if (whichToken == WhichToken.guess) {
      await storage.write(key: 'guess_token', value: encodeToken(token));
    } else {
      await storage.write(key: 'token', value: encodeToken(token));
    }
  }

  TokenModel decodeToken(String token) {
    return TokenModel.fromJson(jsonDecode(token));
  }

  String encodeToken(TokenModel token) {
    return jsonEncode(token);
  }

  @override
  Future<void> deleteToken() async {
    await storage.deleteAll();
  }
}

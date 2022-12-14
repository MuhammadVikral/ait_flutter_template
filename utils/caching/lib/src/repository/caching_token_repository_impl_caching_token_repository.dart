import 'dart:convert';

import 'package:caching/src/model/token_model.dart';

import 'package:caching/src/model/token_key_model.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'caching_token_repository.dart';

class CachingTokenRepositoryImpl implements CachingTokenRepository {
  final FlutterSecureStorage storage;

  CachingTokenRepositoryImpl(this.storage);

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
  Future<void> setToken(
      {required WhichToken whichToken, required TokenModel token}) async {
    if (whichToken == WhichToken.guess) {
      await storage.write(key: 'guess_token', value: encodeToken(token));
    } else {
      await storage.write(key: 'token', value: encodeToken(token));
    }
  }

  @override
  Future<void> deleteToken() async {
    await storage.deleteAll();
  }

  TokenModel decodeToken(String token) {
    return TokenModel.fromJson(jsonDecode(token));
  }

  String encodeToken(TokenModel token) {
    return jsonEncode(token);
  }
}

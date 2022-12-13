import 'dart:convert';

import 'package:caching/src/data/models/models.dart';
import 'package:caching/src/domain/repository/caching_token_repository.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

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
  Future<void> setToken({
    required WhichToken whichToken,
    required String token,
  }) async {
    if (whichToken == WhichToken.guess) {
      await storage.write(key: 'guess_token', value: token);
    } else {
      await storage.write(key: 'token', value: token);
    }
  }

  Map<String, String> decodeToken(String token) {
    return jsonDecode(token);
  }

  @override
  Future<void> deleteToken() async {
    await storage.deleteAll();
  }
}

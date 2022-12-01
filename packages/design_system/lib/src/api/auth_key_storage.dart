import 'package:common_dependency/common_dependency.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class KeyValueStorageService {
  final FlutterSecureStorage storage;

  KeyValueStorageService(this.storage);

  Future<TokenModel?> getToken() async {
    if (await storage.containsKey(key: 'refresh_token')) {}
  }
}

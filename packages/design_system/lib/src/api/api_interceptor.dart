import 'dart:convert';

import 'package:common_dependency/common_dependency.dart';

class ApiInterceptor extends Interceptor {
  ApiInterceptor(this.storage) : super();
  final FlutterSecureStorage storage;
  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    if (options.extra.containsKey('requiresAuthToken')) {
      if (options.extra['requiresAuthToken'] == true) {
        String hasToken = await storage.read(key: 'token') ?? '';
        TokenModel token = TokenModel();
        if (hasToken.isNotEmpty) {
          token = TokenModel.fromJson(jsonDecode(hasToken));
        }
        options.headers.addAll(
          <String, Object?>{'Authorization': 'Bearer ${token.accessToken}'},
        );
      }
      options.extra.remove('requiresAuthToken');
    }
    return handler.next(options);
  }

  @override
  void onError(
    DioError err,
    ErrorInterceptorHandler handler,
  ) {
    print(err);
    handler.reject(err);
  }
}

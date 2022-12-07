import 'dart:convert';

import 'package:common_dependency/common_dependency.dart';

class ApiInterceptor extends Interceptor {
  ApiInterceptor(this.storage, this.dio) : super();
  final FlutterSecureStorage storage;
  final Dio dio;

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
  ) async {
    String hasToken = await storage.read(key: 'token') ?? '';
    if (err.response?.statusCode == 401 && hasToken.isNotEmpty) {
      TokenModel token = TokenModel.fromJson(jsonDecode(hasToken));
      await storage.delete(key: 'token');
      handler.resolve(
        await dio.post(
          err.requestOptions.path,
          options: Options(
              headers: {'Authorization': 'Bearer ${token.refreshToken}'}),
        ),
      );
    } else {
      handler.reject(err);
    }
  }
}

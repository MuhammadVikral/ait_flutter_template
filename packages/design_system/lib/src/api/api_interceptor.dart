import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class ApiInterceptor extends Interceptor {
  ApiInterceptor() : super();
  final FlutterSecureStorage storage = const FlutterSecureStorage();

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    if (options.extra.containsKey('requiresAuthToken')) {
      if (options.extra['requiresAuthToken'] == true) {
        const String token = '';
        options.headers.addAll(
          <String, Object?>{'Authorization': 'Bearer $token'},
        );
      }
      options.extra.remove('requiresAuthToken');
    }
    return handler.next(options);
  }

  @override
  void onResponse(
    Response response,
    ResponseInterceptorHandler handler,
  ) async {
    final int status = response.data['meta']['code'];
    final bool success = status == 200;

    if (success) {
      return handler.next(response);
    } else {
      if (status == 401) {
        final hasRefreshToken = await storage.containsKey(key: 'refresh_token');
        if (hasRefreshToken) {}
      } else {
        return handler.reject(
          DioError(
            requestOptions: response.requestOptions,
            response: response,
          ),
        );
      }
    }
  }
}

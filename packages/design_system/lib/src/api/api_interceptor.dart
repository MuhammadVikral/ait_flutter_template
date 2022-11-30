import 'package:dio/dio.dart';

class ApiInterceptor extends Interceptor {
  ApiInterceptor() : super();

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    if (options.extra.containsKey('requiresAuthToken')) {
      if (options.extra['requiresAuthToken'] == true) {
        print('called');

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
  ) {
    final int status = response.data['meta']['code'];
    final bool success = status == 200;

    if (success) {
      return handler.next(response);
    } else {
      if (status == 401) {
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

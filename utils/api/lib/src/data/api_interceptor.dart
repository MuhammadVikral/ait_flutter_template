import 'dart:convert';

import 'package:api/src/endpoint/auth_endpoint.dart';
import 'package:caching/caching.dart';
import 'package:dio/dio.dart';

class ApiInterceptor extends Interceptor {
  ApiInterceptor(this.cachingToken, this.dio) : super();
  final CachingTokenRepository cachingToken;
  final Dio dio;

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    TokenKeyModel? token = await cachingToken.getToken();
    if (options.extra.containsKey('requiresAuthToken')) {
      if (options.extra['requiresAuthToken'] == true) {
        if (token != null) {
          options.headers.addAll(
            <String, Object?>{
              'Authorization': 'Bearer ${token.token.accessToken}'
            },
          );
        }
      }
    }
    return super.onRequest(options, handler);
  }

  @override
  void onError(
    DioError err,
    ErrorInterceptorHandler handler,
  ) async {
    TokenKeyModel? token = await cachingToken.getToken();
    if (err.response?.statusCode == 401 && token != null) {
      await cachingToken.deleteToken();
      try {
        TokenModel newToken = await refreshToken(
          whichToken: token.whichToken,
          token: token.token,
        );
        await cachingToken.setToken(
            whichToken: token.whichToken, token: newToken);
        handler.resolve(await _retry(
          err.requestOptions,
          newToken.accessToken ?? '',
        ));
      } catch (e) {
        handler.next(err);
      }
    } else {
      return handler.next(err);
    }
  }

  Future<TokenModel> refreshToken(
      {required WhichToken whichToken, required TokenModel token}) async {
    final String uri = whichToken == WhichToken.guess
        ? AuthEndpoint.refreshGuessToken
        : AuthEndpoint.refreshUserToken;
    try {
      final response = await dio.post(
        uri,
        options: Options(
          headers: <String, Object?>{
            'Authorization': 'Bearer ${token.refreshToken}'
          },
        ),
      );
      return TokenModel.fromJson(response.data['data']);
    } catch (e) {
      rethrow;
    }
  }

  Future<Response<dynamic>> _retry(
      RequestOptions requestOptions, String accessToken) async {
    final options = Options(
      method: requestOptions.method,
      headers: <String, Object?>{'Authorization': 'Bearer $accessToken'},
    );
    return dio.request<dynamic>(
      requestOptions.path,
      data: requestOptions.data,
      queryParameters: requestOptions.queryParameters,
      options: options,
    );
  }
}

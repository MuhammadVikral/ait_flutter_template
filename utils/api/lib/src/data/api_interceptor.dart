import 'dart:convert';

import 'package:api/src/endpoint/auth_endpoint.dart';
import 'package:caching/caching.dart';
import 'package:dio/dio.dart';

class ApiInterceptor extends Interceptor {
  ApiInterceptor(this.cachingToken, this.dio) : super();
  final CachingTokenRepository cachingToken;
  final Dio dio;
  String accessToken = '';
  bool isRefreshingToken = false;

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    TokenKeyModel? token = await cachingToken.getToken();
    if (options.extra.containsKey('requiresAuthToken')) {
      if (options.extra['requiresAuthToken'] == true) {
        if (token != null) {
          accessToken = token.token.accessToken!;
          options.headers.addAll(
            <String, Object?>{'Authorization': 'Bearer $accessToken'},
          );
        }
      }
    }
    if (options.extra.containsKey('requiresRefreshToken')) {
      if (options.extra['requiresRefreshToken'] == true) {
        if (token != null) {
          accessToken = token.token.refreshToken!;
          isRefreshingToken = true;
          options.headers.addAll(
            <String, Object?>{'Authorization': 'Bearer $accessToken'},
          );
        }
      }
    }
    return handler.next(options);
  }

  @override
  void onError(
    DioError err,
    ErrorInterceptorHandler handler,
  ) async {
    TokenKeyModel? token = await cachingToken.getToken();
    if (err.response?.statusCode == 401 && token != null) {
      bool refreshingTokenSuccess = await refreshToken(
        whichToken: token.whichToken,
        token: token.token,
      );
      if (refreshingTokenSuccess) {
        return handler.resolve(await _retry(err.requestOptions));
      } else {
        return handler.reject(err);
      }
    }
    return handler.reject(err);
  }

  Future<bool> refreshToken(
      {required WhichToken whichToken, required TokenModel token}) async {
    final String uri = whichToken == WhichToken.guess
        ? AuthEndpoint.refreshGuessToken
        : AuthEndpoint.refreshUserToken;
    try {
      cachingToken.deleteToken();
      final response = await dio.post(
        uri,
        options: Options(
          headers: <String, Object?>{'Authorization': 'Bearer $accessToken'},
        ),
      );
      if (response.statusCode == 200) {
        cachingToken.setToken(whichToken: whichToken, token: token);
        TokenModel newToken = TokenModel.fromJson(jsonDecode(response.data));
        accessToken =
            isRefreshingToken ? newToken.refreshToken! : newToken.accessToken!;
        return true;
      } else {
        cachingToken.deleteToken();
        return false;
      }
    } catch (e) {
      return false;
    }
  }

  Future<Response<dynamic>> _retry(RequestOptions requestOptions) async {
    final options = Options(
      method: requestOptions.method,
      headers: requestOptions.headers,
    );
    return dio.request<dynamic>(
      requestOptions.path,
      data: requestOptions.data,
      queryParameters: requestOptions.queryParameters,
      options: options,
    );
  }
}

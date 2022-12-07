import 'dart:convert';

import 'package:common_dependency/common_dependency.dart';
import 'package:design_system/src/api/endpoint/auth_endpoint.dart';
import 'package:design_system/src/api/model/token_key_model.dart';
import 'package:design_system/src/api/token_key_value.dart';

class ApiInterceptor extends Interceptor {
  ApiInterceptor(this.keyValue, this.dio) : super();
  final TokenKeyValue keyValue;
  final Dio dio;
  String accessToken = '';

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    if (options.extra.containsKey('requiresAuthToken')) {
      if (options.extra['requiresAuthToken'] == true) {
        TokenKeyModel? token = await keyValue.getToken();
        if (token != null) {
          accessToken = token.token.accessToken!;
          options.headers.addAll(
            <String, Object?>{'Authorization': 'Bearer $accessToken'},
          );
        }
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
    TokenKeyModel? token = await keyValue.getToken();
    if (err.response?.statusCode == 401 && token != null) {
      bool refreshingTokenSuccess = await refreshToken(
        whichToken: token.whichToken,
        token: token.token,
      );
      if (refreshingTokenSuccess) {
        return handler.resolve(await _retry(err.requestOptions));
      }
    }
    return handler.next(err);
  }

  Future<bool> refreshToken(
      {required WhichToken whichToken, required TokenModel token}) async {
    final String uri = whichToken == WhichToken.guess
        ? AuthEndpoint.refreshGuessToken
        : AuthEndpoint.refreshUserToken;
    final response = await dio.post(
      uri,
      data: {'refreshToken': token.refreshToken},
    );
    if (response.statusCode == 201) {
      keyValue.setToken(whichToken: whichToken, token: token);
      TokenModel newToken = TokenModel.fromJson(jsonDecode(response.data));
      accessToken = newToken.accessToken!;
      return true;
    } else {
      keyValue.deleteToken();
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

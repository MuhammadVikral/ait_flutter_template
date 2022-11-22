import 'package:design_system/design_system.dart';
import 'package:design_system/src/api/model/token_model.dart';
import 'package:design_system/src/config/config.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late ApiService sut;
  late DioService dioService;
  setUp(
    () {
      FlutterError.onError = (FlutterErrorDetails details) async {
        prints(details);
      };
      final baseOptions = BaseOptions(
        baseUrl: Config.baseUrl,
      );
      dioService = DioService(
        dioClient: Dio(baseOptions),
      );
      sut = ApiService(dioService);
    },
  );
  test(
    'api service should call url auth succesfully',
    () async {
      final res = await sut.setData<TokenModel>(
        endpoint: '/oauth/auth',
        data: {"app": "test", "key": "oJi1WeLsmh7nVily0MrB"},
        converter: (response) {
          print(response.meta);
          return TokenModel.fromJson(response.data ?? {});
        },
      );
    },
  );
}

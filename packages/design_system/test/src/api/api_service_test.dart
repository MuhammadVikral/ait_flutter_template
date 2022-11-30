import 'package:design_system/design_system.dart';
import 'package:design_system/src/api/api_interceptor.dart';
import 'package:design_system/src/config/config.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockDioService extends Mock implements DioService {}

class MockResponModel extends Mock implements ResponseModel {}

void main() {
  late ApiService sut;
  late DioService dioService;
  late MockDioService mockDioService;
  late ApiInterceptor interceptor;
  setUp(
    () {},
  );
  setUpAll(
    () {
      interceptor = ApiInterceptor();
      final baseOptions = BaseOptions(
        baseUrl: Config.baseUrl,
      );
      dioService = DioService(
        dioClient: Dio(baseOptions),
        interceptors: [interceptor],
      );
      mockDioService = MockDioService();
      registerFallbackValue(MockResponModel());
    },
  );
  group(
    'real api call test',
    () {
      setUp(
        () {
          sut = ApiService(dioService);
        },
      );
      test(
        'api service should call url auth succesfully',
        () async {
          await sut.setData<TokenModel>(
            endpoint: '/oauth/auth',
            data: {"app": "test", "key": "oJi1WeLsmh7nVily0MrB"},
            converter: (response) {
              return TokenModel.fromJson(response.data ?? {});
            },
          );
        },
      );
    },
  );
  group(
    'test call mock',
    () {
      setUp(
        () {
          sut = ApiService(mockDioService);
        },
      );
      test(
        'api service should call dio service',
        () async {
          when(
            () => mockDioService.post<JSON>(
              endpoint: any(named: 'endpoint'),
              data: any(named: 'data'),
              options: any(named: 'options'),
            ),
          ).thenAnswer(
            (_) async => Future.value(
              ResponseModel(
                meta: MetaModel(code: 200, message: 'success'),
                data: {
                  "access_token": "abc",
                  "refresh_token": "abc",
                },
              ),
            ),
          );
          final res = await sut.setData<TokenModel>(
            endpoint: '/oauth/auth',
            data: {"app": "test", "key": "oJi1WeLsmh7nVily0MrB"},
            converter: (response) {
              return TokenModel.fromJson(response.data ?? {});
            },
          );
          expect(res, TokenModel(accessToken: 'abc', refreshToken: 'abc'));
        },
      );
    },
  );
}

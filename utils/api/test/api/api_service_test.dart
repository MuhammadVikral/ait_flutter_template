import 'package:common_dependency/common_dependency.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockDioService extends Mock implements DioService {}

class MockResponModel extends Mock implements ResponseModel {}

void main() {
  late ApiService sut;
  late MockDioService mockDioService;
  setUp(
    () {},
  );
  setUpAll(
    () {
      mockDioService = MockDioService();
      registerFallbackValue(MockResponModel());
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

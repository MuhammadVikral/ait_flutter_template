import 'package:api/src/repository/api_repository_impl.dart';
import 'package:api/src/data/dio_service.dart';
import 'package:api/src/model/response_model.dart';
import 'package:caching/caching.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockDioService extends Mock implements DioService {}

class MockResponModel extends Mock implements ResponseModel {}

void main() {
  late ApiRepositoryImpl sut;
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
          sut = ApiRepositoryImpl(mockDioService);
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

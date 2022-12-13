import 'package:auth/src/data/datasources/auth_remote_ds.dart';
import 'package:common_dependency/common_dependency.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockApiService extends Mock implements ApiService {}

class MockTokenModel extends Mock implements TokenModel {}

class MockResponModel extends Mock implements ResponseModel {}

class MockMetaModel extends Mock implements MetaModel {}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  late MockApiService service;
  late AuthRemoteDataSourceImpl sut;

  setUp(
    () {
      service = MockApiService();
      sut = AuthRemoteDataSourceImpl(service);
    },
  );
  setUpAll(
    () {
      registerFallbackValue(MockTokenModel());
      registerFallbackValue(MockResponModel());
      registerFallbackValue(MockMetaModel());
    },
  );
  test(
    'auth remote ds should return nothing when success',
    () async {
      var tokenModel = TokenModel(
        accessToken: 'abc',
        refreshToken: 'abc',
      );
      when(
        () => service.setData<TokenModel>(
          endpoint: any(named: 'endpoint'),
          data: any(named: 'data'),
          converter: any(named: 'converter'),
          requiresAuthToken: any(named: 'requiresAuthToken'),
        ),
      ).thenAnswer(
        (_) {
          return Future.value(tokenModel);
        },
      );
      final res = await sut.getInitialToken();
      expect(res, tokenModel);
    },
  );
  test(
    'auth remote ds should throw exception on error',
    () async {
      when(
        () => service.setData<TokenModel>(
          endpoint: any(named: 'endpoint'),
          data: any(named: 'data'),
          converter: any(named: 'converter'),
          requiresAuthToken: any(named: 'requiresAuthToken'),
        ),
      ).thenThrow(
        CustomException.fromDioException(
          DioError(
            type: DioErrorType.connectTimeout,
            requestOptions: RequestOptions(
              path: '',
            ),
          ),
        ),
      );

      expect(() => sut.getInitialToken(), throwsA(isA<CustomException>()));
    },
  );
}

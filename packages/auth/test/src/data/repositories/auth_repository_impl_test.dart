import 'package:auth/src/data/datasources/auth_local_ds.dart';
import 'package:auth/src/data/datasources/auth_remote_ds.dart';
import 'package:auth/src/data/model/login_model.dart';
import 'package:auth/src/data/repositories/auth_repository_impl.dart';
import 'package:common_dependency/common_dependency.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockNetworkInfo extends Mock implements NetworkInfo {}

class MockAuthRemoteDataSource extends Mock implements AuthRemoteDataSource {}

class MockAuthLocalDataSource extends Mock implements AuthLocalDataSource {}

class MockTokenModel extends Mock implements TokenModel {}

class MockLoginModel extends Mock implements LoginModel {}

void main() {
  late MockNetworkInfo networkInfo;
  late MockAuthRemoteDataSource service;
  late MockAuthLocalDataSource memory;
  late AuthRepositoriesImpl sut;

  setUpAll(
    () {
      registerFallbackValue(WhichToken.user);
      registerFallbackValue(MockTokenModel());
      registerFallbackValue(MockLoginModel());
    },
  );
  setUp(
    () {
      networkInfo = MockNetworkInfo();
      service = MockAuthRemoteDataSource();
      memory = MockAuthLocalDataSource();
      sut = AuthRepositoriesImpl(
        networkInfo: networkInfo,
        service: service,
        memory: memory,
      );
    },
  );
  group(
    'getInitialToken',
    () {
      testWidgets(
        'should return Network Failure when no internet connection',
        (tester) async {
          _noInternetConnection(networkInfo);
          final Either<Failure, Unit> res = await sut.getInitialToken();
          expect(res, equals(Left(NetworkFailure())));
        },
      );
      testWidgets(
        'should call remote data source when having internet connection',
        (tester) async {
          _haveInternetConnection(networkInfo);
          await sut.getInitialToken();
          verify(() => service.getInitialToken()).called(1);
        },
      );
      testWidgets(
        'should return cache failure if caching is failed',
        (tester) async {
          _haveInternetConnection(networkInfo);
          when(
            () => memory.setTokens(
                whichToken: WhichToken.guess, token: TokenModel()),
          ).thenAnswer((_) async => throw Exception());
          when(
            () => service.getInitialToken(),
          ).thenAnswer((_) async => Future.value(TokenModel()));
          final res = await sut.getInitialToken();
          verify(() => service.getInitialToken()).called(1);
          verify(() => memory.setTokens(
                whichToken: WhichToken.guess,
                token: TokenModel(),
              )).called(1);
          expect(res, equals(Left(CacheFailure())));
        },
      );
    },
  );

  group(
    "refresh token",
    () {
      test(
        'refresh token should called memory set token when refresh token is sucess',
        () async {
          _haveInternetConnection(networkInfo);
          when(() => service.refreshUserToken(WhichToken.guess)).thenAnswer(
            (invocation) async => TokenModel(),
          );
          await sut.refreshToken(WhichToken.guess);
          verify(() => memory.setTokens(
              whichToken: WhichToken.guess, token: TokenModel())).called(1);
        },
      );
      test(
        'refresh token should return right(false) when refresh token is failed but unAutorizedFailed',
        () async {
          _haveInternetConnection(networkInfo);
          when(() => service.refreshUserToken(WhichToken.guess))
              .thenThrow(CustomException(
            message: '',
            failureType: UnAuthorizedFailure(),
          ));
          final res = await sut.refreshToken(WhichToken.guess);
          expect(res, const Right(false));
        },
      );
    },
  );
  group(
    'login use case',
    () {
      var loginEntity = LoginEntity(
        email: '123',
        password: '123',
      );
      var tokenModel = TokenModel(accessToken: '123', refreshToken: '123');
      test(
        'login should return token model when success',
        () async {
          _haveInternetConnection(networkInfo);
          when(
            () => memory.setTokens(
              whichToken: any(named: 'whichToken'),
              token: any(named: 'token'),
            ),
          ).thenAnswer((invocation) async => Null);
          when(() => service.login(any()))
              .thenAnswer((invocation) async => tokenModel);
          final res = await sut.login(loginEntity);
          verify(
            () => memory.setTokens(
              whichToken: any(named: 'whichToken'),
              token: any(named: 'token'),
            ),
          ).called(1);
          expect(res, const Right(unit));
        },
      );
      test(
        'login should return cache failure when service is succes but caching is failed',
        () async {
          _haveInternetConnection(networkInfo);
          when(
            () => memory.setTokens(
              whichToken: any(named: 'whichToken'),
              token: any(named: 'token'),
            ),
          ).thenThrow(Exception());
          when(() => service.login(any()))
              .thenAnswer((invocation) async => tokenModel);
          final res = await sut.login(loginEntity);
          verify(
            () => memory.setTokens(
              whichToken: any(named: 'whichToken'),
              token: any(named: 'token'),
            ),
          ).called(1);
          expect(res, Left(CacheFailure()));
        },
      );
      test(
        'login should return UnAuthorizedFailure and not called set memory when service is failed because unAuthorized',
        () async {
          _haveInternetConnection(networkInfo);
          when(() => service.login(any())).thenThrow(
              CustomException(message: '', failureType: UnAuthorizedFailure()));
          final res = await sut.login(loginEntity);
          verifyNever(
            () => memory.setTokens(
              whichToken: any(named: 'whichToken'),
              token: any(named: 'token'),
            ),
          );
          expect(res, Left(UnAuthorizedFailure()));
        },
      );
      test(
        'login should return UnrecognizedFailure and not called set memory when service is failed but undetected',
        () async {
          _haveInternetConnection(networkInfo);
          when(() => service.login(any())).thenThrow(Exception());
          final res = await sut.login(loginEntity);
          verifyNever(
            () => memory.setTokens(
              whichToken: any(named: 'whichToken'),
              token: any(named: 'token'),
            ),
          );
          expect(res, Left(UnRecognizedFailure()));
        },
      );
    },
  );
}

void _noInternetConnection(MockNetworkInfo networkInfo) {
  return when(() => networkInfo.isConnected).thenAnswer(
    (_) async => false,
  );
}

void _haveInternetConnection(MockNetworkInfo networkInfo) {
  return when(() => networkInfo.isConnected).thenAnswer(
    (_) async => true,
  );
}

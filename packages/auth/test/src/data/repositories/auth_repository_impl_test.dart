import 'package:auth/src/data/datasources/auth_local_ds.dart';
import 'package:auth/src/data/datasources/auth_remote_ds.dart';
import 'package:auth/src/data/repositories/auth_repository_impl.dart';
import 'package:common_dependency/common_dependency.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockNetworkInfo extends Mock implements NetworkInfo {}

class MockAuthRemoteDataSource extends Mock implements AuthRemoteDataSource {}

class MockAuthLocalDataSource extends Mock implements AuthLocalDataSource {}

void main() {
  late MockNetworkInfo networkInfo;
  late MockAuthRemoteDataSource service;
  late MockAuthLocalDataSource memory;
  late AuthRepositoriesImpl sut;

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

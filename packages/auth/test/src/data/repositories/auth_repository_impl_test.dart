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
            () => memory.setTokens(),
          ).thenAnswer((_) async => Left(CacheFailure()));
          when(
            () => service.getInitialToken(),
          ).thenAnswer((_) async => const Right(unit));
          final res = await sut.getInitialToken();
          verify(() => service.getInitialToken()).called(1);
          verify(() => memory.setTokens()).called(1);
          expect(res, equals(Left(CacheFailure())));
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

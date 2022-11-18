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

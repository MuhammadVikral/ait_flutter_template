import 'package:auth/src/domain/repositories/auth_repositories.dart';
import 'package:auth/src/domain/use_case/check_loggedin_usecase.dart';
import 'package:common_dependency/common_dependency.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockAuthRepository with Mock implements AuthRepositories {}

void main() {
  late MockAuthRepository repository;
  late CheckLoggedInUseCase sut;
  setUp(
    () {
      repository = MockAuthRepository();
      sut = CheckLoggedInUseCase(repository);
    },
  );
  group(
    'have access token',
    () {
      setUp(
        () {
          _callHasToken(repository, true);
        },
      );
      test(
        'check loggedin usecase return true when has token and refresh token success',
        () async {
          when(() => repository.refreshToken())
              .thenAnswer((invocation) async => const Right(unit));
          final res = await sut();
          verify(() => repository.refreshToken()).called(1);
          expect(res, const Right(true));
        },
      );
      test(
        'check loggedin usecase return false when has token and refresh token return unAuthorized Exception',
        () async {
          when(() => repository.refreshToken())
              .thenAnswer((invocation) async => Left(UnAuthorizedFailure()));
          final res = await sut();
          verify(() => repository.refreshToken()).called(1);
          expect(res, const Right(false));
        },
      );
      test(
        'check loggedin usecase return Left when refreshToken return failed and not UnAuthorized Failure',
        () async {
          when(() => repository.refreshToken())
              .thenAnswer((invocation) async => Left(NetworkFailure()));
          final res = await sut();
          verify(() => repository.refreshToken()).called(1);
          expect(res, Left(NetworkFailure()));
        },
      );
    },
  );
  group(
    'doesnt have access token',
    () {
      setUp(
        () {
          _callHasToken(repository, false);
        },
      );
      test(
        'check loggedin usecase return false when has token is false',
        () async {
          when(() => repository.getInitialToken())
              .thenAnswer((invocation) async => const Right(unit));
          final res = await sut();
          verify(() => repository.getInitialToken()).called(1);
          expect(res, const Right(false));
        },
      );
      test(
        'check loggedin usecase return failure when getToken is success but get initial token is failed',
        () async {
          when(() => repository.getInitialToken())
              .thenAnswer((invocation) async => Left(NetworkFailure()));
          final res = await sut();
          verify(() => repository.getInitialToken()).called(1);
          expect(res, Left(NetworkFailure()));
        },
      );
    },
  );
}

_callHasToken(MockAuthRepository repository, bool hasToken) {
  return when(() => repository.hasToken())
      .thenAnswer((invocation) async => Future.value(Right(hasToken)));
}

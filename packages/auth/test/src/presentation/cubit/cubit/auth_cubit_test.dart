import 'package:auth/src/domain/use_case/check_loggedin_usecase.dart';
import 'package:auth/src/presentation/cubit/cubit/auth_cubit.dart';
import 'package:common_dependency/common_dependency.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockCheckLoggedInUseCase with Mock implements CheckLoggedInUseCase {}

void main() {
  late MockCheckLoggedInUseCase loggedInUseCase;
  late AuthCubit sut;
  setUp(
    () {
      loggedInUseCase = MockCheckLoggedInUseCase();
      sut = AuthCubit(loggedInUseCase);
    },
  );
  group(
    "init App",
    () {
      test(
        'auth cubit should emit logged in true and status succes when usecase success',
        () async {
          when(() => loggedInUseCase()).thenAnswer(
            (invocation) async => const Right(true),
          );
          await sut.initApp();
          expect(sut.state.loggedin, true);
          expect(sut.state.status, FormzStatus.submissionSuccess);
        },
      );
      test(
        'auth cubit should emit logged in false and status succes when usecase success but return is false',
        () async {
          when(() => loggedInUseCase()).thenAnswer(
            (invocation) async => const Right(false),
          );
          await sut.initApp();
          expect(sut.state.loggedin, false);
          expect(sut.state.status, FormzStatus.submissionSuccess);
        },
      );
      test(
        'auth cubit should emit logged in false and status failed when usecase is failed',
        () async {
          when(() => loggedInUseCase()).thenAnswer(
            (invocation) async => Left(NetworkFailure()),
          );
          await sut.initApp();
          expect(sut.state.loggedin, false);
          expect(sut.state.status, FormzStatus.submissionFailure);
        },
      );
    },
  );
}

import 'package:auth/src/domain/use_case/login_use_case.dart';
import 'package:common_dependency/common_dependency.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockLoginUsecase extends Mock implements LoginUseCase {}

class MockLoginInput extends Mock implements LoginInput {}

class MockPasswordInput extends Mock implements PasswordInput {}

void main() {
  late MockLoginUsecase mockUseCase;
  late LoginCubit loginCubit;
  final errorDialog = find.byKey(const ValueKey('error dialog login'));
  final loginPage = find.byKey(const ValueKey('login page'));
  setUpAll(
    () {
      registerFallbackValue(MockLoginInput());
      registerFallbackValue(MockPasswordInput());
      sl.registerFactory(() => loginCubit);
    },
  );
  setUp(
    () {
      mockUseCase = MockLoginUsecase();
      loginCubit = LoginCubit(loginClient: mockUseCase);
    },
  );
  testWidgets(
    'should show error dialog when submission failed',
    (tester) async {
      _calledUseCaseWithValidValue(mockUseCase)
          .thenAnswer((_) => Future.value(Left(NetworkFailure())));
      await tester.pumpWidget(const MaterialApp(home: Login()));
      await loginCubit.onTappedButon();
      await tester.pump();
      expect(errorDialog, findsOneWidget);
    },
  );
  testWidgets(
    'should go to next page when submission success',
    (tester) async {
      _calledUseCaseWithValidValue(mockUseCase)
          .thenAnswer((_) => Future.value(const Right(unit)));
      await tester.pumpWidget(const MaterialApp(home: Login()));
      await loginCubit.onTappedButon();
      await tester.pumpAndSettle();
      expect(errorDialog, findsNothing);
      expect(loginPage, findsNothing);
    },
  );
}

When<Future<Either<Failure, Unit>>> _calledUseCaseWithValidValue(
    LoginUseCase mockUseCase) {
  return when(
    () => mockUseCase(
        username: any(named: 'username'), password: any(named: 'password')),
  );
}

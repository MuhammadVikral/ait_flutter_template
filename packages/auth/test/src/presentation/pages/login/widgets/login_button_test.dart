import 'package:auth/auth_module.dart';
import 'package:auth/src/domain/use_case/login_use_case.dart';
import 'package:common_dependency/common_dependency.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockLoginUsecase extends Mock implements LoginUseCase {}

class MockLoginInput extends Mock implements LoginInput {}

class MockPasswordInput extends Mock implements PasswordInput {}

void main() {
  final loginButton = find.byKey(const ValueKey('login button'));
  final passwordInput = find.byKey(const ValueKey('password input'));
  final usernameInput = find.byKey(const ValueKey('username input'));
  late MockLoginUsecase mockUseCase;
  setUpAll(
    () {
      registerFallbackValue(MockLoginInput());
      registerFallbackValue(MockPasswordInput());
      mockUseCase = MockLoginUsecase();
      sl.registerFactory(() => LoginCubit(loginClient: mockUseCase));
    },
  );
  setUp(
    () {},
  );
  group(
    'wether button is enabled or not',
    () {
      testWidgets(
        'login button should not enabled when first rendered',
        (tester) async {
          await tester.pumpWidget(const MaterialApp(home: Login()));
          expect(
              (tester.firstWidget(loginButton) as DesignButton).enabled, false);
        },
      );
      testWidgets(
        'login button should not enabled when only username that is valid',
        (tester) async {
          await tester.pumpWidget(const MaterialApp(home: Login()));
          await tester.enterText(usernameInput, 'skypea');
          await tester.pump();
          expect(
              (tester.firstWidget(loginButton) as DesignButton).enabled, false);
        },
      );
      testWidgets(
        'login button should not enabled when only password that is valid',
        (tester) async {
          await tester.pumpWidget(const MaterialApp(home: Login()));
          await tester.enterText(passwordInput, '12345678');
          await tester.pump();
          expect(
              (tester.firstWidget(loginButton) as DesignButton).enabled, false);
        },
      );
      testWidgets(
        'login button should be enabled when username & password is valid',
        (tester) async {
          await tester.pumpWidget(const MaterialApp(home: Login()));
          await tester.enterText(usernameInput, 'skypea');
          await tester.enterText(passwordInput, '12345678');
          await tester.pump();
          expect(
              (tester.firstWidget(loginButton) as DesignButton).enabled, true);
        },
      );
    },
  );
  group(
    'login button clicked',
    () {
      testWidgets(
        'should show circular loading when pressed',
        (WidgetTester tester) async {
          _calledUseCaseWithValidValue(mockUseCase).thenAnswer((_) async {
            await Future.delayed(const Duration(seconds: 1));
            return Future.value(const Right(unit));
          });
          await tester.pumpWidget(const MaterialApp(home: Login()));
          await tester.enterText(usernameInput, 'skypea');
          await tester.enterText(passwordInput, '12345678');
          await tester.tap(loginButton);
          await tester.pump(const Duration(milliseconds: 500));
          expect(
            (tester.firstWidget(loginButton) as DesignButton).isLoading,
            true,
          );
          await tester.pumpAndSettle();
        },
      );
      testWidgets(
        'should show circular loading when pressed and then stop when finished',
        (WidgetTester tester) async {
          _calledUseCaseWithValidValue(mockUseCase).thenAnswer((_) async {
            await Future.delayed(const Duration(seconds: 1));
            return Future.value(const Right(unit));
          });
          await tester.pumpWidget(const MaterialApp(home: Login()));
          await tester.enterText(usernameInput, 'skypea');
          await tester.enterText(passwordInput, '12345678');
          await tester.tap(loginButton);
          await tester.pump(const Duration(milliseconds: 500));
          expect(
            (tester.firstWidget(loginButton) as DesignButton).isLoading,
            true,
          );
          await tester.pump(const Duration(seconds: 1));
          expect(
            (tester.firstWidget(loginButton) as DesignButton).isLoading,
            false,
          );
          await tester.pumpAndSettle();
        },
      );
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

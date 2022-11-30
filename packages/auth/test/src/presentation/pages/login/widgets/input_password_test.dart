import 'package:bloc_test/bloc_test.dart';
import 'package:common_dependency/common_dependency.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockLoginCubit extends MockCubit<LoginState> implements LoginCubit {}

void main() {
  final passwordInput = find.byKey(const ValueKey('password input'));
  late LoginCubit mockLoginCubit;

  setUp(
    () {
      mockLoginCubit = MockLoginCubit();
    },
  );

  testWidgets(
    'input password should change password input state',
    (tester) async {
      when(() => mockLoginCubit.state).thenAnswer(
        (_) => LoginState.initial(),
      );
      await _pumpMaterial(tester, mockLoginCubit);
      await tester.enterText(passwordInput, '088');
      await tester.pumpAndSettle();
      verify(
        () => mockLoginCubit.onChangePassword('088'),
      ).called(1);
    },
  );
  testWidgets(
    'input password should not show error message on start',
    (tester) async {
      when(() => mockLoginCubit.state).thenAnswer(
        (_) => LoginState.initial(),
      );
      await _pumpMaterial(tester, mockLoginCubit);
      expect(find.text('password minimal 8 character'), findsNothing);
    },
  );
  testWidgets(
    'input password should show error message when has foccused Node',
    (tester) async {
      when(() => mockLoginCubit.state).thenAnswer(
        (_) => LoginState.initial().copyWith(showErrorMessagePassword: true),
      );
      await _pumpMaterial(tester, mockLoginCubit);
      await tester.tap(passwordInput);
      await tester.pump();
      expect(find.text('password tidak boleh kosong'), findsOneWidget);
    },
  );
  testWidgets(
    'input password should show password minimal 8 character when inputted character is less than 8',
    (tester) async {
      when(() => mockLoginCubit.state).thenAnswer(
        (_) => LoginState.initial().copyWith(
          showErrorMessagePassword: true,
          passwordInput: PasswordInput.dirty('088'),
        ),
      );
      await _pumpMaterial(tester, mockLoginCubit);
      await tester.enterText(passwordInput, '088');
      await tester.pump();

      expect(find.text('088'), findsOneWidget);
      expect(find.text('password minimal 8 character'), findsOneWidget);
    },
  );
  testWidgets(
    'input password should show not show error message when password inputted correctly',
    (tester) async {
      when(() => mockLoginCubit.state).thenAnswer(
        (_) => LoginState.initial().copyWith(
          showErrorMessagePassword: true,
          passwordInput: PasswordInput.dirty('12345678'),
        ),
      );
      await _pumpMaterial(tester, mockLoginCubit);
      await tester.enterText(passwordInput, '12345678');
      await tester.pump();

      expect(find.text('12345678'), findsOneWidget);
      expect(find.text('password minimal 8 character'), findsNothing);
    },
  );
}

Future<void> _pumpMaterial(
    WidgetTester tester, LoginCubit mockLoginCubit) async {
  return await tester.pumpWidget(
    BlocProvider<LoginCubit>(
      create: (context) => mockLoginCubit,
      child: const MaterialApp(
        home: LoginPage(),
      ),
    ),
  );
}

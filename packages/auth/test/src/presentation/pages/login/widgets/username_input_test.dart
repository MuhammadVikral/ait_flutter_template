import 'package:auth/src/presentation/pages/login/login.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:common_dependency/common_dependency.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockLoginCubit extends MockCubit<LoginState> implements LoginCubit {}

void main() {
  final usernameInput = find.byKey(const ValueKey('username input'));
  final passwordInput = find.byKey(const ValueKey('password input'));
  late LoginCubit mockLoginCubit;

  setUp(
    () {
      mockLoginCubit = MockLoginCubit();
    },
  );
  testWidgets(
    'username input focus node called onUsernameLoseFocus when loses focus',
    (tester) async {
      LoginState state = LoginState.initial();
      when(() => mockLoginCubit.state).thenAnswer(
        (_) => state,
      );
      when(() => mockLoginCubit.onUsernameLoseFocus()).thenAnswer(
        (_) => state = state.copyWith(showErrorMessageUsername: true),
      );
      await _pumpMaterial(tester, mockLoginCubit);
      await tester.tap(usernameInput);
      await tester.tap(passwordInput);
      verify(() => mockLoginCubit.onUsernameLoseFocus()).called(1);
      expect(state.showErrorMessageUsername, true);
    },
  );
  testWidgets(
    'input username should not show error message on start',
    (tester) async {
      when(() => mockLoginCubit.state).thenAnswer(
        (_) => LoginState.initial(),
      );
      await _pumpMaterial(tester, mockLoginCubit);
      expect(
        (tester.firstWidget(usernameInput) as DesignTextInput).errorText,
        null,
      );
    },
  );
  testWidgets(
    'input username should show error message when showErrorMEssageUsername is true',
    (tester) async {
      when(() => mockLoginCubit.state).thenAnswer(
        (_) => LoginState.initial().copyWith(showErrorMessageUsername: true),
      );
      await _pumpMaterial(tester, mockLoginCubit);
      expect(
        (tester.firstWidget(usernameInput) as DesignTextInput).errorText,
        'Tidak boleh kosong',
      );
    },
  );
  testWidgets(
    'input username should show error message "Format email Salah" when user inputted email with wrong format',
    (tester) async {
      when(() => mockLoginCubit.state).thenAnswer(
        (_) => LoginState.initial().copyWith(
          showErrorMessageUsername: true,
          loginInput: LoginInput.dirty('@v'),
        ),
      );
      await _pumpMaterial(tester, mockLoginCubit);
      expect(
        (tester.firstWidget(usernameInput) as DesignTextInput).errorText,
        'Format email Salah',
      );
    },
  );
  testWidgets(
    'input username should show error message "format phone number tidak sesuai" when user inputted phone number with wrong format',
    (tester) async {
      when(() => mockLoginCubit.state).thenAnswer(
        (_) => LoginState.initial().copyWith(
          showErrorMessageUsername: true,
          loginInput: LoginInput.dirty('08'),
        ),
      );
      await _pumpMaterial(tester, mockLoginCubit);
      expect(
        (tester.firstWidget(usernameInput) as DesignTextInput).errorText,
        'format phone number tidak sesuai',
      );
    },
  );
  testWidgets(
    'input username should show error message "Please enter at least 3 characters." when user inputted username with wrong format',
    (tester) async {
      when(() => mockLoginCubit.state).thenAnswer(
        (_) => LoginState.initial().copyWith(
          showErrorMessageUsername: true,
          loginInput: LoginInput.dirty('ab'),
        ),
      );
      await _pumpMaterial(tester, mockLoginCubit);
      expect(
        (tester.firstWidget(usernameInput) as DesignTextInput).errorText,
        'Please enter at least 3 characters.',
      );
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

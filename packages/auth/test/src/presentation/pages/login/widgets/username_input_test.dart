import 'package:common_dependency/common_dependency.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final usernameInput = find.byKey(const ValueKey('username input'));
  final passwordInput = find.byKey(const ValueKey('password input'));
  bool showErrorMessage = false;
  testWidgets(
    'username input focus node has focus on tap text input',
    (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: BlocProvider(
            create: (context) => LoginCubit(),
            child: BlocListener<LoginCubit, LoginState>(
              listener: (context, state) {
                showErrorMessage = state.showErrorMessageUsername;
              },
              child: const LoginPage(),
            ),
          ),
        ),
      );
      await tester.tap(usernameInput);
      await tester.tap(passwordInput);
      expect(showErrorMessage, true);
    },
  );
  testWidgets(
    'input username should not show error message on start',
    (tester) async {
      await tester.pumpWidget(const MaterialApp(home: Login()));
      expect(
        (tester.firstWidget(usernameInput) as DesignTextInput).errorText,
        null,
      );
    },
  );
  testWidgets(
    'input username should show error message when username input loses focused',
    (tester) async {
      await tester.pumpWidget(const MaterialApp(home: Login()));
      await tester.tap(usernameInput);
      await tester.tap(passwordInput);
      await tester.pump();
      expect(
        (tester.firstWidget(usernameInput) as DesignTextInput).errorText,
        'Tidak boleh kosong',
      );
    },
  );
  testWidgets(
    'input username should show error message "Format email Salah" when user inputted email with wrong format',
    (tester) async {
      await tester.pumpWidget(const MaterialApp(home: Login()));
      await tester.enterText(usernameInput, '@123');
      await tester.tap(passwordInput);
      await tester.pump();
      expect(
        (tester.firstWidget(usernameInput) as DesignTextInput).errorText,
        'Format email Salah',
      );
    },
  );
  testWidgets(
    'input username should show error message "format phone number tidak sesuai" when user inputted phone number with wrong format',
    (tester) async {
      await tester.pumpWidget(const MaterialApp(home: Login()));
      await tester.enterText(usernameInput, '123');
      await tester.tap(passwordInput);
      await tester.pump();
      expect(
        (tester.firstWidget(usernameInput) as DesignTextInput).errorText,
        'format phone number tidak sesuai',
      );
    },
  );
  testWidgets(
    'input username should show error message "Please enter at least 3 characters." when user inputted username with wrong format',
    (tester) async {
      await tester.pumpWidget(const MaterialApp(home: Login()));
      await tester.enterText(usernameInput, 'ab');
      await tester.tap(passwordInput);
      await tester.pump();
      expect(
        (tester.firstWidget(usernameInput) as DesignTextInput).errorText,
        'Please enter at least 3 characters.',
      );
    },
  );
}

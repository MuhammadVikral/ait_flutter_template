import 'package:common_dependency/common_dependency.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final loginButton = find.byKey(const ValueKey('login button'));
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
                showErrorMessage = state.showErrorMessage;
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
}

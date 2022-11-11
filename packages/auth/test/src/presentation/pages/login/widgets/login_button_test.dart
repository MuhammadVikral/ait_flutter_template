import 'package:common_dependency/common_dependency.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final loginButton = find.byKey(const ValueKey('login button'));
  final passwordInput = find.byKey(const ValueKey('password input'));
  final usernameInput = find.byKey(const ValueKey('username input'));
  group(
    'wether button is enabled or nor',
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
}

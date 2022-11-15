import 'package:auth/auth_module.dart';
import 'package:common_dependency/common_dependency.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final loginButton = find.byKey(const ValueKey('login button'));
  final passwordInput = find.byKey(const ValueKey('password input'));
  final usernameInput = find.byKey(const ValueKey('username input'));
  setUpAll(
    () async {
      await AuthModule.init();
    },
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
          await tester.pumpWidget(const MaterialApp(home: Login()));
          await tester.enterText(usernameInput, 'skypea');
          await tester.enterText(passwordInput, '12345678');
          await tester.tap(loginButton);
          await tester.pump();
          expect((tester.firstWidget(loginButton) as DesignButton).isLoading,
              true);
        },
      );
    },
  );
}

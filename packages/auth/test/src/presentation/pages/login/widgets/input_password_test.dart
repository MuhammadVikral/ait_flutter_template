import 'package:common_dependency/common_dependency.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final passwordInput = find.byKey(const ValueKey('password input'));
  testWidgets(
    'input password should change password input state',
    (tester) async {
      String inputValue = '';
      await tester.pumpWidget(
        MaterialApp(
          home: BlocProvider(
            create: (context) => LoginCubit(),
            child: BlocListener<LoginCubit, LoginState>(
              listener: (context, state) {
                inputValue = state.passwordInput.value;
              },
              child: const LoginPage(),
            ),
          ),
        ),
      );
      await tester.enterText(passwordInput, '088');
      await tester.pump();

      expect(inputValue, '088');
    },
  );
  testWidgets(
    'input password should not show error message on start',
    (tester) async {
      await tester.pumpWidget(const MaterialApp(home: Login()));
      expect(find.text('password minimal 8 character'), findsNothing);
    },
  );
  testWidgets(
    'input password should show error message when has foccused Node',
    (tester) async {
      await tester.pumpWidget(const MaterialApp(home: Login()));
      await tester.tap(passwordInput);
      await tester.pump();
      expect(find.text('password minimal 8 character'), findsOneWidget);
    },
  );
  testWidgets(
    'input password should show password minimal 8 character when inputted character is less than 8',
    (tester) async {
      await tester.pumpWidget(const MaterialApp(home: Login()));
      await tester.enterText(passwordInput, '088');
      await tester.pump();

      expect(find.text('password minimal 8 character'), findsOneWidget);
    },
  );
  testWidgets(
    'input password should show not show error message when password inputted correctly',
    (tester) async {
      await tester.pumpWidget(const MaterialApp(home: Login()));
      await tester.enterText(passwordInput, '12345678');
      await tester.pump();

      expect(find.text('password minimal 8 character'), findsNothing);
    },
  );
  testWidgets(
    'input password should show error message when inputed uncorrectly and then not show error message when inputted correctly',
    (tester) async {
      await tester.pumpWidget(const MaterialApp(home: Login()));
      await tester.enterText(passwordInput, '088');
      await tester.pump();
      expect(find.text('password minimal 8 character'), findsOneWidget);

      await tester.enterText(passwordInput, '12345678');
      await tester.pump();
      expect(find.text('password minimal 8 character'), findsNothing);
    },
  );
}

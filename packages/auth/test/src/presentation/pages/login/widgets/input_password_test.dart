import 'package:common_dependency/common_dependency.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final passwordInput = find.byKey(const ValueKey('password input'));
  testWidgets(
    'input password should show password minimal 8 character',
    (tester) async {
      await tester.pumpWidget(const MaterialApp(home: Login()));
      await tester.enterText(passwordInput, '088');
      await tester.pump();

      expect(find.text('password minimal 8 character'), findsOneWidget);
    },
  );
}

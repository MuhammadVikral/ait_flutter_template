import 'package:common_dependency/common_dependency.dart';
import 'package:flutter/cupertino.dart';
import 'package:widgetbook/widgetbook.dart';

class LoginStory extends WidgetbookComponent {
  LoginStory(BuildContext context)
      : super(
          name: 'Login',
          useCases: [
            WidgetbookUseCase(
              name: 'Login Page',
              builder: (context) {
                return const Login();
              },
            ),
            WidgetbookUseCase(
              name: 'Login Page Dialog Error',
              builder: (context) {
                return const LoginDialogError();
              },
            )
          ],
        );
}

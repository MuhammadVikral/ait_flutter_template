library login;

import 'package:common_dependency/common_dependency.dart';
import 'package:flutter/material.dart';
export './cubit/login_cubit.dart';

part './widgets/username_input.dart';
part './widgets/login_button.dart';
part './widgets/input_password.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: const LoginPage(),
    );
  }
}

class LoginPage extends StatelessWidget {
  const LoginPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DesignText.h3(
              'Login',
            ).bold.bottomMargin(12),
            DesignText.body2('Welcome back! Let\'s login to your account')
                .bold
                .bottomMargin(32),
            const LoginUsernameInput().bottomMargin(24),
            const LoginPasswordInput().bottomMargin(40),
            const LoginButton().bottomMargin(16),
            Center(
              child: RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'Don’t have an account?   ',
                      style: DesignTextStyle.body2.copyWith(
                        color: DesignColors.neutral70,
                      ),
                    ),
                    TextSpan(
                      text: 'Register here',
                      style: DesignTextStyle.body2.copyWith(
                        color: DesignColors.primaryBase,
                        fontWeight: boldFont,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

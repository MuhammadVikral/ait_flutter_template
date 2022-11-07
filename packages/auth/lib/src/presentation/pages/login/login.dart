library login;

import 'package:auth/src/presentation/cubit/auth_cubit.dart';
import 'package:common_dependency/common_dependency.dart';
import 'package:flutter/material.dart';

part './widgets/username_input.dart';
part './widgets/login_button.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(),
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
    return Padding(
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
          DesignTextInput(
            hint: 'Password',
            showHint: false,
            suffixLabel: DesignText.body2('Forgot Password?')
                .bold
                .overideColor(DesignColors.primaryBase),
            suffixIcon: const Icon(Icons.remove_red_eye),
            alwaysShowLabel: true,
            initialText: '',
          ).bottomMargin(40),
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
    );
  }
}

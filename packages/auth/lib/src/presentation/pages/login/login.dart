import 'package:common_dependency/common_dependency.dart';
import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  const Login({super.key});

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
          const DesignTextInput(
            hint: 'Username / Email / Phone No.',
            showHint: false,
            alwaysShowLabel: true,
            initialText: '',
          ).bottomMargin(24),
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
          DesignButton(
            onTap: () {},
            height: 40,
            enabled: false,
            child: DesignText.body1('Login').bold.overideColor(
                  DesignColors.white,
                ),
          ).bottomMargin(16),
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
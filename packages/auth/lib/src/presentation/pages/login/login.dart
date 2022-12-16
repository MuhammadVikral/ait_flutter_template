library login;

import 'package:auth/src/domain/repositories/auth_navigation_repository.dart';
import 'package:auth/src/presentation/pages/login/cubit/login_cubit.dart';
import 'package:common_dependency/common_dependency.dart';
import 'package:flutter/material.dart';

export './cubit/login_cubit.dart';

part './widgets/input_password.dart';
part './widgets/login_button.dart';
part './widgets/login_error_dialog.dart';
part './widgets/username_input.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => di<LoginCubit>(),
      child: const LoginPage(
        key: Key('login page'),
      ),
    );
  }
}

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listenWhen: (previous, current) =>
          previous.formStatus == FormzStatus.submissionInProgress,
      listener: (context, state) {
        if (state.formStatus == FormzStatus.submissionSuccess) {
          di<AuthNavigationRepository>().navigateToHome(context);
        }
        if (state.formStatus == FormzStatus.submissionFailure) {
          showDialog(
            context: context,
            builder: (context) => const LoginDialogError(
              key: Key('error dialog login'),
            ),
          );
        }
      },
      child: Scaffold(
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
              const LoginPageForms(),
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
                        text: SharedStr.of(context).register_here,
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
      ),
    );
  }
}

class LoginPageForms extends StatefulWidget {
  const LoginPageForms({
    Key? key,
  }) : super(key: key);

  @override
  State<LoginPageForms> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPageForms> {
  final usernameFocusNode = FocusNode();
  final passwordFocusNode = FocusNode();
  @override
  void initState() {
    usernameFocusNode.addListener(
      () {
        if (!usernameFocusNode.hasFocus) {
          context.read<LoginCubit>().onUsernameLoseFocus();
        }
      },
    );
    passwordFocusNode.addListener(
      () {
        if (passwordFocusNode.hasFocus) {
          context.read<LoginCubit>().onPasswordGainFocus();
        }
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        LoginUsernameInput(
          focusNode: usernameFocusNode,
        ).bottomMargin(24),
        LoginPasswordInput(
          focusNode: passwordFocusNode,
        ).bottomMargin(40),
      ],
    );
  }
}

import 'package:common_dependency/common_dependency.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        Widget child = Container();
        switch (state.status) {
          case FormzStatus.submissionInProgress:
            child = LoadingScreen();
            break;
          case FormzStatus.submissionFailure:
            child = Scaffold(
              body: Center(
                child: DesignText.h1('error').bold,
              ),
            );
            break;
          case FormzStatus.submissionSuccess:
            child = Login();
            break;
          default:
            child = Container();
            break;
        }
        return child;
      },
    );
  }
}

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}

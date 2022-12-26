import 'package:auth/auth.dart';
import 'package:common_dependency/common_dependency.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Widget child = const LoadingScreen();
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        print(state);
        switch (state.status) {
          case FormzStatus.submissionInProgress:
            break;
          case FormzStatus.submissionFailure:
            showDialog(
              context: context,
              builder: (context) {
                return DesignDialog(
                  body: 'Terjadi kesalahan',
                  positiveButtonTitle: 'muat Ulang',
                  onPositive: () {},
                );
              },
            );
            break;
          case FormzStatus.submissionSuccess:
            if (state.loggedin == true) {
              di<AuthNavigationRepository>().navigateToHome(context);
            } else {
              di<AuthNavigationRepository>().navigateToLogin(context);
            }
            break;
          default:
            break;
        }
      },
      child: child,
    );
  }
}

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';

abstract class AuthNavigation {
  void navigateToLogin(BuildContext context);
  void navigateToHome(BuildContext context);
}

class AuthNavigationImpl implements AuthNavigation {
  @override
  void navigateToHome(BuildContext context) {
    context.go('/login');
  }

  @override
  void navigateToLogin(BuildContext context) {
    context.go('/home');
  }
}

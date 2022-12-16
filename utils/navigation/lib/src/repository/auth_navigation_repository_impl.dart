import 'package:auth/auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';

class AuthNavigationImpl implements AuthNavigationRepository {
  @override
  void navigateToHome(BuildContext context) {
    context.go('/home');
  }

  @override
  void navigateToLogin(BuildContext context) {
    context.go('/login');
  }
}

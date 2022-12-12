import 'package:common_dependency/common_dependency.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AuthRoutes extends GoRoute {
  AuthRoutes()
      : super(
          path: '/auth',
          builder: (context, state) => const SplashScreen(),
          routes: [
            GoRoute(
              path: 'login',
              builder: (context, state) => const Login(),
            ),
            GoRoute(
              path: 'home',
              builder: (context, state) => const Scaffold(
                body: Center(
                  child: Text("Home Page"),
                ),
              ),
            ),
          ],
        );
}

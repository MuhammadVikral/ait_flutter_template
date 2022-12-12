import 'package:go_router/go_router.dart';
import 'package:navigation/src/auth/auth_routes.dart';

class MainNavigation extends GoRouter {
  MainNavigation()
      : super(
          routes: [AuthRoutes()],
          initialLocation: '/auth/login',
          debugLogDiagnostics: true,
        );
}

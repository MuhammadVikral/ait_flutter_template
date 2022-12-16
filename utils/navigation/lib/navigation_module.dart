import 'package:auth/auth.dart';
import 'package:design_system/design_system.dart';
import 'package:navigation/src/repository/auth_navigation_repository_impl.dart';

class NavigationModule {
  Future<void> call() async {
    di.registerLazySingleton<AuthNavigationRepository>(
      () => AuthNavigationImpl(),
    );
  }
}

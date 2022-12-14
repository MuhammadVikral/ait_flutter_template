import 'package:auth/auth_module.dart';
import 'package:common_dependency/common_dependency.dart';

export 'package:dependency_injection/dependency_injection.dart';

class DependencyInjector {
  //util
  final ApiModule _apiModule = ApiModule();
  final CachingModule _cachingModule = CachingModule();
  final AppLocalizationModule _localizationModule = AppLocalizationModule();
  //package
  final AuthModule _authModule = AuthModule();

  Future<void> injectApp() async {
    await _apiModule();
    await _cachingModule();
    await _authModule();
    await _localizationModule();
  }
}

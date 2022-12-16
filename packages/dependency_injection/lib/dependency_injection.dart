import 'package:auth/auth_module.dart';
import 'package:common_dependency/common_dependency.dart';
import 'package:flutter/widgets.dart';
import 'package:navigation/navigation.dart';

export 'package:dependency_injection/dependency_injection.dart';

class DependencyInjector {
  //util
  final ApiModule _apiModule = ApiModule();
  final CachingModule _cachingModule = CachingModule();
  final AppLocalizationModule _localizationModule = AppLocalizationModule();
  final NavigationModule _navigationModule = NavigationModule();
  //package
  final AuthModule _authModule = AuthModule();

  Future<void> injectApp() async {
    await _apiModule();
    await _cachingModule();
    await _authModule();
    await _localizationModule();
    await _navigationModule();
  }

  List<LocalizationsDelegate> getTranslations() => [
        SharedStr.delegate,
      ];
}

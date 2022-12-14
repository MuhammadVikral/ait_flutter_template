import 'package:common_dependency/common_dependency.dart';
export 'package:dependency_injection/dependency_injection.dart';

class DependencyInjector {
  //util
  final ApiModule _apiModule = ApiModule();
  final CachingModule _cachingModule = CachingModule();
  //package
  final AuthModule _authModule = AuthModule();

  Future<void> injectApp() async {
    await _apiModule();
    await _cachingModule();
    await _authModule();
  }
}

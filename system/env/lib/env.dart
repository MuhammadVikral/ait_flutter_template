import 'package:envied/envied.dart';

part 'env.g.dart';

@Envied(path: 'lib/.env')
abstract class Env {
  const Env._();
  @EnviedField(varName: 'APP_KEY', obfuscate: true)
  static final appKey = _Env.appKey;
  @EnviedField(varName: 'APP_NAME', obfuscate: true)
  static final appName = _Env.appName;
  @EnviedField(varName: 'BASE_URL')
  static const baseUrl = _Env.baseUrl;
}

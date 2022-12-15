import 'package:env/env.dart';

class Config {
  const Config._();
  static const baseUrl = Env.baseUrl;
  static final appKey = Env.appKey;
  static final appName = Env.appName;
}

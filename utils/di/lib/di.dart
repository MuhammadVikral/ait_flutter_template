import 'package:di/src/api_module.dart';
import 'package:di/src/auth_module.dart';
import 'package:di/src/third_party_module.dart';
import 'package:get_it/get_it.dart';

final di = GetIt.I;

class MainDI {
  final ApiModule _apiModule = ApiModule();
  final ThirdPartyModule _thirdPartyModule = ThirdPartyModule();
  final AuthModule _authModule = AuthModule();
  Future<void> call() async {
    await _apiModule();
    await _thirdPartyModule();
    await _authModule();
  }
}

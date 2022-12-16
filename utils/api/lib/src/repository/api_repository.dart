import 'package:api/src/model/response_model.dart';
import 'package:design_system/design_system.dart';

abstract class ApiRepository {
  Future<T> setData<T>({
    required String endpoint,
    JSON? data,
    bool requiresAuthToken = false,
    bool requiresRefreshToken = false,
    required T Function(ResponseModel response) converter,
  });
  Future<T> getData<T>({
    required String endpoint,
    bool requiresAuthToken = false,
    bool requiresRefreshToken = false,
    required T Function(ResponseModel response) converter,
  });
}

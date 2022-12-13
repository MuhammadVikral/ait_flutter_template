import 'package:api/api.dart';
import 'package:api/src/data/data_source/dio_service.dart';
import 'package:design_system/design_system.dart';
import 'package:dio/dio.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

class ApiRepositoyImpl implements ApiRepository {
  final DioService dioService;
  final InternetConnectionChecker connectionChecker;

  ApiRepositoyImpl({
    required this.dioService,
    required this.connectionChecker,
  });

  @override
  Future<bool> get isConnected async => await connectionChecker.hasConnection;

  @override
  Future<T> setData<T>({
    required String endpoint,
    JSON? data,
    bool requiresAuthToken = false,
    bool requiresRefreshToken = false,
    required T Function(ResponseModel response) converter,
  }) async {
    ResponseModel response;

    try {
      // Entire map of response
      response = await dioService.post<JSON>(
        endpoint: endpoint,
        data: data,
        options: Options(
          extra: <String, Object?>{
            'requiresAuthToken': requiresAuthToken,
            'requiresRefreshToken': requiresRefreshToken,
          },
        ),
      );
    } on Exception catch (ex) {
      throw CustomException.fromDioException(ex);
    }
    try {
      // Returning the serialized object
      return converter(response);
    } on Exception catch (ex) {
      throw CustomException.fromParsingException(ex);
    }
  }
}

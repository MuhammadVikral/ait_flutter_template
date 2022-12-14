import 'package:api/src/data/custom_exception.dart';
import 'package:api/src/data/dio_service.dart';
import 'package:api/src/model/response_model.dart';
import 'package:api/src/repository/api_repository.dart';
import 'package:design_system/design_system.dart';
import 'package:dio/dio.dart';

class ApiRepositoryImpl implements ApiRepository {
  final DioService dioService;

  ApiRepositoryImpl(this.dioService);

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

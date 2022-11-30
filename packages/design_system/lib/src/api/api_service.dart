import 'package:common_dependency/common_dependency.dart';

class ApiService {
  final DioService dioService;

  ApiService(this.dioService);

  Future<T> setData<T>({
    required String endpoint,
    required JSON data,
    bool requiresAuthToken = false,
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

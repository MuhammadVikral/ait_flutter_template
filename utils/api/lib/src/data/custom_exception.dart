// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: constant_identifier_names, library_private_types_in_public_api
import 'package:common_dependency/common_dependency.dart';
import 'package:flutter/foundation.dart';

/// An enum that holds names for our custom exceptions.
enum _ExceptionType {
  /// The exception for an expired bearer token.
  TokenExpiredException,
  Unauthorized,

  /// The exception for a prematurely cancelled request.
  CancelException,

  /// The exception for a failed connection attempt.
  ConnectTimeoutException,

  /// The exception for failing to send a request.
  SendTimeoutException,

  /// The exception for failing to receive a response.
  ReceiveTimeoutException,

  /// The exception for no internet connectivity.
  SocketException,

  /// A better name for the socket exception.
  FetchDataException,

  /// The exception for an incorrect parameter in a request/response.
  FormatException,

  /// The exception for an unknown type of failure.
  UnrecognizedException,

  /// The exception for an unknown exception from the api.
  ApiException,

  /// The exception for any parsing failure encountered during
  /// serialization/deserialization of a request.
  SerializationException,
}

class CustomException extends Equatable implements Exception {
  final String name, message;
  final String? code;
  final int? statusCode;
  final Failure failure;
  final _ExceptionType exceptionType;

  CustomException({
    this.code,
    int? statusCode,
    required this.message,
    Failure? failureType,
    this.exceptionType = _ExceptionType.ApiException,
  })  : statusCode = statusCode ?? 500,
        name = exceptionType.name,
        failure = failureType ?? UnRecognizedFailure();

  factory CustomException.fromDioException(Exception error) {
    try {
      if (error is DioError) {
        switch (error.type) {
          case DioErrorType.cancel:
            return CustomException(
              exceptionType: _ExceptionType.CancelException,
              statusCode: error.response?.statusCode,
              message: 'Request cancelled prematurely',
            );
          case DioErrorType.connectTimeout:
            return CustomException(
              exceptionType: _ExceptionType.ConnectTimeoutException,
              statusCode: error.response?.statusCode,
              message: 'Connection not established',
              failureType: NetworkFailure(),
            );
          case DioErrorType.sendTimeout:
            return CustomException(
              exceptionType: _ExceptionType.SendTimeoutException,
              statusCode: error.response?.statusCode,
              message: 'Failed to send',
              failureType: NetworkFailure(),
            );
          case DioErrorType.receiveTimeout:
            return CustomException(
              exceptionType: _ExceptionType.ReceiveTimeoutException,
              statusCode: error.response?.statusCode,
              message: 'Failed to receive',
              failureType: NetworkFailure(),
            );
          case DioErrorType.response:
            if (error.response?.statusCode == 401) {
              return CustomException(
                exceptionType: _ExceptionType.Unauthorized,
                statusCode: error.response?.statusCode,
                message: 'Unauthorized user',
                failureType: UnAuthorizedFailure(),
              );
            } else {
              return CustomException(
                exceptionType: _ExceptionType.Unauthorized,
                statusCode: error.response?.statusCode,
                message: 'Unauthorized user',
                failureType: UnAuthorizedFailure(),
              );
            }
          case DioErrorType.other:
            if (error.message.contains(_ExceptionType.SocketException.name)) {
              return CustomException(
                exceptionType: _ExceptionType.FetchDataException,
                statusCode: error.response?.statusCode,
                message: 'No internet connectivity',
                failureType: NetworkFailure(),
              );
            }
            if (error.response?.statusCode == null) {
              return CustomException(
                exceptionType: _ExceptionType.UnrecognizedException,
                statusCode: error.response?.statusCode,
                message: error.response?.statusMessage ?? 'Unknown',
                failureType: UnRecognizedFailure(),
              );
            }
            final name = error.response?.data['meta']['code'] as int;
            final message = error.response?.data['meta']['message'] as String;
            if (message == _ExceptionType.TokenExpiredException.name) {
              return CustomException(
                exceptionType: _ExceptionType.TokenExpiredException,
                code: name.toString(),
                statusCode: error.response?.statusCode,
                message: message,
                failureType: UnAuthorizedFailure(),
              );
            }
            if (message == 'Unauthorized.') {
              return CustomException(
                exceptionType: _ExceptionType.Unauthorized,
                statusCode: error.response?.statusCode,
                message: 'Unauthorized user',
                failureType: UnAuthorizedFailure(),
              );
            }
            return CustomException(
              message: message,
              code: name.toString(),
              statusCode: error.response?.statusCode,
            );
        }
      } else {
        return CustomException(
          exceptionType: _ExceptionType.UnrecognizedException,
          message: 'Error unrecognized',
        );
      }
    } on FormatException catch (e) {
      return CustomException(
        exceptionType: _ExceptionType.FormatException,
        message: e.message,
        failureType: FormatFailure(),
      );
    } on Exception catch (_) {
      return CustomException(
        exceptionType: _ExceptionType.UnrecognizedException,
        message: 'Error unrecognized',
      );
    }
  }

  factory CustomException.fromParsingException(Exception error) {
    debugPrint('$error');
    return CustomException(
      exceptionType: _ExceptionType.SerializationException,
      message: 'Failed to parse network response to model or vice versa',
    );
  }

  @override
  List<Object> get props => [exceptionType, message];

  @override
  bool get stringify => true;
}

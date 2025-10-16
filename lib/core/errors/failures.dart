import 'package:dio/dio.dart';

abstract class Failure {
  final String errMessage;

  Failure({required this.errMessage});
}

class ServerFailure extends Failure {
  ServerFailure({required super.errMessage});

  factory ServerFailure.fromDioError(DioException dioError) {
    switch (dioError.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure(errMessage: 'Connection timeout with API');
      case DioExceptionType.sendTimeout:
        return ServerFailure(errMessage: 'Send timeout with API');
      case DioExceptionType.receiveTimeout:
        return ServerFailure(errMessage: 'Receive timeout with API');
      case DioExceptionType.badCertificate:
        return ServerFailure(errMessage: 'Bad certificate from API');
      case DioExceptionType.badResponse:
        return ServerFailure.fromBadResponse(
          dioError.response?.statusCode,
          dioError.response?.data,
        );
      case DioExceptionType.cancel:
        return ServerFailure(errMessage: 'Request to API was cancelled');
      case DioExceptionType.connectionError:
        return ServerFailure(
          errMessage: '(No internet) Connection error with API',
        );
      case DioExceptionType.unknown:
        return ServerFailure(
          errMessage:
              'Unexpected error, check your internet or try again later',
        );
    }
  }
  factory ServerFailure.fromBadResponse(int? statusCode, dynamic data) {
    if (statusCode == 400) {
      return ServerFailure(errMessage: 'Bad request');
    } else if (statusCode == 401) {
      return ServerFailure(errMessage: 'Unauthorized');
    } else if (statusCode == 403) {
      return ServerFailure(errMessage: 'Forbidden');
    } else if (statusCode == 404) {
      return ServerFailure(errMessage: 'Not Found');
    } else if (statusCode == 500) {
      return ServerFailure(errMessage: 'Internal Server Error');
    } else {
      return ServerFailure(
        errMessage: 'Oops, something went wrong (code: $statusCode)',
      );
    }
  }
}

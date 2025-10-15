import 'package:dio/dio.dart';

abstract class Failure {
  final String message;
  Failure({required this.message});
}

class ServerFailures extends Failure {
  ServerFailures({required super.message});

  factory ServerFailures.fromDioError(DioException error) {
    switch (error.type) {
      case DioExceptionType.badResponse:
        final statusCode = error.response?.statusCode;
        final errorData = error.response?.data;

        String? serverMessage;
        if (errorData is Map<String, dynamic>) {
          if (errorData['error'] is String) {
            serverMessage = errorData['error'];
          } else if (errorData['message'] is String) {
            serverMessage = errorData['message'];
          }
        }

        if (statusCode != null) {
          return ServerFailures.fromResponse(
            statusCode,
            serverMessage ?? errorData,
          );
        }

        return ServerFailures(message: serverMessage ?? 'Something went wrong');

      case DioExceptionType.cancel:
        return ServerFailures(message: 'Request to API server was cancelled');

      case DioExceptionType.connectionTimeout:
        return ServerFailures(message: 'Connection timeout with API server');

      case DioExceptionType.receiveTimeout:
        return ServerFailures(
          message: 'Receive timeout in connection with API server',
        );

      case DioExceptionType.sendTimeout:
        return ServerFailures(
          message: 'Send timeout in connection with API server',
        );

      case DioExceptionType.connectionError:
        return ServerFailures(message: 'Connection error with API server');

      case DioExceptionType.unknown:
        if (error.message?.contains('SocketException') ?? false) {
          return ServerFailures(message: 'No internet connection');
        }
        return ServerFailures(message: 'Unexpected error occurred');

      default:
        return ServerFailures(message: 'Oops something went wrong');
    }
  }

  factory ServerFailures.fromResponse(int statusCode, dynamic response) {
    if (response is String && response.isNotEmpty) {
      return ServerFailures(message: response);
    }
    if (response is Map<String, dynamic>) {
      if (response['error'] is String) {
        return ServerFailures(message: response['error']);
      }
      if (response['message'] is String) {
        return ServerFailures(message: response['message']);
      }
    }

    switch (statusCode) {
      case 400:
        return ServerFailures(
          message: "Bad Request: The server could not understand your request.",
        );
      case 401:
        return ServerFailures(
          message:
              "Unauthorized: Please check your authentication credentials.",
        );
      case 403:
        return ServerFailures(
          message:
              "Forbidden: You do not have permission to access this resource.",
        );
      case 404:
        return ServerFailures(
          message: "Not Found: The requested resource could not be found.",
        );
      case 500:
        return ServerFailures(
          message: "Internal Server Error: Something went wrong on the server.",
        );
      default:
        return ServerFailures(
          message: "Unexpected Error: Status code $statusCode.",
        );
    }
  }
}

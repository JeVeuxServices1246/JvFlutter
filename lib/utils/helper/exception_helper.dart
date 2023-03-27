import 'package:dio/dio.dart';
import 'package:get/get.dart';

class APIException implements Exception {
  final String message;

  APIException({required this.message});
}

class ExceptionHandler {
  ExceptionHandler._privateConstructor();

  static APIException handleError(Exception error) {
    if (error is DioError) {
      switch (error.type) {
        case DioErrorType.sendTimeout:
          return APIException(message: "No Internet");
        case DioErrorType.connectionTimeout:
          return APIException(message: "Connection Timeout");
        case DioErrorType.badResponse:
          print(error.error);
          return APIException(
              message: ErrorResponse.fromJson(error.response?.data).message);
        default:
          return APIException(
              message: "Something went wrong. Please try again later.");
      }
    } else {
      return APIException(
          message: "Something went wrong. Please try again later.");
    }
  }
}

class ErrorResponse {
  late String message;

  ErrorResponse({required this.message});

  ErrorResponse.fromJson(String? json) {
    message = json ?? "";
  }

  String toJson() {
    message = message;
    return message;
  }
}

class HandleError {
  HandleError._privateConstructor();

  static handleError(APIException? error) {
    Get.rawSnackbar(
        message:
            error?.message ?? "Something went wrong. Please try again later.");
  }
}

import 'package:dio/dio.dart';
import 'package:movies_app/data/network/faliure.dart';

class ErrorHandler implements Exception {
  late Failure failure;

  ErrorHandler.handle(dynamic error) {
    if (error is DioError) {
      failure = _handleError(error);
    } else {
      // default error
      failure = DataMessage.defalut.getFailure();
    }
  }
}

Failure _handleError(DioError error) {
  switch (error.type) {
    case DioErrorType.connectTimeout:
      return DataMessage.connectTimeout.getFailure();
    case DioErrorType.sendTimeout:
      return DataMessage.sendTimeout.getFailure();
    case DioErrorType.receiveTimeout:
      return DataMessage.reciveTimeout.getFailure();
    case DioErrorType.response:
      if (error.response != null &&
          error.response?.statusCode != null &&
          error.response?.statusMessage != null) {
        return Failure(error.response?.statusCode ?? 0,
            error.response?.statusMessage ?? "");
      } else {
        return DataMessage.defalut.getFailure();
      }
      case DioErrorType.cancel:
      return DataMessage.cancel.getFailure();
    case DioErrorType.other:
      return DataMessage.defalut.getFailure();
  }
}

enum DataMessage {
  success,
  noContent,
  badRequest,
  forbidden,
  unAuthroized,
  notFound,
  internalServerError,
  connectTimeout,
  cancel,
  reciveTimeout,
  sendTimeout,
  cacheError,
  noInternetConnection,
  defalut
}

extension DataMessageExtension on DataMessage {
  Failure getFailure() {
    switch (this) {
      case DataMessage.success:
        return Failure(ResponseCode.success, ResponseMessage.success);
      case DataMessage.noContent:
        return Failure(ResponseCode.noContent, ResponseMessage.noContent);
      case DataMessage.badRequest:
        return Failure(ResponseCode.badRequest, ResponseMessage.badRequest);
      case DataMessage.forbidden:
        return Failure(ResponseCode.forbidden, ResponseMessage.forbidden);
      case DataMessage.unAuthroized:
        return Failure(ResponseCode.unAuthroized, ResponseMessage.unAuthroized);
      case DataMessage.notFound:
        return Failure(ResponseCode.notFound, ResponseMessage.notFound);
      case DataMessage.internalServerError:
        return Failure(ResponseCode.internalServerError,
            ResponseMessage.internalServerError);
      case DataMessage.connectTimeout:
        return Failure(
            ResponseCode.connectTimeout, ResponseMessage.connectTimeout);
      case DataMessage.cancel:
        return Failure(ResponseCode.cancel, ResponseMessage.cancel);
      case DataMessage.reciveTimeout:
        return Failure(
            ResponseCode.reciveTimeout, ResponseMessage.reciveTimeout);
      case DataMessage.sendTimeout:
        return Failure(ResponseCode.sendTimeout, ResponseMessage.sendTimeout);
      case DataMessage.cacheError:
        return Failure(ResponseCode.cacheError, ResponseMessage.cacheError);
      case DataMessage.noInternetConnection:
        return Failure(ResponseCode.noInternetConnection,
            ResponseMessage.noInternetConnection);
      case DataMessage.defalut:
        return Failure(ResponseCode.defalut, ResponseMessage.defalut);
    }
  }
}

class ResponseCode {
  static const int success = 200; // success with data
  static const int noContent = 201; // success with no data (no content)
  static const int badRequest = 400; // failure, API rejected request
  static const int unAuthroized = 401; // failure, user is not authorised
  static const int forbidden = 403; //  failure, API rejected request
  static const int internalServerError = 500; // failure, crash in server side
  static const int notFound = 404; // failure, not found

  // local status code
  static const int connectTimeout = -1;
  static const int cancel = -2;
  static const int reciveTimeout = -3;
  static const int sendTimeout = -4;
  static const int cacheError = -5;
  static const int noInternetConnection = -6;
  static const int defalut = -7;
}

class AppInternalCode {
  static const int success = 0;
  static const int error = 1;
}

class ResponseMessage {
  static const String success = "success"; // success with data
  static const String noContent =
      "success"; // success with no data (no content)
  static const String badRequest =
      "Bad request, Try again later"; // failure, API rejected request
  static const String unAuthroized =
      "User is unauthorised, Try again later"; // failure, user is not authorised
  static const String forbidden =
      "Forbidden request, Try again later"; //  failure, API rejected request
  static const String internalServerError =
      "Some thing went wrong, Try again later"; // failure, crash in server side
  static const String notFound =
      "Some thing went wrong, Try again later"; // failure, crash in server side

  // local status code
  static const String connectTimeout = "Time out error, Try again later";
  static const String cancel = "Request was cancelled, Try again later";
  static const String reciveTimeout = "Time out error, Try again later";
  static const String sendTimeout = "Time out error, Try again later";
  static const String cacheError = "Cache error, Try again later";
  static const String noInternetConnection =
      "Please check your internet connection";
  static const String defalut = "Some thing went wrong, Try again later";
}

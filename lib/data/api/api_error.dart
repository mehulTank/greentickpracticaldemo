part of 'api_service.dart';

//created on 25/09/2021
//purpose : server validations messages based on response code
class APIConstError {
  static String kSomethingWentWrong = 'Something went wrong.';
  static String kNoInternetConnection = 'No internet connection.';
  static String kNoInternetConnection2 =
      'Connection to API server failed due to internet connection';
  static String kInternalServerError = 'Internal Server Error';
  static String kSendTimeOUT = 'Send timeout in connection with API server';
  static String kReceiveTimeOut =
      'Receive timeout in connection with API server';
  static String kTimeOut = 'Connection timeout with API server';
  static String kCancelled = 'Request to API server was cancelled';
  static String errorLoginFailed = 'Login Failed';

  static String kInvalidStatusCode({required int statusCode}) =>
      'Received invalid status code: $statusCode';
}

//created on 25/09/2021
//purpose : base error model
class ErrorModel {
  ErrorModel({
    this.requestId,
    this.errors,
  });

  String? requestId;
  List<Error>? errors;

  ErrorModel.fromJson(Map<String, dynamic> json) {
    requestId = json["requestId"];
    errors = [];
    json["errors"].forEach((v) {
      errors
          ?.add(Error(code: v['code'], message: v['message'], type: v['type']));
    });
  }

  Map<String, dynamic> toJson() => {
        "requestId": requestId,
        "errors": List<dynamic>.from(errors!.map((x) => x.toJson())),
      };
}

class Error {
  Error({
    this.code,
    this.message,
    this.type,
  });

  String? code;
  String? message;
  String? type;

  Error.fromJson(Map<String, dynamic> json) {
    this.code = json["code"];
    message = json["message"];
    type = json["type"];
  }

  Map<String, dynamic> toJson() => {
        "code": code,
        "message": message,
        "type": type,
      };
}

//created on 25/09/2021
//purpose : error handler for apis
class ErrorHandler {
  static var instance = ErrorHandler();

  String _getDioError(DioError error) {
    switch (error.type) {
      case DioErrorType.cancel:
        return APIConstError.kCancelled;
        break;
      case DioErrorType.connectTimeout:
        return APIConstError.kTimeOut;
        break;
      case DioErrorType.other:
        return APIConstError.kNoInternetConnection2;
        break;
      case DioErrorType.receiveTimeout:
        return APIConstError.kReceiveTimeOut;
        break;
      case DioErrorType.response:
        return APIConstError.kInvalidStatusCode(
            statusCode: error.response!.statusCode!);
        break;
      case DioErrorType.sendTimeout:
        return APIConstError.kSendTimeOUT;
        break;
      default:
        return APIConstError.kSomethingWentWrong;
        break;
    }
  }

  String _getErrorIfNullOrNotDioError(int code) {
    switch (code) {
      case 500:
        return APIConstError.kInternalServerError;
        break;
      case 1:
        return APIConstError.kNoInternetConnection;
        break;
      default:
        return APIConstError.kSomethingWentWrong;
        break;
    }
  }

  String getFinalError({dynamic error, int? code}) {
    if (error != null) {
      if (error is DioError) {
        return _getDioError(error);
      } else {
        return _getErrorIfNullOrNotDioError(code!);
      }
    }
    return _getErrorIfNullOrNotDioError(code!);
  }
}

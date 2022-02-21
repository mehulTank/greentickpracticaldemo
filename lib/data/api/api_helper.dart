part of 'api_service.dart';

//created on 25/09/2021
//purpose : enum class for api types
enum MethodType {
  GET,
  POST,
  PATCH,
  PUT,
  DELETE,
}

class APIException implements Exception {
  final String? _message;

  APIException(this._message);

  String toString() {
    return "$_message";
  }
}

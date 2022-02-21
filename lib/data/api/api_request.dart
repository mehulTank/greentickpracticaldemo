part of 'api_service.dart';

//created on 25/09/2021
//purpose : base api request class
class APIRequest {
  APIRequest({
    this.file,
    this.url,
    this.methodType,
    this.params,
    this.queryParams,
  });

  File? file;
  String? url;
  MethodType? methodType;
  Map<String, dynamic>? params;
  Map<String, dynamic>? queryParams;

  String toStringData() {
    return 'URL: $url, MethodType: $methodType, Param: $params, QueryParam: $queryParams';
  }
}

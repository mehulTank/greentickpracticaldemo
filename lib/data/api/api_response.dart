part of 'api_service.dart';

//created on 25/09/2021
//purpose : base api response class
class APIResponse {
  APIResponse({this.error, this.data, this.hasError});

  ErrorModel? error;
  dynamic data;
  bool? hasError;

  factory APIResponse.construct({dynamic error, dynamic data, int? code}) {
    if (code != null && (code == 200 || code == 204 || code == 202)) {
      return APIResponse(data: data, hasError: false);
    } else {
      var errorData;
      try {
        errorData = ErrorModel.fromJson(data);
        UtilityHelper.showLog(
            'error message', '${errorData.errors![0].message!}');
      } catch (e) {
        errorData = ErrorModel(errors: [
          Error(
            code: code?.toString() ?? '00',
            message: "Something Went Wrong",
          )
        ]);
      }
      return APIResponse(data: data, error: errorData, hasError: true);
    }
  }
}

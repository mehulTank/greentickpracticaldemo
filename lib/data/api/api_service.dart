import 'dart:io';



import 'package:dio/dio.dart';
import 'package:greentickpracticaldemo/logger/logger.dart';
import 'package:http_parser/http_parser.dart';

import '../../../utils/helpers/folder_utils.dart';
import '../../../utils/helpers/utility_helper.dart';
import 'package:greentickpracticaldemo/utils/helpers/globals.dart' as globals;
part 'api_error.dart';
part 'api_helper.dart';
part 'api_request.dart';
part 'api_response.dart';

//created on 25/09/2021
//purpose : api service provide to call apis
class APIService {
  String TAG = 'APIService';
  int _statusCodeNoInternet = 1;
  int _statusCodeEmptyResponse = 2;

  Map<String, String> headers = {
    'Accept': 'application/json',
    'Content-Type': 'application/json',
    'auth-type': 'Web',
  };

  Future<MultipartFile> _getMultipartFile(File file) async {
    UtilityHelper.showLog('filePath', file.path);
    String key;
    String type = FolderUtils().getFileName(file.path);
    type = type.split('.')[1];
    if (type == 'pdf') {
      key = 'application';
    } else {
      key = 'image';
    }
    return await MultipartFile.fromFile(file.path,
        contentType: MediaType(key, type));
  }

  Future<Response<dynamic>?> _getResponse(
      {APIRequest? request,
      FormData? formData,
      ResponseType? responseType}) async {
    switch (request!.methodType!) {
      case MethodType.GET:
        if (request.url!.contains('background/status') &&
            (globals.mimeType.contains('text/csv') ||
                globals.mimeType.contains(
                    'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet'))) {
          headers['export-content-type'] = globals.mimeType;
        }
        print("-------------------");
        print(headers);
        return await Dio().get(request.url!,
            options: Options(headers: headers, responseType: responseType),
            queryParameters: request.queryParams);
      case MethodType.POST:
        return await Dio().post(
          request.url!,
          options: Options(headers: headers, responseType: responseType),
          data: formData != null ? formData : request.params,
          queryParameters: request.queryParams,
        );
      case MethodType.PATCH:
        return await Dio().patch(request.url!,
            options: Options(headers: headers, responseType: responseType),
            data: formData != null ? formData : request.params,
            queryParameters: request.queryParams);
      case MethodType.PUT:
        return await Dio().put(request.url!,
            options: Options(headers: headers, responseType: responseType),
            data: formData != null ? formData : request.params,
            queryParameters: request.queryParams);
      case MethodType.DELETE:
        return await Dio().delete(request.url!,
            options: Options(headers: headers, responseType: responseType),
            data: formData != null ? formData : request.params,
            queryParameters: request.queryParams);
    }
  }

  Future<APIResponse> _authorizeTheUser() {
    final request = APIRequest(
        methodType: MethodType.POST,
        url: 'Url pass here',
        params: <String, dynamic>{'token': '1234'});
    return callService(request);
  }

  Future<APIResponse> callService(APIRequest request,
      {ResponseType? responseType}) async {
    try {
      if (await UtilityHelper.checkInternet()) {
        FormData? formData;
        if (request.file != null) {
          formData = FormData.fromMap(request.params!);
          formData.files.add(MapEntry<String, MultipartFile>(
              'File', await _getMultipartFile(request.file!)));
        }
        request.params?.removeWhere((key, value) {
          if (value == null) return true;
          if (value is String && value == '') return true;
          if (value is List && value.length <= 0) return true;
          if (value is List && value.length == 1) {
            if (value[0] == null || value[0] == '') {
              return true;
            }
          }
          return false;
        });

        Logger.d(TAG, 'Request : ${request.toStringData()}');
        Response<dynamic>? response = await _getResponse(
            request: request, formData: formData, responseType: responseType);
        Logger.d(TAG, 'Response:  ${response!.data.toString()}');

        if (response != null) {
          final int statusCode = response.statusCode!;
          switch (statusCode) {
            case 200:
            case 204:
            case 202:
              return APIResponse.construct(
                  code: response.statusCode, data: response.data);
            case 401:
              //need to implement code for token auth
              // return _authorizeTheUser();
              // logout or again api call for token
              break;
            default:
              return APIResponse.construct(code: response.statusCode);
          }
        }
        return APIResponse.construct(code: _statusCodeEmptyResponse);
      } else {
        return APIResponse.construct(code: _statusCodeNoInternet);
      }
    } on DioError catch (e) {
      if (e.response?.statusCode == 401) {

      }

      return (e.response != null)
          ? APIResponse.construct(
              data: e.response!.data, error: e.response!.statusCode)
          : APIResponse.construct(error: e);
    } catch (e) {
      return APIResponse.construct(
        code: _statusCodeEmptyResponse,
      );
    }
  }
}

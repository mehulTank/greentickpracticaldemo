
import 'package:greentickpracticaldemo/data/api/api_service.dart';
import 'package:greentickpracticaldemo/data/cache/cache_manager.dart';
import 'package:greentickpracticaldemo/data/model/request_model/get_product_list_request_model.dart';
import 'package:greentickpracticaldemo/data/model/response_model/get_product_list_response.dart';
import 'package:greentickpracticaldemo/logger/logger.dart';
import 'package:greentickpracticaldemo/utils/constants/app_constant.dart';



//created on 27/09/2021
//purpose : api calling methods to be stored here
class ProductListRepository {
  final APIService apiService;
  final CacheManager cacheManager;

  ProductListRepository(
      {required this.apiService, required this.cacheManager});

  Future<dynamic> getProductList({required GetProductListRequest param}) async {
    final apiRequest = APIRequest(
        params: param.toJson(),
        methodType: MethodType.POST,
        url: AppConst.apiPath.productList);
    final response = await apiService.callService(apiRequest);
    Logger.d('Response', 'Response:  ${response.data?.toString()}');

    if (!response.hasError!) {
      return GetProductListResponseModel.fromJson(response.data);
    } else {
      throw APIException(response.error!.errors![0].message);
    }

  }

}

import 'package:greentickpracticaldemo/logger/logger.dart';

class GetProductListRequest {
  GetProductListRequest();

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    Logger.d("CreateEInVoiceRequest", data.toString());
    return data;
  }
}

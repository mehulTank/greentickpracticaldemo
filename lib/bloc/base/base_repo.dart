
import 'package:greentickpracticaldemo/data/api/api_service.dart';
import 'package:greentickpracticaldemo/service/service_locator.dart';

///created on 25/09/2021
///purpose : base repo access to other repository classes
class BaseRepository {
  final apiService = locator<APIService>();

}

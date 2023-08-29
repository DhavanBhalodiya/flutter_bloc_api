import 'package:flutter_bloc_api/data/api/api_response.dart';
import '../model/model.dart';


abstract class AppRepository {
  Future<ApiResponse<AppListResponse>>? getTopFreeApps();

  Future<ApiResponse<AppDetailsResponse>>? getAppDetails(String appId);
}

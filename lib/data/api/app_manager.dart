import 'package:flutter_bloc_api/data/api/api_response.dart';
import 'api.dart';
import '../model/model.dart';

class AppManager implements AppRepository {

   @override
   Future<ApiResponse<AppListResponse>>? getTopFreeApps() async {
     return await ApiService.getApiHelper(apiEndPoint: ApiConstants.topFree, responseParser: AppListResponse.fromJson);
  }

  @override
  Future<ApiResponse<AppDetailsResponse>>? getAppDetails(String appId) async {
    return await ApiService.getApiHelper(
      baseUrl: ApiConstants.iTunesaseUrl,
        apiEndPoint: appId, responseParser: AppDetailsResponse.fromJson);
  }
}

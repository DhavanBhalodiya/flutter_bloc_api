import 'api.dart';
import '../model/model.dart';

class AppManager implements AppRepository {
  @override
  Future<AppListResponse>? getTopFreeApps() async {
    return await ApiService.getApiRequest(
        apiEndPoint: ApiConstants.topFree,
        responseParser: AppListResponse.fromJson);
  }

  @override
  Future<AppDetailsResponse>? getAppDetails(String appId) async {
    return await ApiService.getApiRequest(
      baseUrl: ApiConstants.iTunesaseUrl,
        apiEndPoint: appId, responseParser: AppDetailsResponse.fromJson);
  }
}

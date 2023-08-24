import '../model/model.dart';


abstract class AppRepository {
  Future<AppListResponse>? getTopFreeApps();

  Future<AppDetailsResponse>? getAppDetails(String appId);
}

import 'package:flutter_bloc_api/data/api/api.dart';
import 'package:flutter_bloc_api/di/navigation_service.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void getItsetUp() {
  getIt.registerLazySingleton(() => NavigationService());
  getIt.registerSingleton<AppRepository>(AppManager());
}

final getAppRepository = getIt.get<AppRepository>();
final BuildContext getContext =
    getIt<NavigationService>().globalKey.currentContext!;
final getNavigation = getIt<NavigationService>();

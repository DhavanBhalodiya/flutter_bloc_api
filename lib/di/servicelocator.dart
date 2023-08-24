
import 'package:flutter_bloc_api/data/api/api.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void getItsetUp() {
  getIt.registerSingleton<AppRepository>(AppManager());
}

final getAppRepository = getIt.get<AppRepository>();

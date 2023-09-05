



import 'package:flutter_bloc_api/data/api/api.dart';

extension DeviceUtils on BoxConstraints{
  bool get isTablet=>maxWidth>730;
  bool get isDesktop=>maxWidth>1200;
  bool get isMobile=>!isTablet && !isDesktop;
}
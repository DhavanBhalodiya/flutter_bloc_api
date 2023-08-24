import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class AppColor {
  static var isDarkMode =
      SchedulerBinding.instance.window.platformBrightness == Brightness.dark;

  static Color get colorRed => const Color(0xFFDF3545);
  static Color get textColor => Color(isDarkMode ? 0xFFFFFFFF : 0xFF0D1321);
  static Color get hintColor => const Color(0xFFC6C6C6);
  static Color get whiteColor => Color(isDarkMode ? 0xFF000000 : 0xFFFFFFFF);
  static Color get borderColor => const Color(0xFFE5E5E5);
}

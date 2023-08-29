import 'package:flutter_bloc_api/data/api/api.dart';
import 'package:flutter_bloc_api/di/servicelocator.dart';
import 'package:flutter_bloc_api/utils/colors.dart';

class Utils {
  static showSnackBar({String? message, bool isError = true}) {
    ScaffoldMessenger.of(getContext)
      ..hideCurrentSnackBar()
      ..showSnackBar(SnackBar(
          backgroundColor: isError ? AppColor.colorRed : Colors.green,
          behavior: SnackBarBehavior.floating,
          content: Text(message ?? '')));
  }

  static hideKeyboadr() {
    FocusManager.instance.primaryFocus?.unfocus();
  }
}
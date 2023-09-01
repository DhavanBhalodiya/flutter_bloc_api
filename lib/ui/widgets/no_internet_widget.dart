import 'package:flutter/material.dart';
import 'package:flutter_bloc_api/theme/theme.dart';
import 'package:flutter_bloc_api/utils/app_image.dart';
import 'package:flutter_bloc_api/utils/colors.dart';

Widget noInternetWidget(VoidCallback onTryagainClick) {
  return SizedBox(
    width: double.infinity,
    height: double.infinity,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset(AppImagePath.noInternet, height: 200),
        const SizedBox(height: 24),
        Text("Oops...", style: headerTextStyle.copyWith(fontSize: 28)),
        const SizedBox(height: 6),
        Text(
            "There is connection error. \nPlease check your internet and try again.",
            style: textStyle,
            textAlign: TextAlign.center),
        const SizedBox(height: 24),
        ElevatedButton(
          onPressed: () => onTryagainClick.call(),
          style: ElevatedButton.styleFrom(
              textStyle: buttonTextStyle,
              backgroundColor: AppColor.colorRed,
              foregroundColor: AppColor.whiteColor,
              padding: const EdgeInsets.symmetric(horizontal: 30),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10))),
          child: const Text("Try Again"),
        )
      ],
    ),
  );
}

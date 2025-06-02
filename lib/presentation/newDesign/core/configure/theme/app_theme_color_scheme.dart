import 'package:essmohr/presentation/newDesign/core/utils/app_color.dart';
import 'package:flutter/material.dart';

class AppThemeColorScheme {
  static ColorScheme lightColorScheme() => ColorScheme(
    brightness: Brightness.light,

    primary: AppColor.primary,
    onPrimary: AppColor.oceanBlue,

    secondary: AppColor.cloudMist,
    onSecondary: AppColor.darkGreen,

    error: AppColor.red,
    onError: AppColor.darkRed,

    surface: AppColor.white,
    onSurface: AppColor.black,

    outline: AppColor.softStone,

    onPrimaryContainer: AppColor.snowWhite,
    surfaceContainer: AppColor.mediumGrey,
    shadow: AppColor.gray,

    onPrimaryFixed: AppColor.lightBlueBg,

    primaryFixed: AppColor.orange,
    secondaryFixed: AppColor.goldTransparent,

    primaryContainer: AppColor.primaryBlue,
    primaryFixedDim: AppColor.deepBlue,
    onSecondaryFixed: AppColor.deepBlueGlass,
    secondaryContainer: AppColor.titleButton,
    secondaryFixedDim: AppColor.buttonLogin,
  );
}
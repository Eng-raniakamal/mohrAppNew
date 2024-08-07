import 'package:essmohr/presentation/resources/colors.dart';
import 'package:essmohr/presentation/resources/fonts.dart';
import 'package:essmohr/presentation/resources/styles.dart';
import 'package:essmohr/presentation/resources/values.dart';
import 'package:flutter/material.dart';


ThemeData getApplicationTheme() {
  return ThemeData(
    // main colors
    primaryColor: colorManager.primary,
    primaryColorLight: colorManager.lightprimary,
    primaryColorDark: colorManager.grey,
    disabledColor: colorManager.black,
    splashColor: colorManager.lightprimary,
    // ripple effect color
    // cardview theme
    cardTheme: CardTheme(
        color: colorManager.white,
        shadowColor: colorManager.grey,
        elevation: AppSize.s4),
    // app bar theme
    appBarTheme: AppBarTheme(
        centerTitle: true,
        color: colorManager.primary,
        elevation: AppSize.s4,
        shadowColor: colorManager.lightprimary,
        titleTextStyle:
        getRegularStyle(fontSize: FontSize.s16, color: colorManager.white)),
    // button theme
    buttonTheme: ButtonThemeData(
        shape: const StadiumBorder(),
        disabledColor: colorManager.grey,
        buttonColor: colorManager.primary,
        splashColor: colorManager.lightprimary),

    // elevated button them
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
            textStyle: getRegularStyle(
                color: colorManager.white, fontSize: FontSize.s17),
            //primary: colorManager.primary,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(AppSize.s12)))),

    // text theme
    textTheme: TextTheme(
        displayLarge:
        getLightStyle(color: colorManager.white, fontSize: FontSize.s22),

        titleMedium: getMediumStyle(
            color: colorManager.grey, fontSize: FontSize.s14),
        bodySmall: getRegularStyle(color: colorManager.grey),
        bodyLarge: getRegularStyle(color: colorManager.grey)),
    // input decoration theme (text form field)
    inputDecorationTheme: InputDecorationTheme(
      // content padding
        contentPadding: const EdgeInsets.all(AppPadding.p8),
        // hint style
        hintStyle:
        getRegularStyle(color: colorManager.grey, fontSize: FontSize.s14),
        labelStyle:
        getMediumStyle(color: colorManager.grey, fontSize: FontSize.s14),
        errorStyle: getRegularStyle(color: colorManager.error),

        // enabled border style
        enabledBorder: OutlineInputBorder(
            borderSide:
            BorderSide(color: colorManager.primary, width: AppSize.s1_5),
            borderRadius: const BorderRadius.all(Radius.circular(AppSize.s8))),

        // focused border style
        focusedBorder: OutlineInputBorder(
            borderSide:
            BorderSide(color: colorManager.grey, width: AppSize.s1_5),
            borderRadius: const BorderRadius.all(Radius.circular(AppSize.s8))),

        // error border style
        errorBorder: OutlineInputBorder(
            borderSide:
            BorderSide(color: colorManager.error, width: AppSize.s1_5),
            borderRadius: const BorderRadius.all(Radius.circular(AppSize.s8))),
        // focused border style
        focusedErrorBorder: OutlineInputBorder(
            borderSide:
            BorderSide(color: colorManager.primary, width: AppSize.s1_5),
            borderRadius: const BorderRadius.all(Radius.circular(AppSize.s8)))),
    // label style
  );
}
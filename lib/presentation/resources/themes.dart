import 'package:flutter/material.dart';
import 'package:essmohr/presentation/resources/colors.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';


class MyThemes {

  static final darkTheme = ThemeData(
    scaffoldBackgroundColor: Colors.grey.shade800,
    primaryColorDark: Colors.black,
      //ColorScheme.dark()
    colorScheme:  ColorScheme.dark(primary: colorManager.lightprimary),
    dividerColor: Colors.white,
    iconTheme: IconThemeData(color: colorManager.white)


  );

  static final lightTheme = ThemeData(
    scaffoldBackgroundColor: colorManager.white,
    primaryColor: colorManager.primary,
    colorScheme:   ColorScheme.light(primary: colorManager.lightprimary),
    dividerColor: colorManager.black,
      iconTheme: IconThemeData(color: colorManager.white),
     // navigationBarTheme: NavigationBarThemeData( indicatorColor: colorManager.white)
          //colorManager.lightprimary)

  );
}

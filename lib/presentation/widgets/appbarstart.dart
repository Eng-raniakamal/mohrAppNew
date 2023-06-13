import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mohr_hr/presentation/resources/assets_manager.dart';
import 'package:mohr_hr/presentation/resources/colors.dart';
import 'package:mohr_hr/presentation/resources/themes.dart';
import 'package:mohr_hr/presentation/settings/settings_Screen.dart';
import 'package:mohr_hr/presentation/widgets/clipPathWidget.dart';
//import 'package:mohr_hr/themes/themes.dart';
//import 'package:mohr_hr/model/user_preferences.dart';

AppBar buildAppBarstart(BuildContext context) {
  final isDarkMode = Theme.of(context).brightness == Brightness.dark;
  final icon = CupertinoIcons.moon_stars;

  return AppBar(
    //automaticallyImplyLeading: false,
    backgroundColor:Colors.transparent,
    leading:
    IconButton(
      onPressed: () {},
      icon: Image.asset(ImageAssets.EarthLangIc),
    ),

//),
    elevation: 0,
    actions: [
      ThemeSwitcher(
        builder: (context) => IconButton(
          icon: Icon(icon),
          onPressed: () {
            final theme = isDarkMode ? MyThemes.lightTheme : MyThemes.darkTheme;
            final switcher = ThemeSwitcher.of(context);
            switcher.changeTheme(theme: theme);
          },
        ),
      ),


  ],

  );
}

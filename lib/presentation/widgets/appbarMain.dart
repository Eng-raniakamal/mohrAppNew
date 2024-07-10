import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:essmohr/presentation/resources/colors.dart';
import 'package:essmohr/presentation/resources/themes.dart';
import 'package:essmohr/presentation/widgets/clipPathWidget.dart';
//import 'package:essmohr/themes/themes.dart';
//import 'package:essmohr/model/user_preferences.dart';

AppBar buildAppBarMain(BuildContext context) {
  final isDarkMode = Theme.of(context).brightness == Brightness.dark;
  final icon = CupertinoIcons.moon_stars;

  return AppBar(
  //  automaticallyImplyLeading: false,
    backgroundColor: colorManager.lightprimary,

    // shape: ShapeBorder.lerp(
    //   RoundedRectangleBorder(
    //     borderRadius: BorderRadius.circular(0.0),
    //   ),
    //   null,
    //   0,
    // ),

//),
    elevation: 0,
    actions: [
      ThemeSwitcher(
        builder: (context) => IconButton(
          icon: Icon(icon,color: colorManager.white),
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

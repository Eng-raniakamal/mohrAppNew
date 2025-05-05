import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:essmohr/domain/model/user_preferences.dart';
import 'package:essmohr/presentation/resources/assets_manager.dart';
import 'package:essmohr/presentation/resources/colors.dart';
import 'package:essmohr/presentation/resources/themes.dart';
import 'package:essmohr/presentation/settings/settings_Screen.dart';
import 'package:essmohr/presentation/widgets/clipPathWidget.dart';
//import 'package:essmohr/themes/themes.dart';
//import 'package:essmohr/model/user_preferences.dart';

AppBar buildAppBarstart(BuildContext context) {
  final isDarkMode = Theme.of(context).brightness == Brightness.dark;
  final icon = CupertinoIcons.moon_stars;

  return AppBar(
    automaticallyImplyLeading: true,
    backgroundColor:Colors.transparent,
    leading: BackButton(
      color: colorManager.primary,

        onPressed: () =>Navigator.of(context, rootNavigator: true).pop()
            //Navigator.of(context).pop()
      ),


//),
    elevation: 0,
    actions: [
      ThemeSwitcher(
        builder: (context) => IconButton(
          icon: Icon(icon,color: colorManager.primary),
          onPressed: () {
            const user = UserPreferences.myUser;

            final theme = isDarkMode ? MyThemes.lightTheme : MyThemes.darkTheme;
            final switcher = ThemeSwitcher.of(context);
            switcher.changeTheme(theme: theme);

          },
        ),
      ),


  ],

  );
}

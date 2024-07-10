import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/cupertino.dart';
//import 'packageer/foundation.dart';
import 'package:flutter/material.dart';
import 'package:essmohr/domain/model/user_preferences.dart';
import 'package:essmohr/presentation/resources/colors.dart';
import 'package:essmohr/presentation/resources/themes.dart';
import 'package:essmohr/presentation/widgets/clipPathWidget.dart';
//import 'package:essmohr/themes/themes.dart';
//import 'package:essmohr/model/user_preferences.dart';

AppBar buildAppBar(BuildContext context,String titleName) {
  final isDarkMode = Theme.of(context).brightness == Brightness.dark;
  final icon = CupertinoIcons.moon_stars;

  return AppBar(
    //shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
    //leading: BackButton(),
    title: Center(child: Text(titleName,style: TextStyle(color:colorManager.white))),
    backgroundColor: colorManager.lightprimary,
   // flexibleSpace: Container(
   //  decoration: BoxDecoration( gradient: LinearGradient(
   //    colors: [colorManager.primary, colorManager.lightprimary, colorManager.grey],
   //    begin: Alignment.topRight,
   //    end: Alignment.bottomLeft),
   //  ),
     //child: clipPathWidgets(),
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
           // final user = UserPreferences.myUser;

          },
        ),
      ),

  //     IconButton(
  //     icon: const Icon(
  //     Icons.notifications,
  // color: colorManager.primary,
  // ),
  // onPressed: () {
  // if (kDebugMode) {
  //   print("your menu action here");
  // }}
  // ),
  ],

  );
}


import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:mohr_hr/application/application.dart';
import 'package:mohr_hr/application/di.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:mohr_hr/presentation/resources/language_manager.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await initAppModule();

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(EasyLocalization
       (supportedLocales: [ARABIC_LOCAL,ENGLISH_LOCAL],
      path: ASSETS_PATH_LOCALISATIONS,
      child: Phoenix(
       child:MyApp()))
    //  MyApp()
  );
}
//
// class MohrHR1 extends StatelessWidget {
//   const MohrHR1({Key? key}) : super(key: key);
//
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//
//     final user = UserPreferences.myUser;
//     bool darkMode=false;
//
//     return ThemeProvider(
//         initTheme: user.isDarkMode ? MyThemes.darkTheme : MyThemes.lightTheme,
//         child: Builder(
//          builder: (context) => MaterialApp(
//          debugShowCheckedModeBanner: false,
//          theme: ThemeProvider.Theme.of(context),
//          title: "Mohr",
//           home: splashScreen(),
//
//     ),
//         ),
//         )
//     ;}

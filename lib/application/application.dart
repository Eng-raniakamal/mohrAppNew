
import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:mohr_hr/application/app_prefs.dart';
import 'package:mohr_hr/application/di.dart';
import 'package:mohr_hr/domain/model/user_preferences.dart';
import 'package:mohr_hr/presentation/home/Home.dart';
//import 'package:mohr_hr/presentation/onboarding/onboarding_screen.dart';
import 'package:mohr_hr/presentation/onbourding/onbording_screen.dart';
//import 'package:mohr_hr/presentation/onbourding/onbording_screen.dart';
//import 'package:mohr_hr/presentation/login/loginView.dart';
import 'package:mohr_hr/presentation/resources/themes.dart';
import 'package:mohr_hr/presentation/resources/routes.dart';
import 'package:mohr_hr/presentation/splash/splash.dart';
//import 'package:mohr_hr/presentation/splash/splashScreen.dart';
//import 'package:mohr_hr/themes/themes.dart';
//import 'package:theme_provider/theme_provider.dart';

// ignore: must_be_immutable
class MyApp extends StatefulWidget {
 // const MyApp({Key? key}) : super(key: key); //default constructor

  //named constructor
   MyApp._internal();
   int appState=0;
   static final MyApp instance =  MyApp._internal(); //single instance
   factory MyApp() =>instance; //factory for the class instance

   @override
   _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  final AppPreferences _appPreferences = instance<AppPreferences>();

  @override
  void didChangeDependencies() {
   // _navigator = Navigator.of(context);
    _appPreferences.getLocal().then((local) => {context.setLocale(local)});
    super.didChangeDependencies();
  }


  @override
  Widget build(BuildContext? context) {
    final user = UserPreferences.myUser;
    //bool darkMode= false;

    return
      ThemeProvider(
      initTheme: user.isDarkMode ? MyThemes.darkTheme : MyThemes.lightTheme,
      child: Builder(
        builder: (context) =>
             MaterialApp(
               localizationsDelegates: context.localizationDelegates,
               debugShowCheckedModeBanner: false,
               supportedLocales: context.supportedLocales,
               locale: context.locale,
               onGenerateRoute: RouteGenerator.getRoute,
              //initialRoute: Routes.splashRoute,
              //home:splashScreen(),
                 home: SplashView(),
                // home:  Home(),
              // theme:Theme.of(context),
                title: "Mohr")

            ),
      )
    ;
  }
}

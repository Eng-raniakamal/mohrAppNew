
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:mohr_hr/application/application.dart';
import 'package:mohr_hr/application/di.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:mohr_hr/presentation/resources/language_manager.dart';




 final FlutterLocalNotificationsPlugin  flutterLocalNotificationsPlugin=FlutterLocalNotificationsPlugin();



Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await initAppModule();

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(EasyLocalization
       (supportedLocales: const [ARABIC_LOCAL,ENGLISH_LOCAL],
      path: ASSETS_PATH_LOCALISATIONS,
      child: Phoenix(
       child:MyApp()))
    //  MyApp()
  );
  ErrorWidget.builder=(FlutterErrorDetails details){
    return Container(
      //child: Text("no value here"),
    );
  };
}
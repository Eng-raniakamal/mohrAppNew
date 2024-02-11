
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:mohr_hr/application/app_prefs.dart';
import 'package:mohr_hr/application/application.dart';
import 'package:mohr_hr/application/constants.dart';
import 'package:mohr_hr/application/di.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:mohr_hr/domain/model/model.dart';
import 'package:mohr_hr/presentation/Notification.dart';
import 'package:mohr_hr/presentation/resources/language_manager.dart';
import 'package:mohr_hr/presentation/resources/strings_manager.dart';
import 'package:workmanager/workmanager.dart';
import 'package:http/http.dart' as http;


final FlutterLocalNotificationsPlugin  flutterLocalNotificationsPlugin=FlutterLocalNotificationsPlugin();
final AppPreferences _appPreferences = instance<AppPreferences>();

//String? userId;
const simplePeriodicTask = "simplePeriodicTask";
// flutter local notification setup
void showNotification( v, flp) async {

  var android = AndroidNotificationDetails(
      'channel id', 'channel NAME',
      priority: Priority.high, importance: Importance.max);
  var iOS = DarwinNotificationDetails();
  var platform = NotificationDetails(android: android,iOS: iOS);
  await flp.show(v, "new notifications here", '$v', platform,
      payload: 'VIS \n $v');
}

void callbackDispatcher() {
  Workmanager().executeTask((task, inputData) async {
    await initAppModule();
    String userId= await _appPreferences.getUserToken();
    FlutterLocalNotificationsPlugin flp = FlutterLocalNotificationsPlugin();
    var android = AndroidInitializationSettings('@mipmap/ic_launcher');
    //var iOS = IOSInitializationSettings();
    var initSetttings = InitializationSettings(android: android);
    flp.initialize(initSetttings);

    var uri = Uri.parse(Constants.getNotificationUrl);
    List<NotificationModel>? a;

    var response = await http.get(
        uri, headers: <String, String>{
       'Content-Type': 'application/json; charset=UTF-8',
      // 'userId': "b64f7a02-b625-46b7-8126-d3a20defdff8",
       'userId': userId
    });

    final responseData = json.decode(response.body);
    if (responseData != null) {
      var userNotifications = responseData as List;
      a = userNotifications.map((data) => NotificationModel.fromJson(data))
          .toList();
      var notifications = List<NotificationModel>.from(a as Iterable);
      //return notifications;
      int unSeenMessage=0;

      for(var i = 0; i < notifications.length; i++)
      {
        if(notifications[i].seen==false)
        {
          unSeenMessage++;
        }
      }


      Constants.notificationNumber=unSeenMessage;
      if(unSeenMessage!=0) {
        showNotification(unSeenMessage, flp);
      }
     // print( unSeenMessage);
    }
    //return null;
    return Future.value(true);
  });
}

Future<void> main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await initAppModule();
  Notifications.initialize(flutterLocalNotificationsPlugin);
  await Workmanager().initialize(callbackDispatcher, isInDebugMode: false);
  await EasyLocalization.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  //await initializeService();

  runApp(EasyLocalization
       (supportedLocales: const [ARABIC_LOCAL,ENGLISH_LOCAL],
      path: ASSETS_PATH_LOCALISATIONS,
      child: Phoenix(
       child:MyApp()))

  );
  ErrorWidget.builder=(FlutterErrorDetails details){
    return Container(
      //color:Colors.yellow[200],
      child: const Center(child: SizedBox(child: Text(""))),
    );
  };
}



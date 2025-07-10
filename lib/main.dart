
import 'dart:async';

import 'package:background_fetch/background_fetch.dart';
import 'package:essmohr/presentation/resources/background_worker.dart';
import 'package:essmohr/presentation/resources/notification_helper.dart';
import 'package:essmohr/presentation/resources/strings_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app_badger/flutter_app_badger.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:essmohr/application/app_prefs.dart';
import 'package:essmohr/application/application.dart';
import 'package:essmohr/application/constants.dart';
import 'package:essmohr/application/di.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:essmohr/presentation/Notification.dart';
import 'package:essmohr/presentation/resources/language_manager.dart';
import 'package:get_it/get_it.dart';
import 'application/core.dart';
import 'application/service/notification_checker_service.dart';



// final FlutterLocalNotificationsPlugin  flutterLocalNotificationsPlugin=FlutterLocalNotificationsPlugin();
// final AppPreferences _appPreferences = instance<AppPreferences>();
//
// //String? userId;
// const simplePeriodicTask = "simplePeriodicTask";
// // List<AlertModel>? noOfAlert;
// // int? alertNumber = 0;
// // int?all=0;
// // List<NotificationModel>? notifications;
// // var lengthOfList;
// //NotificationData _notificationData = NotificationData();
//
//
//
// // flutter local notification setup
// void showNotification( v, flp) async {
//
//   var android = const AndroidNotificationDetails(
//       'channel id', 'channel NAME',
//       priority: Priority.high, importance: Importance.max);
//   var iOS = const DarwinNotificationDetails();
//   var platform = NotificationDetails(android: android,iOS: iOS);
//   await flp.show(v , "Sync ESS", '$v'+ " " + AppStrings.new_message_here.tr(), platform,
//       payload: 'VIS \n $v');
// }
//
//
//
// // @pragma('vm:entry-point') // مهم جدًا لتعمل المهمة في الخلفية
// // Future<void> backgroundApiCheck() async {
// //   // TODO: ضعي هنا كود الاتصال بـ API + إشعار إن لزم
// //   print('⏰ Background check running...');
// //
// //   WidgetsFlutterBinding.ensureInitialized();
// //   await initAppModule(); // تأكد من أن الـ dependencies جاهزة
// //
// //   final flp = FlutterLocalNotificationsPlugin();
// //   const android = AndroidInitializationSettings('app_icon');
// //   final initSettings = InitializationSettings(android: android);
// //   flp.initialize(initSettings);
// //
// //   try {
// //     int? unSeenMessage = await getUnSeenNotificationAndAlerts();
// //     Constants.notificationNumber = unSeenMessage!;
// //
// //     if (unSeenMessage != 0) {
// //       await _appPreferences.setUserNotificationList(unSeenMessage);
// //       showNotification(unSeenMessage, flp);
// //     }
// //
// //   } catch (e) {
// //     print('❌ Error during background check: $e');
// //   }
// // }
//
//
// // void callbackDispatcher() {
// //  // Workmanager().executeTask((task, inputData) async {
// //     WidgetsFlutterBinding.ensureInitialized();
// //     await initAppModule();
// //     String userId= await _appPreferences.getUserToken();
// //     FlutterLocalNotificationsPlugin flp = FlutterLocalNotificationsPlugin();
// //     var android = const AndroidInitializationSettings('app_icon');
// //     //var iOS = IOSInitializationSettings();
// //     var initSettings = InitializationSettings(android: android);
// //     flp.initialize(initSettings);
// //
// //     // var uri = Uri.parse(Constants.getNotificationUrl);
// //     // List<NotificationModel>? a;
// //     //
// //     // var response = await http.get(
// //     //     uri, headers: <String, String>{
// //     //   'Content-Type': 'application/json; charset=UTF-8',
// //     //   // 'userId': "b64f7a02-b625-46b7-8126-d3a20defdff8",
// //     //   'userId': userId
// //     // });
// //     // final responseData = json.decode(response.body);
// //     // if (responseData != null) {
// //     //   var userNotifications = responseData as List;
// //     //   a = userNotifications.map((data) => NotificationModel.fromJson(data))
// //     //       .toList();
// //     //   var notifications = List<NotificationModel>.from(a as Iterable);
// //     //   //return notifications;
// //        int unSeenMessage=0;
// //     //   for(var i = 0; i < notifications.length; i++)
// //     //   {
// //     //     if(notifications[i].seen==false)
// //     //     {
// //           unSeenMessage= await getUnSeenNotificationAndAlerts() as int;
// //     //     }
// //     //   }
// //       Constants.notificationNumber=unSeenMessage;
// //       _appPreferences.setUserNotificationList(unSeenMessage);
// //       if(unSeenMessage!=0) {
// //         showNotification(unSeenMessage, flp);
// //       }
// //       // print( unSeenMessage);
// //   //  }
// //     //return null;
// //     return Future.value(true);
// //   });
// // }
// // Future<int> getNumberOfAlerts(List<AlertModel> alertList) async {
// //   int numberOfAlert = alertList.length ;
// //
// //   // setState(() {
// //   //   Constants.notificationNumber = numberOfAlert;
// //   // });
// //   // if (Constants.notificationNumber != 0) {
// //   //   setBatchNumber(context, numberOfAlert);
// //   // }
// //
// //   return numberOfAlert;
// // }
//
// // Future<int?> getUnSeenNotificationAndAlerts()async
// // {
// //   notifications = await getApiNotification();
// //   lengthOfList = await getUnSeenNotification(notifications!);
// //   noOfAlert= await getApiAlerts();
// //   alertNumber=await getNumberOfAlerts(noOfAlert!);
// //
// //   all=  lengthOfList + alertNumber!;
// //   //setState(() {
// //   Constants.notificationNumber = all!;
// //   //});
// //   if (Constants.notificationNumber != 0) {
// //     // setBatchNumber(context as BuildContext, all!);
// //   }
// //   return all;
// // }
// // Future <List<NotificationModel>?> getApiNotification() async
// // {
// //   try
// //   {
// //     String userId = await _appPreferences.getUserToken();
// //     Constants.userId=userId;
// //     var uri = Uri.parse(Constants.getNotificationUrl);
// //     List<NotificationModel>? a;
// //
// //     var response = await http.get(
// //         uri, headers: <String, String>{
// //       'Content-Type': 'application/json; charset=UTF-8',
// //       'userId': userId
// //     });
// //     //.timeout(Duration(seconds: 40));
// //
// //     final responseData = json.decode(response.body.toString());
// //     if (responseData != null) {
// //       var userNotifications = responseData as List;
// //       a = userNotifications.map((data) => NotificationModel.fromJson(data))
// //           .toList();
// //       var notifications = List<NotificationModel>.from(a as Iterable);
// //       return notifications;
// //     }
// //     return null;
// //   }
// //   on TimeoutException catch (e) {
// //     print('Timeout Error: $e');
// //     throw Exception('Time out ');
// //   } on SocketException catch (e) {
// //     print('Socket Error: $e');
// //     throw Exception('no internet');
// //   }
// //   catch (e) {
// //     print('General Error: $e');
// //     throw Exception('Failed');}
// //
// // }
// // Future<List<AlertModel>?> getApiAlerts() async {
// //   String userId = await _appPreferences.getUserToken();
// //   var uri = Uri.parse(Constants.getAlertUrl);
// //   List<AlertModel>? a;
// //
// //   var response = await http.get(uri, headers: <String, String>{
// //     'Content-Type': 'application/json; charset=UTF-8',
// //     'userId': userId
// //   });
// //
// //   final responseData = json.decode(response.body);
// //   if (responseData != null) {
// //     var userNotifications = responseData as List;
// //     a = userNotifications
// //         .map((data) => AlertModel.fromJson(data))
// //         .toList();
// //     var Alerts = List<AlertModel>.from(a as Iterable);
// //     return Alerts;
// //   }
// //   return null;
// // }
// //
// // Future<int> getUnSeenNotification(List<NotificationModel> notifiList) async {
// //   int unSeenMessage = 0;
// //
// //   for (var i = 0; i < notifiList.length; i++) {
// //     if (notifiList[i].seen == false) {
// //       unSeenMessage++;
// //     }
// //   }
// //   // setState(() {
// //   //   Constants.notificationNumber = unSeenMessage;
// //   // });
// //   // if (Constants.notificationNumber != 0) {
// //   //    setBatchNumber(context, unSeenMessage);
// //   // }
// //
// //   return unSeenMessage;
// // }
//
// @pragma('vm:entry-point')
// Future<void> alarmManagerBackgroundCheck() async {
//   print('⏰ AlarmManager background check running...');
//
//   WidgetsFlutterBinding.ensureInitialized();
//   await initAppModule(); // تهيئة الـ dependencies
//
//   final flp = FlutterLocalNotificationsPlugin();
//   const android = AndroidInitializationSettings('app_icon');
//   final initSettings = InitializationSettings(android: android);
//   await flp.initialize(initSettings);
//
//   try {
//     final int? unseenCount = await getUnSeenNotificationAndAlerts();
//
//     final _appPreferences = GetIt.I<AppPreferences>();
//     final storedCount = await _appPreferences.getUserNotificationList();
//
//     if (unseenCount != storedCount) {
//       await _appPreferences.setUserNotificationList(unseenCount!);
//
//       if (unseenCount > 0) {
//         await Notifications.showBigTextNotification(
//           title: "Sync",
//           body: "$unseenCount ${AppStrings.new_message_here.tr()}",
//           fln: flp,
//         );
//         await FlutterAppBadger.updateBadgeCount(unseenCount);
//       }
//     }
//   } catch (e) {
//     print("❌ Error in alarmManagerBackgroundCheck: $e");
//   }
// }

Future<void> main() async {
  //  WidgetsFlutterBinding.ensureInitialized();
  //  await initAppModule();
  // // await init();
  //  Notifications.initialize(flutterLocalNotificationsPlugin);
  //  //await Workmanager().initialize(callbackDispatcher, isInDebugMode: false);
  //
  //  await AndroidAlarmManager.initialize();
  //
  //  // جدولة المهمة كل 15 دقيقة
  //  await AndroidAlarmManager.periodic(
  //    const Duration(minutes: 15),
  //    0, // ID للمهمة
  //    backgroundApiCheck,
  //    wakeup: true,
  //    exact: true,
  //    rescheduleOnReboot: true,
  //  );
  //  await EasyLocalization.ensureInitialized();
  //  await SystemChrome.setPreferredOrientations([
  //    DeviceOrientation.portraitUp,
  //    DeviceOrientation.portraitDown,
  //  ]);
  //
  //  //await initializeService();
  //
  //  runApp(EasyLocalization
  //    (supportedLocales: const [ARABIC_LOCAL,],
  //    //ENGLISH_LOCAL],
  //      path: ASSETS_PATH_LOCALISATIONS,
  //      child: Phoenix(
  //          child:MyApp()))
  //  );
  //  ErrorWidget.builder=(FlutterErrorDetails details){
  //    return const Center(child: SizedBox(child: Text("")));
  //  };


  WidgetsFlutterBinding.ensureInitialized();

  Notifications.initialize(flutterLocalNotificationsPlugin);
  await initAppModule();
  await EasyLocalization.ensureInitialized();

  // تسجيل مهمة background-fetch headless
  BackgroundFetch.registerHeadlessTask(
      BackgroundWorker.backgroundFetchHeadlessTask);

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(
    EasyLocalization(
      supportedLocales: const [ARABIC_LOCAL],
      path: ASSETS_PATH_LOCALISATIONS,
      child: Phoenix(child: MyApp()),
    ),
  );

  ErrorWidget.builder = (FlutterErrorDetails details) {
    return const Center(child: SizedBox(child: Text("")));
  };
}

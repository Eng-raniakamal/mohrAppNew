
import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:essmohr/presentation/Alert_Notification/ViewModel/notificationViewModel.dart';
import 'package:essmohr/presentation/newDesign/core/service/dependency_injection/depend_inject.dart' as di;
import 'package:essmohr/presentation/newDesign/core/service/dependency_injection/depend_inject.dart';
import 'package:essmohr/presentation/resources/strings_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:essmohr/application/app_prefs.dart';
import 'package:essmohr/application/application.dart';
import 'package:essmohr/application/constants.dart';
import 'package:essmohr/application/di.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:essmohr/domain/model/model.dart';
import 'package:essmohr/presentation/Notification.dart';
import 'package:essmohr/presentation/resources/language_manager.dart';
//import 'package:workmanager/workmanager.dart';
import 'package:http/http.dart' as http;




final FlutterLocalNotificationsPlugin  flutterLocalNotificationsPlugin=FlutterLocalNotificationsPlugin();
final AppPreferences _appPreferences = instance<AppPreferences>();

//String? userId;
const simplePeriodicTask = "simplePeriodicTask";
List<AlertModel>? noOfAlert;
int? alertNumber = 0;
int?all=0;
List<NotificationModel>? notifications;
var lengthOfList;
NotificationData _notificationData = NotificationData();



// flutter local notification setup
void showNotification( v, flp) async {

  var android = const AndroidNotificationDetails(
      'channel id', 'channel NAME',
      priority: Priority.high, importance: Importance.max);
  var iOS = const DarwinNotificationDetails();
  var platform = NotificationDetails(android: android,iOS: iOS);
  await flp.show(v , "Sync ESS", '$v'+ " " + AppStrings.new_message_here.tr(), platform,
      payload: 'VIS \n $v');
}

// void callbackDispatcher() {
//  // Workmanager().executeTask((task, inputData) async {
//     WidgetsFlutterBinding.ensureInitialized();
//     await initAppModule();
//     String userId= await _appPreferences.getUserToken();
//     FlutterLocalNotificationsPlugin flp = FlutterLocalNotificationsPlugin();
//     var android = const AndroidInitializationSettings('app_icon');
//     //var iOS = IOSInitializationSettings();
//     var initSettings = InitializationSettings(android: android);
//     flp.initialize(initSettings);
//
//     // var uri = Uri.parse(Constants.getNotificationUrl);
//     // List<NotificationModel>? a;
//     //
//     // var response = await http.get(
//     //     uri, headers: <String, String>{
//     //   'Content-Type': 'application/json; charset=UTF-8',
//     //   // 'userId': "b64f7a02-b625-46b7-8126-d3a20defdff8",
//     //   'userId': userId
//     // });
//     // final responseData = json.decode(response.body);
//     // if (responseData != null) {
//     //   var userNotifications = responseData as List;
//     //   a = userNotifications.map((data) => NotificationModel.fromJson(data))
//     //       .toList();
//     //   var notifications = List<NotificationModel>.from(a as Iterable);
//     //   //return notifications;
//        int unSeenMessage=0;
//     //   for(var i = 0; i < notifications.length; i++)
//     //   {
//     //     if(notifications[i].seen==false)
//     //     {
//           unSeenMessage= await getUnSeenNotificationAndAlerts() as int;
//     //     }
//     //   }
//       Constants.notificationNumber=unSeenMessage;
//       _appPreferences.setUserNotificationList(unSeenMessage);
//       if(unSeenMessage!=0) {
//         showNotification(unSeenMessage, flp);
//       }
//       // print( unSeenMessage);
//   //  }
//     //return null;
//     return Future.value(true);
//   });
// }
Future<int> getNumberOfAlerts(List<AlertModel> alertList) async {
  int numberOfAlert = alertList.length ;

  // setState(() {
  //   Constants.notificationNumber = numberOfAlert;
  // });
  // if (Constants.notificationNumber != 0) {
  //   setBatchNumber(context, numberOfAlert);
  // }

  return numberOfAlert;
}

Future<int?> getUnSeenNotificationAndAlerts()async
{
  notifications = await getApiNotification();
  lengthOfList = await getUnSeenNotification(notifications!);
  noOfAlert= await getApiAlerts();
  alertNumber=await getNumberOfAlerts(noOfAlert!);

  all=  lengthOfList + alertNumber!;
  //setState(() {
  Constants.notificationNumber = all!;
  //});
  if (Constants.notificationNumber != 0) {
    // setBatchNumber(context as BuildContext, all!);
  }
  return all;
}
Future <List<NotificationModel>?> getApiNotification() async
{
  try
  {
    String userId = await _appPreferences.getUserToken();
    Constants.userId=userId;
    var uri = Uri.parse(Constants.getNotificationUrl);
    List<NotificationModel>? a;

    var response = await http.get(
        uri, headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'userId': userId
    });
    //.timeout(Duration(seconds: 40));

    final responseData = json.decode(response.body.toString());
    if (responseData != null) {
      var userNotifications = responseData as List;
      a = userNotifications.map((data) => NotificationModel.fromJson(data))
          .toList();
      var notifications = List<NotificationModel>.from(a as Iterable);
      return notifications;
    }
    return null;
  }
  on TimeoutException catch (e) {
    print('Timeout Error: $e');
    throw Exception('Time out ');
  } on SocketException catch (e) {
    print('Socket Error: $e');
    throw Exception('no internet');
  }
  catch (e) {
    print('General Error: $e');
    throw Exception('Failed');}

}
Future<List<AlertModel>?> getApiAlerts() async {
  String userId = await _appPreferences.getUserToken();
  var uri = Uri.parse(Constants.getAlertUrl);
  List<AlertModel>? a;

  var response = await http.get(uri, headers: <String, String>{
    'Content-Type': 'application/json; charset=UTF-8',
    'userId': userId
  });

  final responseData = json.decode(response.body);
  if (responseData != null) {
    var userNotifications = responseData as List;
    a = userNotifications
        .map((data) => AlertModel.fromJson(data))
        .toList();
    var Alerts = List<AlertModel>.from(a as Iterable);
    return Alerts;
  }
  return null;
}

Future<int> getUnSeenNotification(List<NotificationModel> notifiList) async {
  int unSeenMessage = 0;

  for (var i = 0; i < notifiList.length; i++) {
    if (notifiList[i].seen == false) {
      unSeenMessage++;
    }
  }
  // setState(() {
  //   Constants.notificationNumber = unSeenMessage;
  // });
  // if (Constants.notificationNumber != 0) {
  //    setBatchNumber(context, unSeenMessage);
  // }

  return unSeenMessage;
}


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initAppModule();
 // await init();
  Notifications.initialize(flutterLocalNotificationsPlugin);
 // await Workmanager().initialize(callbackDispatcher, isInDebugMode: false);
  await EasyLocalization.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  //await initializeService();

  runApp(EasyLocalization
    (supportedLocales: const [ARABIC_LOCAL,],
    //ENGLISH_LOCAL],
      path: ASSETS_PATH_LOCALISATIONS,
      child: Phoenix(
          child:MyApp()))
  );
  ErrorWidget.builder=(FlutterErrorDetails details){
    return const Center(child: SizedBox(child: Text("")));
  };
}



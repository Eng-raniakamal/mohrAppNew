import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter_app_badger/flutter_app_badger.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
//import 'package:flutter_dynamic_icon/flutter_dynamic_icon.dart';
import 'package:essmohr/application/app_prefs.dart';
import 'package:essmohr/application/constants.dart';
import 'package:essmohr/application/di.dart';
import 'package:essmohr/domain/model/model.dart';
import 'package:essmohr/main.dart';
import 'package:essmohr/presentation/Alert_Notification/ViewModel/notificationViewModel.dart';
import 'package:essmohr/presentation/Notification.dart';
//import 'package:flutter_dynamic_icon/flutter_dynamic_icon.dart';
import 'package:path/path.dart';



AppPreferences _appPreferences = instance<AppPreferences>();
List<AlertModel>? noOfAlert;
int? alertNumber = 0;
int?all=0;
List<NotificationModel>? notifications;
int? lengthOfList;
NotificationData _notificationData = NotificationData();

  Future<void> checkNewNotifications() async {


    int? storedDataLength;
    notifications = await _notificationData.getApiNotification();

    if (notifications != null) {
      // lengthOfList =
      // await _notificationData.getUnSeenNotification(notifications);
      lengthOfList=await getUnSeenNotificationAndAlerts();
      Constants.notificationNumber = lengthOfList!;


      if (lengthOfList != null) {

        storedDataLength = await _appPreferences.getUserNotificationList();

        if (lengthOfList != storedDataLength) {
          Constants.notificationNumber = lengthOfList!;
          _appPreferences.setUserNotificationList(lengthOfList!);

          if (lengthOfList! > 0) {
             //FlutterAppBadger.updateBadgeCount(lengthOfList);
            setBatchNumber(context as BuildContext, Constants.notificationNumber);
            Notifications.showBigTextNotification(
                title: "MOHR", body: "$lengthOfList New notification here",
                fln: flutterLocalNotificationsPlugin);

            //  _appPreferences.setUserNotificationList(lengthOfList);
          }
          // }
          else {
            Constants.notificationNumber = lengthOfList!;

              _appPreferences.setUserNotificationList(lengthOfList!);
          }
        }
      }
    }
  }
  setBatchNumber(BuildContext context, int num) async {
    try {
     // await FlutterDynamicIcon.setApplicationIconBadgeNumber(num);
      FlutterAppBadger.updateBadgeCount(num);
    } on PlatformException {
      print('Exception:Platform not supported');
    } catch (e) {
      print(e);
    }
  }
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

  all=  (lengthOfList! + alertNumber!);
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


  //int bachNumber=await FlutterDynamicIcon.getApplicationIconBadgeNumber();


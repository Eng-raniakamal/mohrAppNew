import 'dart:convert';
import 'package:essmohr/application/app_prefs.dart';
import 'package:essmohr/application/constants.dart';
import 'package:essmohr/application/di.dart';
import 'package:essmohr/domain/model/model.dart';
import 'package:essmohr/presentation/Attendance/view/attendanceAlert.dart';
import 'package:http/http.dart' as http;


final AppPreferences _appPreferences = instance<AppPreferences>();
List<NotificationModel>? notifications;
int? lengthOfList = 0;
List<AlertModel>? noOfAlert;
int? alertNumber = 0;
int?all=0;
int different = 0;
int differentflag = 0;
bool checked = false;
int? storedDataLength = 0;


class NotificationData {
  //final AppPreferences _appPreferences;
  NotificationData();

  // Future <List<NotificationModel>?> getApiNotification() async
  // {
  //   userId = await _appPreferences.getUserToken();
  //   var uri = Uri.parse(Constants.getNotificationUrl);
  //   List<NotificationModel>? a;
  //
  //   var response = await http.get(
  //       uri, headers: <String, String>{
  //     'Content-Type': 'application/json; charset=UTF-8',
  //     'userId': userId!
  //   });
  //
  //   final responseData = json.decode(response.body.toString());
  //   if (responseData != null) {
  //     var userNotifications = responseData as List;
  //     a = userNotifications.map((data) => NotificationModel.fromJson(data))
  //         .toList();
  //     var notifications = List<NotificationModel>.from(a as Iterable);
  //     return notifications;
  //   }
  //   return null;
  // }

  Future <int> getUnSeenNotification(List<NotificationModel> notifiList) async
  {
    int unSeenMessage=0;

    for(var i = 0; i < notifiList.length; i++)
      {
        if(notifiList[i].seen==false)
          {
            unSeenMessage++;
          }

      }
    Constants.notificationNumber=unSeenMessage;
    return unSeenMessage;
  }

  Future<List<NotificationModel>?> getApiNotification() async {
    String userId = await _appPreferences.getUserToken();
    var uri = Uri.parse(Constants.getNotificationUrl);
    List<dynamic>? a;

    var response = await http.get(uri, headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'userId': userId
    });

    final responseData = json.decode(response.body);
    if (responseData != null) {
      var userNotifications = responseData! ;

      a = userNotifications
          .map((data) {
        return NotificationModel.fromJson(data);
      })
          .toList();
      var notifications = List<NotificationModel>.from(a as Iterable);
      return notifications;
    }
    return null;
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
      var userNotifications = responseData ;
      a = userNotifications
          .map((data) => AlertModel.fromJson(data))
          .toList();
      var alerts = List<AlertModel>.from(a as Iterable);
      return alerts;
    }
    return null;
  }

  // Future<int> getUnSeenNotification(List<NotificationModel> notifiList) async {
  //   int unSeenMessage = 0;
  //
  //   for (var i = 0; i < notifiList.length; i++) {
  //     if (notifiList[i].seen == false) {
  //       unSeenMessage++;
  //     }
  //   }
  //
  //   return unSeenMessage;
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
    all=  lengthOfList! + alertNumber!;
    return all;
  }


}
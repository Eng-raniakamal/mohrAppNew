import 'dart:convert';
import 'package:essmohr/application/app_prefs.dart';
import 'package:essmohr/application/constants.dart';
import 'package:essmohr/application/di.dart';
import 'package:essmohr/domain/model/model.dart';
import 'package:essmohr/presentation/Attendance/view/attendanceAlert.dart';
import 'package:http/http.dart' as http;


final AppPreferences _appPreferences = instance<AppPreferences>();
class NotificationData {
  //final AppPreferences _appPreferences;
  NotificationData();

  Future <List<NotificationModel>?> getApiNotification() async
  {
    userId = await _appPreferences.getUserToken();
    var uri = Uri.parse(Constants.getNotificationUrl);
    List<NotificationModel>? a;

    var response = await http.get(
        uri, headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'userId': userId!
    });

    final responseData = json.decode(response.body);
    if (responseData != null) {
      var userNotifications = responseData as List;
      a = userNotifications.map((data) => NotificationModel.fromJson(data))
          .toList();
      var notifications = List<NotificationModel>.from(a as Iterable);
      return notifications;
    }
    return null;
  }

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
}
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
//import 'package:flutter_dynamic_icon/flutter_dynamic_icon.dart';
import 'package:essmohr/application/app_prefs.dart';
import 'package:essmohr/application/application.dart';
import 'package:essmohr/application/constants.dart';
import 'package:essmohr/application/di.dart';
import 'package:essmohr/domain/model/model.dart';
import 'package:essmohr/main.dart';
import 'package:essmohr/presentation/Alert_Notification/ViewModel/notificationViewModel.dart';
import 'package:essmohr/presentation/Attendance/view/attendanceAlert.dart';
import 'package:essmohr/presentation/Notification.dart';



AppPreferences appPreferences = instance<AppPreferences>();

  Future<void> checkNewNotifications() async {

    // final NotificationServies _notifiService=NotificationServies();

    //final service = FlutterBackgroundService();

    NotificationData _notificationData = NotificationData();
    List<NotificationModel>? notifications;
    var lengthOfList;

    int? storedDataLength;
    notifications = await _notificationData.getApiNotification();

    if (notifications != null) {
      lengthOfList =
      await _notificationData.getUnSeenNotification(notifications);
      Constants.notificationNumber = lengthOfList;


      if (lengthOfList != null) {

        storedDataLength = await appPreferences.getUserNotificationList();

        if (lengthOfList != storedDataLength) {
          Constants.notificationNumber = lengthOfList!;

          if (lengthOfList! > 0) {
            //setBatchNumber(context as BuildContext, Constants.notificationNumber);
            Notifications.showBigTextNotification(
                title: "MOHR", body: "$lengthOfList New notification here",
                fln: flutterLocalNotificationsPlugin);

            //  _appPreferences.setUserNotificationList(lengthOfList);
          }
          // }
          else {
            Constants.notificationNumber = lengthOfList!;

            //   _appPreferences.setUserNotificationList(lengthOfList!);
          }
        }
      }
    }
  }
  setBatchNumber(BuildContext context, int num) async {
    try {
    //  await FlutterDynamicIcon.setApplicationIconBadgeNumber(num);
    } on PlatformException {
      print('Exception:Platform not supported');
    } catch (e) {
      print(e);
    }
  }

  //int bachNumber=await FlutterDynamicIcon.getApplicationIconBadgeNumber();


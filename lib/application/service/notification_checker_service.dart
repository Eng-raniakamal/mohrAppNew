import 'dart:convert';
import 'package:flutter/widgets.dart';
import 'package:flutter_app_badger/flutter_app_badger.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:http/http.dart' as http;
import 'package:easy_localization/easy_localization.dart';

import '../../domain/model/model.dart';
import '../../presentation/Notification.dart';
import '../../presentation/resources/strings_manager.dart';
import '../app_prefs.dart';
import '../constants.dart';
import '../di.dart';


class NotificationCheckerService {
  static Future<void> checkNewNotifications() async {
    WidgetsFlutterBinding.ensureInitialized(); // لتشغيل isolate

    await initAppModule(); // تأكد من تهيئة DI

    final AppPreferences prefs = instance<AppPreferences>();
    final flutterLocalNotificationsPlugin = Notifications.flutterPlugin;

    try {
      final notifications = await _getApiNotification(prefs);
      final alerts = await _getApiAlerts(prefs);

      int unseen = _getUnseenNotifications(notifications);
      int alertCount = _getAlertCount(alerts);
      int total = unseen + alertCount;

      if (total > 0) {
        FlutterAppBadger.updateBadgeCount(total);
        Notifications.showBigTextNotification(
          title: "MOHR",
          body: "$total ${AppStrings.new_message_here.tr()}",
          fln: flutterLocalNotificationsPlugin,
        );
      }

      prefs.setUserNotificationList(total);
      Constants.notificationNumber = total;
    } catch (e) {
      print("NotificationCheckerService Error: $e");
    }
  }

  static Future<List<NotificationModel>> _getApiNotification(AppPreferences prefs) async {
    final uri = Uri.parse(Constants.getNotificationUrl);
    final response = await http.get(uri, headers: {
      'Content-Type': 'application/json; charset=UTF-8',
      'userId': await prefs.getUserToken(),
    });

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return data.map((e) => NotificationModel.fromJson(e)).toList();
    } else {
      return [];
    }
  }

  static Future<List<AlertModel>> _getApiAlerts(AppPreferences prefs) async {
    final uri = Uri.parse(Constants.getAlertUrl);
    final response = await http.get(uri, headers: {
      'Content-Type': 'application/json; charset=UTF-8',
      'userId': await prefs.getUserToken(),
    });

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return data.map((e) => AlertModel.fromJson(e)).toList();
    } else {
      return [];
    }
  }

  static int _getUnseenNotifications(List<NotificationModel> notifications) {
    return notifications.where((n) => n.seen == false).length;
  }

  static int _getAlertCount(List<AlertModel> alerts) {
    return alerts.length;
  }
}
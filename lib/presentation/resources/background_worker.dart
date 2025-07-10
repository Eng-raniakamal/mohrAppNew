import 'dart:convert';
import 'package:background_fetch/background_fetch.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:http/http.dart' as http;
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_app_badger/flutter_app_badger.dart';

import '../../application/app_prefs.dart';
import '../../application/constants.dart';
import '../../domain/model/model.dart';


import '../newDesign/core/utils/import_file.dart';
import 'notification_helper.dart';
import '../resources/strings_manager.dart';


class BackgroundWorker {
  static Future<void> backgroundCheck() async {
    try {
      if (!GetIt.I.isRegistered<AppPreferences>()) {
        final sharedPrefs = await SharedPreferences.getInstance();
        GetIt.I.registerLazySingleton(() => sharedPrefs);
        GetIt.I.registerLazySingleton(() => AppPreferences(GetIt.I()));
      }

      final AppPreferences _appPreferences = GetIt.I<AppPreferences>();
      final userId = await _appPreferences.getUserToken();

      final uriNoti = Uri.parse(Constants.getNotificationUrl);
      final uriAlert = Uri.parse(Constants.getAlertUrl);

      final notiResponse = await http.get(uriNoti, headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        'userId': userId,
      });

      final alertResponse = await http.get(uriAlert, headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        'userId': userId,
      });

      final notiData = json.decode(notiResponse.body);
      final alertData = json.decode(alertResponse.body);

      final notifications = (notiData as List)
          .map((e) => NotificationModel.fromJson(e))
          .toList();
      final alerts = (alertData as List)
          .map((e) => AlertModel.fromJson(e))
          .toList();

      final unseen = notifications.where((n) => n.seen == false).length;
      final total = unseen + alerts.length;

      final storedCount = await _appPreferences.getUserNotificationList();

      if (total != storedCount) {
        await _appPreferences.setUserNotificationList(total);

        if (total > 0) {
          await NotificationsHelper.showBigTextNotification(
            title: "Sync",
            body: "$total ${AppStrings.new_message_here.tr()}",
            fln: flutterLocalNotificationsPlugin,
          );
          await FlutterAppBadger.updateBadgeCount(total);
        }
      }
    } catch (e) {
      debugPrint("❌ Error during background check: $e");
    }
  }

  static void backgroundFetchHeadlessTask(String taskId) async {
    debugPrint('🧠 [BackgroundFetch] Headless event received: $taskId');
    await backgroundCheck();
    BackgroundFetch.finish(taskId);
  }
}
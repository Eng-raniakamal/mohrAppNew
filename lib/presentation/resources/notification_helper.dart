import 'package:flutter_local_notifications/flutter_local_notifications.dart';

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
FlutterLocalNotificationsPlugin();

class NotificationsHelper {
  static void initialize(FlutterLocalNotificationsPlugin fln) {
    const AndroidInitializationSettings androidInitializationSettings =
    AndroidInitializationSettings('@mipmap/ic_launcher');

    final InitializationSettings initializationSettings = InitializationSettings(
      android: androidInitializationSettings,
      iOS: DarwinInitializationSettings(),
    );

    fln.initialize(initializationSettings);
  }

  static Future<void> showBigTextNotification({
    required String title,
    required String body,
    required FlutterLocalNotificationsPlugin fln,
  }) async {
    const AndroidNotificationDetails androidDetails = AndroidNotificationDetails(
      'Sync_channel',
      'Sync Notifications',
      channelDescription: 'Notification channel for Sync app',
      importance: Importance.max,
      priority: Priority.high,
    );

    const NotificationDetails notificationDetails = NotificationDetails(
      android: androidDetails,
    );

    await fln.show(0, title, body, notificationDetails);
  }
}

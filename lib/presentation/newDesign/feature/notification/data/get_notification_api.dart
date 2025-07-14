
import 'dart:convert';
import 'package:awesome_dialog/awesome_dialog.dart';  // استبدال الاستيراد
import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:essmohr/application/app_prefs.dart';
import 'package:essmohr/application/constants.dart';
import 'package:essmohr/application/di.dart';
import 'package:essmohr/domain/model/model.dart';
import 'package:http/http.dart' as http;

import 'package:essmohr/presentation/Notification.dart';



class GetNotificationData
{
  String? userId;
  final AppPreferences _appPreferences = instance<AppPreferences>();

  final formKey = GlobalKey<FormState>();
  List<NotificationModel>? notifications;
  Notifications notify = Notifications();

  // Future<List<NotificationModel>?> getApiNotification() async {
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
  //   final responseData = json.decode(response.body);
  //   if (responseData != null) {
  //     var userNotifications = responseData as List;
  //     a = userNotifications.map((data) => NotificationModel.fromJson(data)).toList();
  //     notifications = List<NotificationModel>.from(a as Iterable);
  //     if (notifications != null) {
  //       await getUnseenNotificationId(notifications!);
  //     }
  //     return notifications;
  //   }
  //   return null;
  // }

  Future<List<NotificationModel>?> getApiNotification() async {
    userId = await _appPreferences.getUserToken();

    // ✅ Step 1: Check cache validity
    if (await AppPreferences.isCacheValid()) {
      notifications = await AppPreferences.getFromCache();
      return notifications;
    }

    // ✅ Step 2: Get from API if no valid cache
    var uri = Uri.parse(Constants.getNotificationUrl);
    var response = await http.get(
      uri,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'userId': userId!
      },
    );

    final responseData = json.decode(response.body);
    if (responseData != null) {
      var userNotifications = responseData as List;
      final a = userNotifications.map((data) => NotificationModel.fromJson(data)).toList();

      notifications = List<NotificationModel>.from(a);

      // ✅ Step 3: Save to cache
      await AppPreferences.saveToCache(notifications!);

      // ✅ Step 4: Mark unseen notifications
      await getUnseenNotificationId(notifications!);

      return notifications;
    }

    return null;
  }

  Future<void> getUnseenNotificationId(List<NotificationModel> notify) async {
    for (var item in notify) {
      if (item.seen == false) {
        await markNotificationAsSeen(item.id!);
      }
    }
  }

  Future<dynamic> getAttachment(int ids) async {
    userId = await _appPreferences.getUserToken();
    Uri uri;
    String url = Constants.getAttachmentUrl;

    uri = Uri.parse("$url" + "$ids");
    var response = await http.get(
        uri, headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'userId': userId!
    });

    final responseData = json.decode(response.body);

    if (responseData != null) {
      return responseData;
    }
  }

  Future<void> markNotificationAsSeen(int id) async {
    userId = await _appPreferences.getUserToken();
    Uri uri;
    String url = Constants.getMarkNotificationAsSeenUrl;

    uri = Uri.parse("$url/$id");
    var response = await http.get(
        uri, headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'userId': userId!
    });

    final responseData = json.decode(response.body);
    if (responseData != null) {
      //return seenFlag;
    }
  }
}


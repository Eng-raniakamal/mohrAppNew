//
//
//
//
//
// import 'dart:async';
//
// import 'package:flutter/material.dart';
// import 'package:mohr_hr/application/app_prefs.dart';
// import 'package:mohr_hr/application/constants.dart';
// import 'package:mohr_hr/application/di.dart';
// import 'package:mohr_hr/domain/model/model.dart';
// import 'package:mohr_hr/main.dart';
// import 'package:mohr_hr/presentation/Alert_Notification/ViewModel/notificationViewModel.dart';
// import 'package:mohr_hr/presentation/Notification.dart';
//
// class NotifiService extends StatefulWidget {
//   const NotifiService({Key? key}) : super(key: key);
//
//   @override
//   State<NotifiService> createState() => _NotifiServiceState();
//
//
// }
//
// class _NotifiServiceState extends State<NotifiService> {
//
//   Timer? timer;
//   final AppPreferences _appPreferences = instance<AppPreferences>();
//   NotificationData _notificationDataData=NotificationData();
//   List<NotificationModel>? notifications;
//   int? lengthOfList;
//
//   @override
//   void initState() {
//     super.initState();
//     timer = Timer.periodic(Duration(seconds: 15), (Timer t) => checkNewNotifications());
//   }
//
//   @override
//   void dispose() {
//     timer?.cancel();
//     super.dispose();
//   }
//
//
//   @override
//   Widget build(BuildContext context) {
//     return const Placeholder();
//   }
//
//
//   Future<void> checkNewNotifications() async {
//     notifications= await _notificationDataData.getApiNotification();
//     lengthOfList=notifications?.length;
//     int storedDataLength=await _appPreferences.getUserNotificationList() ;
//     if( lengthOfList!=null) {
//       if (storedDataLength == null) {
//         _appPreferences.setUserNotificationList(lengthOfList!);
//       }
//       else {
//         if (storedDataLength < lengthOfList!)
//           {
//             int different=lengthOfList!-storedDataLength;
//             Constants.notificationNumber=different;
//             Notifications.showBigTextNotification(title:"new message",body:different.toString()+"new message here",
//                 fln:flutterLocalNotificationsPlugin);
//           }
//       }
//     }
//
//     // do request here
//     setState((){
//       // change state according to result of request
//     });
//
//   }
//
// }

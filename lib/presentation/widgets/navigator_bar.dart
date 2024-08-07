import 'dart:convert';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dynamic_icon/flutter_dynamic_icon.dart';
import 'package:essmohr/application/app_prefs.dart';
import 'package:essmohr/application/constants.dart';
import 'package:essmohr/application/di.dart';
import 'package:essmohr/domain/model/model.dart';
import 'package:essmohr/main.dart';
import 'package:essmohr/presentation/Alert_Notification/ViewModel/notificationViewModel.dart';
import 'package:essmohr/presentation/Notification.dart';
import 'package:essmohr/presentation/resources/colors.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:essmohr/presentation/resources/routes.dart';
import 'package:http/http.dart' as http;
import 'package:essmohr/presentation/resources/strings_manager.dart';



// ignore: must_be_immutable
class NavigatorBar extends StatefulWidget {
  int index;
  int notificationNumber;
   NavigatorBar({
    Key? key,
    required this.index,required this.notificationNumber
  }) : super(key: key);

  @override
  State<NavigatorBar> createState() => _NavigatorBarState();
}

class _NavigatorBarState extends State<NavigatorBar> {
  final AppPreferences _appPreferences = instance<AppPreferences>();
  NotificationData _notificationData=NotificationData();
  List<NotificationModel>? notifications;
  late int lengthOfList;
  int different=0;
  int differentflag=0;
  int? storedDataLength;
  bool checked=false;
  int? notificationNumber=0;
  bool _isdispose=false;

  @override
  void initState() {
    checkNewNotifications();
    getnotification();

    super.initState();
     setState(() {
       notificationNumber= Constants.notificationNumber;
     });
  }

  @override
  void dispose() {
    _isdispose=false;
    super.dispose();

  }

  @override
  Widget build(BuildContext context) {
    checkNewNotifications();
    getnotification();
    setState(() {
      notificationNumber= Constants.notificationNumber;
    });

    final items=<Widget>

    [
      const Icon(Icons.person,size: 30,color: colorManager.white,),
      const Icon(Icons.home,size: 30,color: colorManager.white),
      notificationIcon(notificationNumber!),
];
    return CurvedNavigationBar(
      height: 50,
      index: widget.index,
      items: items,

      buttonBackgroundColor: colorManager.primary,
      backgroundColor: Colors.transparent,
      color: colorManager.primary,


      onTap: (int index) {
        setState(() {
          notificationNumber=Constants.notificationNumber;
        });
        changeRoute(index);

      }

      ,

    );
  }
  Widget notificationIcon(int notificationNumber) {
    setState(() {
      notificationNumber= Constants.notificationNumber;
    });

    if (Constants.notificationNumber == 0) {
      return Icon(Icons.notifications, size: 30, color: colorManager.white);
    }
    else {

      return Stack(
        children: [
          Icon(Icons.notifications, size: 30, color: colorManager.white),
          Positioned(
            right: 0,
            child: Container(
              padding: const EdgeInsets.all(1),
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(6),
              ),
              constraints: const BoxConstraints(
                minWidth: 12,
                minHeight: 12,
              ),
               child:
                    Text(
                      '$notificationNumber',
                      style: const TextStyle(
                      color: Colors.white,
                      fontSize: 8,
                    ),
                    textAlign: TextAlign.center,
                  )

              ),
            ),
          //)
        ],
      );
    }
  }

getnotification()
  async {
  if(notifications!=null) {
  lengthOfList = await _notificationData.getUnSeenNotification(notifications!);
  // setState(()
  // {
    Constants.notificationNumber = lengthOfList;
    notificationNumber = Constants.notificationNumber;
  // });
}
  }


  Future<void> checkNewNotifications() async {
    notifications= await getApiNotification();
    lengthOfList=await getUnSeenNotification(notifications!);
    // setState(()  {
    //   Constants.notificationNumber = lengthOfList;
    //   notificationNumber=Constants.notificationNumber;
    // });


    storedDataLength=await _appPreferences.getUserNotificationList() ;
    if(lengthOfList!=storedDataLength)
    {
      setState(()  {
        Constants.notificationNumber = lengthOfList;
      });
      if(Constants.notificationNumber!=0)
      {
        // ignore: use_build_context_synchronously
        setBatchNumber(context, lengthOfList);
        Notifications.showBigTextNotification(
            title: "MOHR", body: "$lengthOfList"+" "+AppStrings.new_message_here.tr(),
            fln: flutterLocalNotificationsPlugin );

        _appPreferences.setUserNotificationList(lengthOfList);
        setState(() {
          notificationNumber=Constants.notificationNumber;
        });
      }
    }
    else{
     // setState(()  {
        Constants.notificationNumber = lengthOfList;
      //});

      _appPreferences.setUserNotificationList(lengthOfList);
    }


  }

  Future <List<NotificationModel>?> getApiNotification() async
  {
    String userId = await _appPreferences.getUserToken();
    var uri = Uri.parse(Constants.getNotificationUrl);
    List<NotificationModel>? a;

    var response = await http.get(
        uri, headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'userId': userId
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


  Future <int> getUnSeenNotification(List<NotificationModel> notifyList) async
  {
    int unSeenMessage=0;

    for(var i = 0; i < notifyList.length; i++)
    {
      if(notifyList[i].seen==false)
      {
        setState(() {
        unSeenMessage++;
      });
      }

    }

      Constants.notificationNumber= unSeenMessage;
       //FlutterDynamicIcon.setApplicationIconBadgeNumber(unSeenMessage);

   // setBatchNumber(context,unSeenMessage);
    return unSeenMessage;
  }

  setBatchNumber(BuildContext context, int num) async {
    try {
      if(num!=0) {
        await FlutterDynamicIcon.setApplicationIconBadgeNumber(num);
      }
    } on PlatformException {
      print('Exception:Platform not supported');
    } catch (e) {
      print(e);
    }
  }



//  Future<void> checkNewNotifications() async {
 // String userId = await _appPreferences.getUserToken();
 //    notifications= await _notificationData.getApiNotification(userId);
 //    //lengthOfList=notifications?.length;
 //
 //    lengthOfList=await _notificationData.getUnSeenNotification(notifications!);
 //    storedDataLength=await _appPreferences.getUserNotificationList() ;
 //    _appPreferences.setUserNotificationList(lengthOfList);
 //
 //    if( lengthOfList!=null) {
 //      if (storedDataLength == 0) {
 //        _appPreferences.setUserNotificationList(lengthOfList!);
 //        storedDataLength=await _appPreferences.getUserNotificationList() ;
 //        setState(() {
 //          Constants.notificationNumber = storedDataLength!;
 //        });
 //        // Notifications.showBigTextNotification(
 //        //     title: "MOHR", body: "${storedDataLength} new message here",
 //        //     fln: flutterLocalNotificationsPlugin );
 //      }
 //      else {
 //        if (storedDataLength! < lengthOfList!) {
 //          different = lengthOfList! - storedDataLength!;
 //          Constants.notificationNumber = different;
 //          _appPreferences.setUserNotificationList(lengthOfList!);
 //          differentflag = different;
 //          setState(() {
 //            Constants.notificationNumber = different;
 //          });
 //
 //          // Notifications.showBigTextNotification(
 //          //     title: "MOHR", body: "${different}new message here",
 //          //     fln: flutterLocalNotificationsPlugin);
 //        }
 //      }
 //    }
 //    // }
 //
 //    // // do request here
 //    // setState(() {
 //    //   Constants.notificationNumber=different;
 //    // });
 //
 //  }
  changeRoute(int index) async {
   // await Future.delayed(Duration(milliseconds: 500), () {
      if (index == 0) {
          Navigator.of(context).pushReplacementNamed(Routes.editProfileRoute);
      }
      else if (index == 1) {
          Navigator.of(context).pushReplacementNamed(Routes.homeRoute);
      }
      else if (index == 2) {
        Constants.notificationNumber=0;
          Navigator.of(context).pushReplacementNamed(Routes.notification);
      }
    }
    //);
  //}

}

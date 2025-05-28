import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:easy_localization/easy_localization.dart';

import 'package:flutter/material.dart';


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
import 'package:flutter_app_badger/flutter_app_badger.dart';
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

class _NavigatorBarState extends State<NavigatorBar>
{
  final AppPreferences _appPreferences = instance<AppPreferences>();
  final NotificationData _notificationData=NotificationData();
  List<NotificationModel>? notifications;
   int? lengthOfList;
  int different=0;
  int differentFlag=0;
  int? storedDataLength;
  bool checked=false;
  int? notificationNumber;
  bool _isDispose=false;
  List<AlertModel>? noOfAlert;
  int? alertNumber = 0;
  int?all=0;

  @override
  void initState() {
    //checkNewNotifications();
   // getnotification();
    //storedDataLength=_appPreferences.getUserNotificationList() as int?;
    init();
    super.initState();
     setState(() {

     });
  }

  Future<void> init() async {
    storedDataLength=await _appPreferences.getUserNotificationList() ;
  }

  @override
  void dispose() {
    _isDispose=true;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    checkNewNotifications();
    //getNotification();
    setState(() {
      notificationNumber= storedDataLength;
    });

    final items=<Widget>

    [
      const Icon(Icons.person,size: 30,color: colorManager.white,),
      const Icon(Icons.home,size: 30,color: colorManager.white),
      notificationIcon( notificationNumber! ),
];
    return CurvedNavigationBar(
      height: 50,
      index: widget.index,
      items: items,
      buttonBackgroundColor: colorManager.primary,
      backgroundColor: Colors.transparent,
      color: colorManager.primary,


      onTap: (int index) {
        setState(()  {
          notificationNumber=Constants.notificationNumber ;
        });
        changeRoute(index);
      }
      ,
    );
  }

  Widget notificationIcon(int notificationNumber) {
    // setState((){
    //   notificationNumber= Constants.notificationNumber ;
    // });

    if (notificationNumber == 0) {
      return Icon(Icons.notifications_none, size: 30, color: colorManager.white);
    }
    else {

      return Stack(
        children: [
          Icon(Icons.notifications_none, size: 30, color: colorManager.white),
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

  getNotification() async {
  lengthOfList = (await _notificationData.getUnSeenNotificationAndAlerts())!;
  _appPreferences.setUserNotificationList(lengthOfList!);
   setState(()
   {
    Constants.notificationNumber = lengthOfList!;
    notificationNumber = lengthOfList;
   });

  }

  Future<void> checkNewNotifications() async {
    //notifications= await getApiNotification();
   int? lengthOfLists=await getUnSeenNotificationAndAlerts();
    // setState(()  {
    //   Constants.notificationNumber = lengthOfList;
    //   notificationNumber=Constants.notificationNumber;
    // });


    storedDataLength=await _appPreferences.getUserNotificationList() ;
    if(lengthOfLists!=storedDataLength)
    {
      if(mounted){
      setState(()  {
        Constants.notificationNumber = lengthOfLists!;
        _appPreferences.setUserNotificationList(lengthOfLists);
      });}
      if(Constants.notificationNumber!=0)
      {

        setBatchNumber(context, lengthOfLists!);
        Notifications.showBigTextNotification(
            title: "MOHR", body: "$lengthOfLists ${AppStrings.new_message_here.tr()}",
            fln: flutterLocalNotificationsPlugin );

        _appPreferences.setUserNotificationList(lengthOfLists);
        notificationNumber=await _appPreferences.getUserNotificationList() ;
        setState(() {
          notificationNumber = notificationNumber ;
        });
      }
    }
    else{
     // setState(()  {
        Constants.notificationNumber = lengthOfLists!;
      //});

      _appPreferences.setUserNotificationList(lengthOfLists);
    }


  }

  Future <List<NotificationModel>?> getApiNotification() async {
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
    } catch (e) {
      print('General Error: $e');
      throw Exception('Failed');
    }

}

  Future<List<AlertModel>?> getApiAlerts() async {

    String userId = await _appPreferences.getUserToken();
    var uri = Uri.parse(Constants.getAlertUrl);

    var response = await http.get(uri, headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'userId': userId
    });

    final responseData = json.decode(response.body);
    if (responseData != null && responseData is List) {
      List<AlertModel> alerts = responseData
          .map((data) => AlertModel.fromJson(data as Map<String, dynamic>))
          .toList();
      return alerts;
    }
    return null;
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

  Future<int?> getUnSeenNotificationAndAlerts()async {
    notifications = await getApiNotification();
   int lengthOfLists = await getUnSeenNotification(notifications!);
    noOfAlert= await getApiAlerts();
    alertNumber=await getNumberOfAlerts(noOfAlert!);

    all=  lengthOfLists + alertNumber!;
    setState(() {
      Constants.notificationNumber = all!;
    });
    if (Constants.notificationNumber != 0) {
      setBatchNumber(context, all!);
    }
    return all;
  }

  Future <int> getUnSeenNotification(List<NotificationModel> notifyList) async {
    int unSeenMessage=0;
    for(var i = 0; i < notifyList.length; i++)
    {
      if(notifyList[i].seen==false)
      {if(mounted) {
        setState(() {
          unSeenMessage++;
        });
      }
      }

    }

      Constants.notificationNumber= unSeenMessage;
       //FlutterDynamicIcon.setApplicationIconBadgeNumber(unSeenMessage);
if(mounted)
  {
  //  setBatchNumber(context,_appPreferences.getUserNotificationList() );
    }
    return unSeenMessage;
  }

  setBatchNumber(BuildContext context, int num) async {
    try {
      if(num!=0) {
       // await FlutterDynamicIcon.setApplicationIconBadgeNumber(num);
         FlutterAppBadger.updateBadgeCount(num);
      }
    // } on PlatformException {
    //   print();
    } catch (e) {
      print(e);
    }
  }

  changeRoute(int index) async {
   // await Future.delayed(Duration(milliseconds: 500), () {
      if (index == 0) {
          Navigator.of(context).pushNamed(Routes.editProfileRoute);
      }
      else if (index == 1) {
          Navigator.of(context).pushNamed(Routes.homeRoute);
      }
      else if (index == 2) {
        Constants.notificationNumber=0;
          Navigator.of(context).pushNamed(Routes.notification);
      }
    }

}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mohr_hr/application/app_prefs.dart';
import 'package:mohr_hr/application/constants.dart';
import 'package:mohr_hr/application/di.dart';
import 'package:mohr_hr/domain/model/model.dart';
import 'package:mohr_hr/main.dart';
import 'package:mohr_hr/presentation/Alert_Notification/ViewModel/notificationViewModel.dart';
import 'package:mohr_hr/presentation/Notification.dart';
import 'package:mohr_hr/presentation/resources/colors.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:mohr_hr/presentation/resources/routes.dart';


//
// final items=<Widget>
// [ const Icon(Icons.person,size: 30,color: colorManager.white,),
//   const Icon(Icons.home,size: 30,color: colorManager.white),
//   notificationIcon(),
// ];
// CurvedNavigationBar buildNavigatorBar(BuildContext context,int selectedIndex) {
//
//   return CurvedNavigationBar(
//     height: 50,
//      index: selectedIndex,
//       items: items,
//
//         buttonBackgroundColor: colorManager.primary,
//         backgroundColor: Colors.transparent,
//         color: colorManager.primary,
//
//
//         onTap: (int index) {
//           if(index==1)
//           {
//             // changeIndex(index);
//             Navigator.of(context).pushReplacementNamed(Routes.HomeRoute);
//           }
//           else
//           if(index==2)
//           {
//             Navigator.of(context).pushReplacementNamed(Routes.notification);
//           }
//           else
//           if(index==0)
//           {
//             Navigator.of(context).pushReplacementNamed(Routes.editProfileRoute);
//           }
//         }
//
//       ,
//
//   );
//
//
//
//
//
// }
//


class NavigatorBar extends StatefulWidget {
  int index;
   NavigatorBar({
    Key? key,
    required this.index,
  }) : super(key: key);

  @override
  State<NavigatorBar> createState() => _NavigatorBarState();
}

class _NavigatorBarState extends State<NavigatorBar> {
  final AppPreferences _appPreferences = instance<AppPreferences>();
  NotificationData _notificationData=NotificationData();
  List<NotificationModel>? notifications;
  int? lengthOfList;
  int different=0;
  int differentflag=0;
  int? storedDataLength;
  bool checked=false;

  @override
  void initState() {

    super.initState();
    setState(() {
      Constants.notificationNumber;
    });
  }

  @override
  Widget build(BuildContext context) {

    final items=<Widget>

    [
      const Icon(Icons.person,size: 30,color: colorManager.white,),
      const Icon(Icons.home,size: 30,color: colorManager.white),
      notificationIcon(),
];
    return CurvedNavigationBar(
      height: 50,
      index: widget.index,
      items: items,

      buttonBackgroundColor: colorManager.primary,
      backgroundColor: Colors.transparent,
      color: colorManager.primary,


      onTap: (int index) {
        if (index == 1) {
          // changeIndex(index);
          Navigator.of(context).pushReplacementNamed(Routes.HomeRoute);
        }
        else if (index == 2) {
          Constants.notificationNumber=0;
          Navigator.of(context).pushReplacementNamed(Routes.notification);
        }
        else if (index == 0) {
          Navigator.of(context).pushReplacementNamed(Routes.editProfileRoute);
        }
      }

      ,

    );
  }
  Widget notificationIcon() {

    if (Constants.notificationNumber == 0) {
      return Icon(Icons.notifications, size: 30, color: colorManager.white);
    }
    else {
      return Stack(
        children: [
          const Icon(Icons.notifications, size: 30, color: colorManager.white),
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
                      Constants.notificationNumber.toString(),
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
  // Widget _NotificationIcon(){
  //   return
  //     FutureBuilder(
  //         future:_notificationData.getUnSeenNotification(notifications!),
  //         builder:(context,snapshot) {
  //           switch (snapshot.connectionState) {
  //             case ConnectionState.waiting:
  //               return const Center(
  //                  child:CircularProgressIndicator()
  //               );
  //             default:
  //               if (snapshot.hasError)
  //                 return Text('Error: ${snapshot.error}');
  //               else {
  //                 return notificationIcon(lengthOfList)
  //                 ;
  //               }
  //           }
  //         });
  // }
getnotification()
  async {lengthOfList=await _notificationData.getUnSeenNotification(notifications!);
  }

  Future<void> checkNewNotifications() async {

    notifications= await _notificationData.getApiNotification();
    //lengthOfList=notifications?.length;

    lengthOfList=await _notificationData.getUnSeenNotification(notifications!);
    storedDataLength=await _appPreferences.getUserNotificationList() ;
    _appPreferences.setUserNotificationList(lengthOfList!);

    if( lengthOfList!=null) {
      if (storedDataLength == 0) {
        _appPreferences.setUserNotificationList(lengthOfList!);
        storedDataLength=await _appPreferences.getUserNotificationList() ;
        setState(() {
          Constants.notificationNumber = storedDataLength!;
        });
        // Notifications.showBigTextNotification(
        //     title: "MOHR", body: "${storedDataLength} new message here",
        //     fln: flutterLocalNotificationsPlugin );
      }
      else {
        if (storedDataLength! < lengthOfList!) {
          different = lengthOfList! - storedDataLength!;
          Constants.notificationNumber = different;
          _appPreferences.setUserNotificationList(lengthOfList!);
          differentflag = different;
          setState(() {
            Constants.notificationNumber = different;
          });

          // Notifications.showBigTextNotification(
          //     title: "MOHR", body: "${different}new message here",
          //     fln: flutterLocalNotificationsPlugin);
        }
      }
    }
    // }

    // // do request here
    // setState(() {
    //   Constants.notificationNumber=different;
    // });

  }

}

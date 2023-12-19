
import 'dart:async';
import 'dart:convert';
import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dynamic_icon/flutter_dynamic_icon.dart';
import 'package:mohr_hr/application/app_prefs.dart';
import 'package:mohr_hr/application/constants.dart';
import 'package:mohr_hr/application/core.dart';
import 'package:mohr_hr/application/di.dart';
import 'package:mohr_hr/domain/model/model.dart';
import 'package:mohr_hr/domain/model/user_preferences.dart';
import 'package:mohr_hr/main.dart';
import 'package:mohr_hr/presentation/Alert_Notification/ViewModel/notificationViewModel.dart';
import 'package:mohr_hr/presentation/Attendance/view/attendanceAlert.dart';
import 'package:mohr_hr/presentation/Notification.dart';
import 'package:mohr_hr/presentation/resources/themes.dart';
import 'package:mohr_hr/presentation/resources/routes.dart';
import 'package:mohr_hr/presentation/splash/splash.dart';
import 'package:workmanager/workmanager.dart';
import 'package:http/http.dart' as http;

// ignore: must_be_immutable
class MyApp extends StatefulWidget {
 // const MyApp({Key? key}) : super(key: key); //default constructor

  //named constructor
   MyApp._internal();
   int appState=0;
   static final MyApp instance =  MyApp._internal(); //single instance
   factory MyApp() =>instance; //factory for the class instance

   @override
   _MyAppState createState() => _MyAppState();

}

class _MyAppState extends State<MyApp> {

  final AppPreferences _appPreferences = instance<AppPreferences>();
  Timer? timer;
  List<NotificationModel>? notifications;
  int? lengthOfList;
  int different=0;
  int differentflag=0;
  bool checked=false;
  int? storedDataLength;


  @override
  void didChangeDependencies() {
    _appPreferences.getLocal().then((local) => {context.setLocale(local)});
    super.didChangeDependencies();
  }



  @override
  void initState()
  {
  //_bind();

    Notifications.initialize(flutterLocalNotificationsPlugin);
    super.initState();

    timer = Timer.periodic(const Duration(minutes: 1), (
         Timer t) async => await checkNewNotifications());

    Workmanager().registerPeriodicTask("5", "New MOHR Notifications",
        existingWorkPolicy: ExistingWorkPolicy.append,

        frequency: Duration(minutes: 15),//when should it check the link
        initialDelay: Duration(seconds: 5),//duration before showing the notification
        constraints: Constraints(
          networkType: NetworkType.connected,
          requiresCharging: false,
        ));


}

  Future<void> checkNewNotifications() async {

    notifications= await getApiNotification();
    lengthOfList=await getUnSeenNotification(notifications!);
    Constants.notificationNumber = lengthOfList!;


    if( lengthOfList!=null) {

         storedDataLength=await _appPreferences.getUserNotificationList() ;

         if(lengthOfList!=storedDataLength)
           {
          setState(()  {
          Constants.notificationNumber = lengthOfList!;
        });
          if(Constants.notificationNumber!=0)
            {
          //setBatchNumber(context, Constants.notificationNumber);
          Notifications.showBigTextNotification(
            title: "MOHR", body: "$lengthOfList new message here",
            fln: flutterLocalNotificationsPlugin );

         _appPreferences.setUserNotificationList(lengthOfList!);
         }
           }
          else{
           setState(()  {
             Constants.notificationNumber = lengthOfList!;
           });

           _appPreferences.setUserNotificationList(lengthOfList!);
         }

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
    setState(() {
      Constants.notificationNumber= unSeenMessage;
    });
    setBatchNumber(context,unSeenMessage);
    return unSeenMessage;
  }

  setBatchNumber(BuildContext context, int num) async {
    try {
      await FlutterDynamicIcon.setApplicationIconBadgeNumber(num);
    } on PlatformException {
      print('Exception:Platform not supported');
    } catch (e) {
      print(e);
    }
  }


  @override
  Widget build(BuildContext? context) {
    final user = UserPreferences.myUser;
    //bool darkMode= false;
    return
      ThemeProvider(
      initTheme: user.isDarkMode! ? MyThemes.darkTheme : MyThemes.lightTheme,
      child: Builder(
        builder: (context) =>
             MaterialApp(
               localizationsDelegates: context.localizationDelegates,
               debugShowCheckedModeBanner: false,
               supportedLocales: context.supportedLocales,
               locale: context.locale,
               onGenerateRoute: RouteGenerator.getRoute,
               home: SplashView(),
                title: "Mohr")
            ),
      )
    ;
  }
}

class LocaleModel extends ChangeNotifier {
  Locale? _locale;

  Locale? get locale => _locale;

  void set(Locale locale) {
    _locale = locale;
    notifyListeners();
  }
}

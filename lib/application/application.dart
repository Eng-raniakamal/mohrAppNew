import 'dart:async';
import 'dart:convert';
import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app_badger/flutter_app_badger.dart';
//import 'package:flutter_dynamic_icon/flutter_dynamic_icon.dart';
import 'package:essmohr/application/app_prefs.dart';
import 'package:essmohr/application/constants.dart';
import 'package:essmohr/application/di.dart';
import 'package:essmohr/domain/model/model.dart';
import 'package:essmohr/domain/model/user_preferences.dart';
import 'package:essmohr/main.dart';
import 'package:essmohr/presentation/Notification.dart';
import 'package:essmohr/presentation/resources/themes.dart';
import 'package:essmohr/presentation/resources/routes.dart';
import 'package:essmohr/presentation/splash/splash.dart';
//import 'package:workmanager/workmanager.dart';
import 'package:http/http.dart' as http;
import '../presentation/resources/strings_manager.dart';
//


// ignore: must_be_immutable
class MyApp extends StatefulWidget {
  // const MyApp({Key? key}) : super(key: key); //default constructor

  //named constructor
  MyApp._internal();
  int appState = 0;
  static final MyApp instance = MyApp._internal(); //single instance
  factory MyApp() => instance; //factory for the class instance

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final AppPreferences _appPreferences = instance<AppPreferences>();
  Timer? timer;
  List<NotificationModel>? notifications;
  int? lengthOfList = 0;
  List<AlertModel>? noOfAlert;
  int? alertNumber = 0;
  int?all=0;
  int different = 0;
  int differentflag = 0;
  bool checked = false;
  int? storedDataLength = 0;

  @override
  void didChangeDependencies() {
    _appPreferences.getLocal().then((local) => {context.setLocale(local)});
    super.didChangeDependencies();
  }

  @override
  void initState() {
    //_bind();

    Notifications.initialize(flutterLocalNotificationsPlugin);
    super.initState();
    if (mounted) {

      timer = Timer.periodic(const Duration(minutes: 3),
              (Timer t) async => await checkNewNotifications());
    }
    // Workmanager().registerPeriodicTask("1", AppStrings.new_message_here.tr(),
    //     existingWorkPolicy: ExistingWorkPolicy.replace,
    //     frequency: const Duration(minutes: 15), //when should it check the link
    //     initialDelay: const Duration(
    //         seconds: 1), //duration before showing the notification
    //     constraints: Constraints(
    //         networkType: NetworkType.connected, requiresCharging: false));
  }
  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  Future<void> checkNewNotifications() async {
    // notifications = await getApiNotification();
    // lengthOfList = await getUnSeenNotification(notifications!);
    all=await getUnSeenNotificationAndAlerts();

    setState(() {
      Constants.notificationNumber = all!;
    });

    if (all != null) {
      storedDataLength = await _appPreferences.getUserNotificationList();

      if (all != storedDataLength) {
        setState(() {
          Constants.notificationNumber = all!;
        });
        if (Constants.notificationNumber != 0) {
          setBatchNumber(context, all!);
          Notifications.showBigTextNotification(
              title: "MOHR",
              body:  "$all" + " " + AppStrings.new_message_here.tr(),
              fln: flutterLocalNotificationsPlugin);
          _appPreferences.setUserNotificationList(all!);
        }
      } else {
        setState(() {
          Constants.notificationNumber = all!;
        });

        _appPreferences.setUserNotificationList(all!);
      }
    }
  }

  Future<List<NotificationModel>?> getApiNotification() async {
    String userId = await _appPreferences.getUserToken();
    var uri = Uri.parse(Constants.getNotificationUrl);
    List<dynamic>? a;

    var response = await http.get(uri, headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'userId': userId
    });
//fromJson(jsonresponse[0]);
    final responseData = json.decode(response.body);
    if (responseData != null) {
      var userNotifications = responseData! ;

      a = userNotifications
          .map((data) {
            return NotificationModel.fromJson(data as Map<String, dynamic>);
          })
          .toList();
      var notifications = List<NotificationModel>.from(a as Iterable);
      return notifications;
    }
    return null;
  }

  Future<List<AlertModel>?> getApiAlerts() async {
    String userId = await _appPreferences.getUserToken();
    var uri = Uri.parse(Constants.getAlertUrl);
    List<AlertModel>? a;

    var response = await http.get(uri, headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'userId': userId
    });

    final responseData = json.decode(response.body);
    if (responseData != null) {
      var userNotifications = responseData as List;
      a = userNotifications
          .map((data) => AlertModel.fromJson(data))
          .toList();
      var Alerts = List<AlertModel>.from(a as Iterable);
      return Alerts;
    }
    return null;
  }

  Future<int> getUnSeenNotification(List<NotificationModel> notifiList) async {
    int unSeenMessage = 0;

    for (var i = 0; i < notifiList.length; i++) {
      if (notifiList[i].seen == false) {
        unSeenMessage++;
      }
    }

    return unSeenMessage;
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

  Future<int?> getUnSeenNotificationAndAlerts()async
  {
    notifications = await getApiNotification();
    lengthOfList = await getUnSeenNotification(notifications!);
    noOfAlert= await getApiAlerts();
    alertNumber=await getNumberOfAlerts(noOfAlert!);

     all=  lengthOfList! + alertNumber!;
    setState(() {
      Constants.notificationNumber = all!;
    });
    if (Constants.notificationNumber != 0) {
      setBatchNumber(context, all!);
    }
    return all;
  }

  setBatchNumber(BuildContext context, int num) async  {
    try {
      if (num != 0) {
        //await FlutterDynamicIcon.setApplicationIconBadgeNumber(num);
        await FlutterAppBadger.updateBadgeCount(num);
      }
    } on PlatformException {
     print('Exception:Platform not supported');
    }
    catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext? context) {
    const user = UserPreferences.myUser;
    //bool darkMode= false;

    return ThemeProvider(
      initTheme: user.isDarkMode! ? MyThemes.darkTheme : MyThemes.lightTheme,
      child: Builder(
          builder: (context) {

            return MaterialApp(
                localizationsDelegates: context.localizationDelegates,
                debugShowCheckedModeBanner: false,
                supportedLocales: context.supportedLocales,
                locale: context.locale,
                onGenerateRoute: RouteGenerator.getRoute,
                home:  SplashView(),
                title: "Mohr",
              );
          }),
    );
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

//import 'package:flutter_background_service/flutter_background_service.dart';


// class MyApp extends StatefulWidget {
//   // named constructor
//   MyApp._internal();
//   int appState = 0;
//   static final MyApp instance = MyApp._internal(); //single instance
//   factory MyApp() => instance; //factory for the class instance
//
//   @override
//   _MyAppState createState() => _MyAppState();
// }
//
// class _MyAppState extends State<MyApp> {
//   final AppPreferences _appPreferences = instance<AppPreferences>();
//   Timer? timer;
//   List<NotificationModel>? notifications;
//   int? lengthOfList = 0;
//   List<AlertModel>? noOfAlert;
//   int? alertNumber = 0;
//   int? all = 0;
//   int different = 0;
//   int differentflag = 0;
//   bool checked = false;
//   int? storedDataLength = 0;
//
//   @override
//   void didChangeDependencies() {
//     _appPreferences.getLocal().then((local) => {context.setLocale(local)});
//     super.didChangeDependencies();
//   }
//
//   @override
//   void initState() {
//     super.initState();
//
//     // Initialize the background service
//     _initializeBackgroundService();
//
//     // Initialize Flutter Local Notifications
//     Notifications.initialize(flutterLocalNotificationsPlugin);
//
//     // Start a timer to periodically check for new notifications
//     if (mounted) {
//       timer = Timer.periodic(const Duration(minutes: 3),
//               (Timer t) async => await checkNewNotifications());
//     }
//   }
//
//   @override
//   void dispose() {
//     timer?.cancel();
//     super.dispose();
//   }
//
//
//   void _initializeBackgroundService() {
//     // Configure the background service
//     FlutterBackgroundService().configure(
//       androidConfiguration: AndroidConfiguration(
//         // When service starts
//         onStart: _onBackgroundServiceStarted, // Pass function that matches the signature
//         initialNotificationTitle: 'Background Service',
//         initialNotificationContent: 'Service is running in the background',
//        // notificationIcon: 'resource_icon', // Replace with your own notification icon
//         isForegroundMode: true,  // This is the important parameter to make the service run in the foreground
//       ),
//       iosConfiguration: IosConfiguration(
//         onForeground: _onBackgroundServiceStarted,  // Running when the app is in the foreground
//         onBackground: _onBackgroundServiceStarted,
//
//         // Running when the app is in the background
//         autoStart: true,  // Ensure iOS also runs the service in the foreground
//       ),
//     );
//
//     // Start the service
//     FlutterBackgroundService().startService();
//   }
//
// // This function now returns Future<bool> (as required)
//   Future<bool> _onBackgroundServiceStarted(ServiceInstance service) async {
//     // This is where you define what the service will do in the background
//     service.onDataReceived.listen((event) {
//       // Handle data or actions when received in background
//       print("Background service is running");
//
//       // Add your periodic tasks here, e.g., checking notifications
//       Timer.periodic(Duration(minutes: 15), (timer) async {
//         print("Checking notifications...");
//         await checkNewNotifications(); // Call your function to check for notifications
//       });
//     });
//
//     // Return true to indicate that the service has started successfully
//     return true;
//   }
//
//
//
//   Future<void> checkNewNotifications() async {
//     all = await getUnSeenNotificationAndAlerts();
//
//     setState(() {
//       Constants.notificationNumber = all!;
//     });
//
//     if (all != null) {
//       storedDataLength = await _appPreferences.getUserNotificationList();
//
//       if (all != storedDataLength) {
//         setState(() {
//           Constants.notificationNumber = all!;
//         });
//         if (Constants.notificationNumber != 0) {
//           setBatchNumber(context, all!);
//           Notifications.showBigTextNotification(
//               title: "MOHR",
//               body: "$all" + " " + AppStrings.new_message_here.tr(),
//               fln: flutterLocalNotificationsPlugin);
//           _appPreferences.setUserNotificationList(all!);
//         }
//       } else {
//         setState(() {
//           Constants.notificationNumber = all!;
//         });
//
//         _appPreferences.setUserNotificationList(all!);
//       }
//     }
//   }
//
//   Future<int?> getUnSeenNotificationAndAlerts() async {
//     notifications = await getApiNotification();
//     lengthOfList = await getUnSeenNotification(notifications!);
//     noOfAlert = await getApiAlerts();
//     alertNumber = await getNumberOfAlerts(noOfAlert!);
//
//     all = lengthOfList! + alertNumber!;
//     setState(() {
//       Constants.notificationNumber = all!;
//     });
//     if (Constants.notificationNumber != 0) {
//       setBatchNumber(context, all!);
//     }
//     return all;
//   }
//
//   Future<List<NotificationModel>?> getApiNotification() async {
//     String userId = await _appPreferences.getUserToken();
//     var uri = Uri.parse(Constants.getNotificationUrl);
//     List<dynamic>? a;
//
//     var response = await http.get(uri, headers: <String, String>{
//       'Content-Type': 'application/json; charset=UTF-8',
//       'userId': userId
//     });
//
//     final responseData = json.decode(response.body);
//     if (responseData != null) {
//       var userNotifications = responseData!;
//
//       a = userNotifications
//           .map((data) {
//         return NotificationModel.fromJson(data as Map<String, dynamic>);
//       })
//           .toList();
//       var notifications = List<NotificationModel>.from(a as Iterable);
//       return notifications;
//     }
//     return null;
//   }
//
//   Future<List<AlertModel>?> getApiAlerts() async {
//     String userId = await _appPreferences.getUserToken();
//     var uri = Uri.parse(Constants.getAlertUrl);
//     List<AlertModel>? a;
//
//     var response = await http.get(uri, headers: <String, String>{
//       'Content-Type': 'application/json; charset=UTF-8',
//       'userId': userId
//     });
//
//     final responseData = json.decode(response.body);
//     if (responseData != null) {
//       var userNotifications = responseData as List;
//       a = userNotifications
//           .map((data) => AlertModel.fromJson(data))
//           .toList();
//       var Alerts = List<AlertModel>.from(a as Iterable);
//       return Alerts;
//     }
//     return null;
//   }
//
//   Future<int> getUnSeenNotification(List<NotificationModel> notifiList) async {
//     int unSeenMessage = 0;
//
//     for (var i = 0; i < notifiList.length; i++) {
//       if (notifiList[i].seen == false) {
//         unSeenMessage++;
//       }
//     }
//
//     return unSeenMessage;
//   }
//
//   Future<int> getNumberOfAlerts(List<AlertModel> alertList) async {
//     int numberOfAlert = alertList.length;
//     return numberOfAlert;
//   }
//
//   setBatchNumber(BuildContext context, int num) async {
//     try {
//       if (num != 0) {
//         //await FlutterDynamicIcon.setApplicationIconBadgeNumber(num);
//         await FlutterAppBadger.updateBadgeCount(num);
//       }
//     } on PlatformException {
//       print('Exception: Platform not supported');
//     } catch (e) {
//       print(e);
//     }
//   }
//
//   @override
//   Widget build(BuildContext? context) {
//     const user = UserPreferences.myUser;
//
//     return ThemeProvider(
//       initTheme: user.isDarkMode! ? MyThemes.darkTheme : MyThemes.lightTheme,
//       child: Builder(
//           builder: (context) {
//             return MaterialApp(
//               localizationsDelegates: context.localizationDelegates,
//               debugShowCheckedModeBanner: false,
//               supportedLocales: context.supportedLocales,
//               locale: context.locale,
//               onGenerateRoute: RouteGenerator.getRoute,
//               home: SplashView(),
//               title: "Mohr",
//             );
//           }),
//     );
//   }
// }
//
//
//
// extension on ServiceInstance {
//   get onDataReceived => null;
// }
//
// class LocaleModel extends ChangeNotifier {
//   Locale? _locale;
//   Locale? get locale => _locale;
//
//   void set(Locale locale) {
//     _locale = locale;
//     notifyListeners();
//   }
// }


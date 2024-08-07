import 'dart:async';
import 'dart:convert';
import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dynamic_icon/flutter_dynamic_icon.dart';
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
import 'package:workmanager/workmanager.dart';
import 'package:http/http.dart' as http;
import '../presentation/resources/strings_manager.dart';


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

    timer = Timer.periodic(const Duration(minutes: 1),
        (Timer t) async => await checkNewNotifications());

    Workmanager().registerPeriodicTask("1", AppStrings.new_message_here.tr(),
        existingWorkPolicy: ExistingWorkPolicy.replace,
        frequency: const Duration(minutes: 15), //when should it check the link
        initialDelay: const Duration(
            seconds: 1), //duration before showing the notification
        constraints: Constraints(
            networkType: NetworkType.connected, requiresCharging: false));
  }

  Future<void> checkNewNotifications() async {
    notifications = await getApiNotification();
    lengthOfList = await getUnSeenNotification(notifications!);
    setState(() {
      Constants.notificationNumber = lengthOfList!;
    });

    if (lengthOfList != null) {
      storedDataLength = await _appPreferences.getUserNotificationList();

      if (lengthOfList != storedDataLength) {
        setState(() {
          Constants.notificationNumber = lengthOfList!;
        });
        if (Constants.notificationNumber != 0) {
          setBatchNumber(context, lengthOfList!);
          Notifications.showBigTextNotification(
              title: "MOHR",
              body: "$lengthOfList" + " " + AppStrings.new_message_here.tr(),
              fln: flutterLocalNotificationsPlugin);
          _appPreferences.setUserNotificationList(lengthOfList!);
        }
      } else {
        setState(() {
          Constants.notificationNumber = lengthOfList!;
        });

        _appPreferences.setUserNotificationList(lengthOfList!);
      }
    }
  }

  Future<List<NotificationModel>?> getApiNotification() async {
    String userId = await _appPreferences.getUserToken();
    var uri = Uri.parse(Constants.getNotificationUrl);
    List<NotificationModel>? a;

    var response = await http.get(uri, headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'userId': userId
    });

    final responseData = json.decode(response.body);
    if (responseData != null) {
      var userNotifications = responseData as List;
      a = userNotifications
          .map((data) => NotificationModel.fromJson(data))
          .toList();
      var notifications = List<NotificationModel>.from(a as Iterable);
      return notifications;
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
    setState(() {
      Constants.notificationNumber = unSeenMessage;

    if (Constants.notificationNumber != 0) {
       setBatchNumber(context, unSeenMessage);
    }
    });
    return unSeenMessage;
  }

  setBatchNumber(BuildContext context, int num) async {
    try {
      if (num != 0) {
        await FlutterDynamicIcon.setApplicationIconBadgeNumber(num);
      }
    } on PlatformException {
      print('Exception:Platform not supported');
    } catch (e) {
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
                home: const SplashView(),
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

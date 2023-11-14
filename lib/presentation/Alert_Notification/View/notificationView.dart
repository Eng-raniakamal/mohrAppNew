import 'dart:convert';
import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:mohr_hr/application/app_prefs.dart';
import 'package:mohr_hr/application/constants.dart';
import 'package:mohr_hr/application/di.dart';
import 'package:mohr_hr/domain/model/model.dart';
import 'package:http/http.dart' as http;
import 'package:mohr_hr/main.dart';
import 'package:mohr_hr/presentation/Notification.dart';
import 'package:mohr_hr/presentation/resources/colors.dart';
import 'package:mohr_hr/presentation/resources/strings_manager.dart';



class NotificationView extends StatefulWidget {
  const NotificationView({super.key});
  @override
  State<NotificationView> createState() => _NotificationViewState();
}

class _NotificationViewState extends State<NotificationView> {

  String? userId;

  //bool isShowSignInDialog = false;

  final AppPreferences _appPreferences = instance<AppPreferences>();

  //final EmployeeSkillsViewModel _saveviewModel = instance<EmployeeSkillsViewModel>();
  final _Formkey = GlobalKey<FormState>();
  List<NotificationModel>? notifications;
  Notifications noti=Notifications();

  _bind() {
    //_appPreferences.setOnBoardingScreenViewed();
    // Notifications= await getApiNotification();
    start();
  }

  Future<void> start() async {
    notifications = await getApiNotification();
  }


  @override
  void initState() {
    //_bind();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return
      ThemeSwitchingArea(
          child: Builder(
              builder: (context) =>
                  Scaffold(
                    body:
                    Container(
                        padding: EdgeInsets.fromLTRB(40, 0, 30, 0),
                        child: SingleChildScrollView(
                          scrollDirection: Axis.vertical,
                          child: Column(
                            children: [
                              Notificationtable(),
                              //for notification test
                              // ElevatedButton(
                              //     onPressed: ()
                              //     {
                              //       Notifications.showBigTextNotification(title:"message",body:"new message here",
                              //           fln:flutterLocalNotificationsPlugin);
                              //     }, child: Text("click"))

                            ],
                          ),
                        )),

                  )
          ));
  }

  Widget _createMemoTable(List<NotificationModel>? notification) {
    if(notification?.isEmpty==false) {
      return DataTable(
        headingRowColor: MaterialStateColor.resolveWith((states) =>
        colorManager.lightprimary),
        columns: _createColumns(),
        rows: _createRows(notification),

      );
    }else
    {return
      Container(margin: const EdgeInsets.fromLTRB(40, 40, 30, 0),
        child: Text(AppStrings.noContent.tr(),style: TextStyle(color: Colors.orange),),);}
  }

  List<DataColumn> _createColumns() {
    return [
      DataColumn(
          label: Text("Date", style: TextStyle(color: colorManager.white),)),
      DataColumn(label: Text(
        "Title", style: TextStyle(color: colorManager.white),)),
      DataColumn(
          label: Text(AppStrings.details.tr(), style: TextStyle(color: colorManager.white),)),
      DataColumn(label: Text(
        "Notes", style: TextStyle(color: colorManager.white),)),
      DataColumn(
          label: Text("Attachments", style: TextStyle(color: colorManager.white),)),
      DataColumn(label: Text(
        "Canceled", style: TextStyle(color: colorManager.white),)),
      DataColumn(
          label: Text("Cancellation Reason", style: TextStyle(color: colorManager.white),)),
      DataColumn(label: Text(
        "Seen", style: TextStyle(color: colorManager.white),)),

    ];
  }
  List<DataRow> _createRows(List<NotificationModel>? notification) {
    return notification!
        .map((notificationItem) =>
        DataRow(cells: [
          DataCell(Text(_formatingDate(notificationItem.date).toString())),
          DataCell(Text((notificationItem.title).toString())),
          DataCell(Text(_textHandling(notificationItem.details).toString())),
          DataCell(Text(_textHandling(notificationItem.notes).toString())),
          DataCell(Text(_textHandling(notificationItem.attachments).toString())),
         // DataCell(_boolHandling(notificationItem.isCanceled)),
          DataCell(notificationItem.isCanceled == true ?
        Icon(Icons.check):Text("_")),
          DataCell(Text(_textHandling(notificationItem.cancellationReason).toString())),
           DataCell(notificationItem.seen == true ?
             Icon(Icons.check_box,color: Colors.blue,):Icon(Icons.close,color: Colors.grey))


          //DataCell(_boolHandling(notificationItem.seen)),

        ]))
        .toList();
  }
  Future <List<NotificationModel>?> getApiNotification() async
  {
    userId = await _appPreferences.getUserToken();
    var uri = Uri.parse(Constants.getNotificationUrl);
    List<NotificationModel>? a;

    var response = await http.get(
        uri, headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'userId': userId!
    });

    final responseData = json.decode(response.body);
    if (responseData != null) {
      var userNotifications = responseData as List;
      a = userNotifications.map((data) => NotificationModel.fromJson(data)).toList();
      notifications = List<NotificationModel>.from(a as Iterable);
      return notifications;
    }
    return null;
  }
  Widget Notificationtable() {
    return
      FutureBuilder(
          future: getApiNotification(),
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.waiting:
                return const Center(
                    child: CircularProgressIndicator());
              default:
                if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else {
                  return Center(
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Column(
                          children: [
                            _createMemoTable(notifications),
                          ],
                        ),
                      )
                  );
                }
            }
          }
      );
  }

 String _textHandling(String? text)
 {
   String txtResult;
   if(text==null) {
     txtResult="";
     return txtResult;
   }
   txtResult=text;
   return txtResult;
 }

  String? _formatingDate(String? date)
  {
    if(date!=null){
    String? formatingDate = date.split('T').first;
    return formatingDate;}
    return null;
  }

  Widget _boolHandling(bool? boolData)
  {
    if(boolData==true)
      {
        return  Icon(Icons.check,color: Colors.black);

        }
    return  Icon(Icons.close,color: Colors.black);
  }


}
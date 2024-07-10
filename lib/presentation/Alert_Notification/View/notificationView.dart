import 'dart:convert';

import 'package:animated_theme_switcher/animated_theme_switcher.dart';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
import 'package:essmohr/application/app_prefs.dart';
import 'package:essmohr/application/constants.dart';
import 'package:essmohr/application/di.dart';
import 'package:essmohr/domain/model/model.dart';
// ignore: depend_on_referenced_packages
import 'package:http/http.dart' as http;
import 'package:essmohr/presentation/Alert_Notification/View/AttachmentDialog.dart';
import 'package:essmohr/presentation/Notification.dart';
import 'package:essmohr/presentation/resources/colors.dart';
import 'package:essmohr/presentation/resources/strings_manager.dart';
import 'package:adaptive_scrollbar/adaptive_scrollbar.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';


final GlobalKey<SfPdfViewerState> _pdfViewerKey = GlobalKey();

class NotificationView extends StatefulWidget {
  const NotificationView({super.key});
  @override
  State<NotificationView> createState() => _NotificationViewState();
}

class _NotificationViewState extends State<NotificationView> {

  String? userId;
  final AppPreferences _appPreferences = instance<AppPreferences>();

  final formKey = GlobalKey<FormState>();
  List<NotificationModel>? notifications;
  Notifications notify=Notifications();
  final _verticalScrollController = ScrollController();
  final _horizontalScrollController = ScrollController();


  Future<void> start() async
  {
    //notifications = await getApiNotification();
    //await markNotificationAsSeen();
  }


  @override
  void initState()
  {
    //_bind();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //_bind();
    return
      ThemeSwitchingArea(
          child: Builder(
              builder: (context) =>
                  Scaffold(
                    body:
                    Container(
                      height: MediaQuery.of(context).size.height,
                        padding:  EdgeInsets.fromLTRB(0, 5, 0, 150),
                         child: SingleChildScrollView(
                               controller: _verticalScrollController,
                           scrollDirection: Axis.vertical,
                          child: Column(
                            children:
                            [
                              AdaptiveScrollbar
                                (
                                  controller: _verticalScrollController,
                                  //scrollDirection: Axis.vertical,
                                  child: notificationTable()
                              ),
                            ],
                          ),
                        )),

                  )
         // )
    ));
  }

  // Image.network(
  //     imageUrl,
  //     )

  Widget? displayImgDialoge(String name,String url,String pdf,BuildContext context) {
    Widget colseButton = TextButton(
      child: Text(AppStrings.close.tr()),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );
    if (url != "") {
      showAnimatedDialog(
        barrierColor: Colors.white70,
        context: context,
        barrierDismissible: true,
        builder: (BuildContext context) {
          return AlertDialog(
            actions: [
              colseButton,
            ],
            content: Column(
              children: [
                Text(name, style: TextStyle(
                  color: Colors.blue,
                  fontSize: 20,
                  fontFamily: "Poppins",
                  fontWeight: FontWeight.w600,)),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Image.network(url),
                  ),
                ),

              ],
            ),
          );
        },
        animationType: DialogTransitionType.fade,
        curve: Curves.linear,
        duration: Duration(seconds: 1),
      );
      return null;
    }
    if(pdf!="")
      { showAnimatedDialog(
        barrierColor: Colors.white70,
        context: context,
        barrierDismissible: true,
        builder: (BuildContext context) {
          return AlertDialog(
            actions: [
              colseButton,
            ],
            content: Column(
              children: [
                Text(name, style: TextStyle(
                  color: Colors.blue,
                  fontSize: 20,
                  fontFamily: "Poppins",
                  fontWeight: FontWeight.w600,)),



                      Container(width: 450,
                          height: 500,
                          child: SfPdfViewer.network(pdf)),


              ],
            ),
          );
        },
        animationType: DialogTransitionType.fade,
        curve: Curves.linear,
        duration: Duration(seconds: 1),
      );
      return null;
      }
  }

  Widget? displayMoreDialoge(String message,BuildContext context) {
    showAnimatedDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return ClassicGeneralDialogWidget(
          //titleText: AppStrings.Alerts.tr(),
          contentText: message,
          positiveText: AppStrings.ok.tr(),
          onPositiveClick: () {
            Navigator.of(context).pop();
          },

        );
      },
      animationType: DialogTransitionType.fade,
      curve: Curves.linear,
      duration: Duration(seconds: 1),
    );
    return null;
  }
  Widget _createMemoTable(List<NotificationModel>? notification) {
    if(notification?.isEmpty==false) {

      return DataTable(
        dataRowHeight: 50,


        headingRowColor: MaterialStateColor.resolveWith((states) =>
        colorManager.lightprimary),
        columns: _createColumns(),
        rows: _createRows(notification),

      );
    }else
    {return
      Container(margin: const EdgeInsets.fromLTRB(40, 40, 30, 0),
        child: Text(AppStrings.noContent.tr(),style: const TextStyle(color: Colors.orange),),);}
  }
  List<DataColumn> _createColumns() {
    return [
      DataColumn(
          label: Text(AppStrings.date.tr(), style: const TextStyle(color: colorManager.white),)),
      DataColumn(label: Text(
        AppStrings.title.tr(), style: const TextStyle(color: colorManager.white),)),
      DataColumn(
          label: Text(AppStrings.details.tr(), style: const TextStyle(color: colorManager.white),)),
      DataColumn(label: Text(AppStrings.notes.tr()
        , style: const TextStyle(color: colorManager.white),)),
      DataColumn(
          label: Text(AppStrings.attachments.tr(), style: const TextStyle(color: colorManager.white),)),
      DataColumn(label: Text(
        AppStrings.canceled.tr(), style: const TextStyle(color: colorManager.white),)),
      DataColumn(
          label: Text(AppStrings.cancellation_Reason.tr(), style: const TextStyle(color: colorManager.white),)),
      DataColumn(label: Text(
        AppStrings.seen.tr(), style: const TextStyle(color: colorManager.white),)),
    ];
  }
  List<DataRow> _createRows(List<NotificationModel>? notification) {
    return notification!
        .map((notificationItem) =>
        DataRow(cells: [
          DataCell(Text(_formattingDate(notificationItem.date).toString())),
          DataCell(Text((notificationItem.title).toString())),
          DataCell(       onTap: () {
// Your code here
            displayMoreDialoge(_textHandling(notificationItem.details).toString(),context);
               },
              Container(width: 200,
            height: 150,
            child: Text(_textHandling(notificationItem.details).toString(),softWrap: true, maxLines: 2,
                overflow: TextOverflow.ellipsis,)
          )),
          DataCell( onTap: () {
    displayMoreDialoge(_textHandling(notificationItem.details).toString(),context);
    },
    Container(width: 200,
    height: 150,
    child: Text(_textHandling(notificationItem.notes).toString(),maxLines: 2,
    overflow: TextOverflow.ellipsis,))),
          DataCell(Text(_textHandling(notificationItem.attachments).toString()!="" ?
          AppStrings.attachments.tr():AppStrings.noAttachments.tr()),
          onTap: () async {
            if(_textHandling(notificationItem.attachments).toString()!="" ) {
             dynamic attachmentData= await getAttachment(int.parse(notificationItem.attachments.toString()));
              String img=attachmentData[0]["img"].toString();
              //showAttachmentDialog(attachmentData,context,onValue: (_) {});
             displayImgDialoge(attachmentData[0]["Name"],img,attachmentData[0]["pdf"],context );

            } },),
         // DataCell(_boolHandling(notificationItem.isCanceled)),
          DataCell(notificationItem.isCanceled == true ?
        const Icon(Icons.check):const Text("_")),
          DataCell(Text(_textHandling(notificationItem.cancellationReason).toString())),
           DataCell(notificationItem.seen == true ?
             const Icon(Icons.check_box,color: Colors.blue,):const Icon(Icons.close,color: Colors.grey))


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
      if(notifications !=null) {
        await getUnseenNotificationId(notifications!);
      }
      return notifications;
    }
    return null;
  }
 Future <void> getUnseenNotificationId(List<NotificationModel> notify)
  async {
    for( var item in notify)
      {
        if( item.seen== false)
        {
         await markNotificationAsSeen(item.id!);
        }

      }
}
Future<dynamic> getAttachment(int ids) async
{
  userId = await _appPreferences.getUserToken();
  Uri uri;
  String url = Constants.getAttachmentUrl;

  uri = Uri.parse("$url"+"$ids");
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


 Future <void> markNotificationAsSeen(int id) async
  {
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
  Widget notificationTable() {
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
                  return
                      AdaptiveScrollbar(
                      controller: _horizontalScrollController,
                      position: ScrollbarPosition.bottom,
                      underColor: Colors.blueGrey.withOpacity(0.3),
            sliderDefaultColor: Colors.blueGrey.withOpacity(0.7),
            sliderActiveColor: Colors.grey,
            child: SingleChildScrollView(
            controller: _verticalScrollController,

            scrollDirection: Axis.vertical,
            child: SingleChildScrollView(
            controller: _horizontalScrollController,
            scrollDirection: Axis.horizontal,
            child: Padding(
                padding: const EdgeInsets.only(right: 0, bottom: 30),
                child:
            _createMemoTable(notifications),
            )))
                      //),

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
  String? _formattingDate(String? date)
  {
    if(date!=null){
    String? formattingDate = date.split('T').first;
    return formattingDate;}
    return null;
  }

}

// ignore: unused_element, camel_case_types
class _notificationDataSource extends DataTableSource {
  final List<NotificationModel> data;

  _notificationDataSource({required this.data});

  @override
  DataRow? getRow(int index) {
    if (index >= data.length) {
      return null;
    }

    final item = data[index];

    return DataRow(cells: [
      DataCell(Text(_formattingDate(item.date).toString())),
      DataCell(Text((item.title).toString())),
      DataCell(Text(
        _textHandling(item.details).toString(), softWrap: true, maxLines: 3,)),
      DataCell(Text(_textHandling(item.notes).toString(), softWrap: true)),
      DataCell(Text(_textHandling(item.attachments).toString())),
      // DataCell(_boolHandling(notificationItem.isCanceled)),
      DataCell(item.isCanceled == true ?
      const Icon(Icons.check) : const Text("_")),
      DataCell(Text(_textHandling(item.cancellationReason).toString())),
      DataCell(item.seen == true ?
      const Icon(Icons.check_box, color: Colors.blue,) : const Icon(
          Icons.close, color: Colors.grey))


      //DataCell(_boolHandling(notificationItem.seen)),

    ]);
  }

  String _textHandling(String? text) {
    String txtResult;
    if (text == null) {
      txtResult = "";
      return txtResult;
    }
    txtResult = text;
    return txtResult;
  }

  String? _formattingDate(String? date) {
    if (date != null) {
      String? formattingDate = date
          .split('T')
          .first;
      return formattingDate;
    }
    return null;
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => data.length;

  @override
  int get selectedRowCount => 0;



}
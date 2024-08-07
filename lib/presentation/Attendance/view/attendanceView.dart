// ignore_for_file: camel_case_types

import 'dart:convert';

import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
import 'package:essmohr/application/app_prefs.dart';
import 'package:essmohr/application/di.dart';
import 'package:essmohr/domain/model/model.dart';
import 'package:essmohr/presentation/Attendance/viewModel/attendViewModel.dart';
//import 'package:essmohr/presentation/Requests/Attendance/View/AttendanceDetailsDialog.dart';
import 'package:essmohr/presentation/common/state_renderer/state_render_impl.dart';
import 'package:essmohr/presentation/resources/colors.dart';
import 'package:essmohr/presentation/resources/routes.dart';
import 'package:essmohr/presentation/resources/strings_manager.dart';
import 'package:essmohr/presentation/widgets/appbar_widget.dart';
import 'package:essmohr/presentation/widgets/appbarstart.dart';
import 'package:essmohr/presentation/widgets/profile_widget.dart';
import '../../../../application/constants.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
//import '../ViewModel/AttendanceViewModel.dart';

class AttendanceView extends StatefulWidget {
  const AttendanceView({Key? key}) : super(key: key);

  @override
  State<AttendanceView> createState() => _AttendanceViewState();
}

class _AttendanceViewState extends State<AttendanceView> {
  final AttendanceViewModel _viewModel = instance<AttendanceViewModel>();
  final _Formkey = GlobalKey<FormState>();
  DateTime Fromdate = DateTime(2023);
  DateTime Todate = DateTime(2023);
  bool oKPressed=false;
  List<UserAttendance>? attendanceData;
  late String _startDate, _endDate;
  final DateRangePickerController _controller = DateRangePickerController();
  String? userId;
  final AppPreferences _appPreferences = instance<AppPreferences>();
  final TextEditingController _FromDateEditingController = TextEditingController();
  final TextEditingController _ToDateEditingController = TextEditingController();


  @override
  void initState(){
    _bind();

    final DateTime today = DateTime.now();
    _startDate = DateFormat('dd-MM-yyyy').format(today.subtract(Duration(days: 1))).toString();
    _endDate = DateFormat('dd-MM-yyyy').format(today).toString();
    _controller.selectedRange =
        PickerDateRange(today, today.add(Duration(days: 1)));
oKPressed=false;
    //attendanceData= await getApiAttendance();
    setState(() {

    });
    super.initState();
  }

  _bind() {
    _viewModel.start();
  }

  @override
  Widget build(BuildContext context) {
    return ThemeSwitchingArea(
        child: Builder(
            builder: (context) =>
                Scaffold(
                    body:
                            StreamBuilder<FlowState>(
                                stream: _viewModel.outputState,
                                builder: (context, snapshot) {
                                  return snapshot.data?.getScreenWidget(context,
                                      _getContentWidget(),

                                          () {
                                    _viewModel.start();
                                    },
                                          () {
                                      }) ??
                                      _getContentWidget();
                                }),
                          ),
                    )

        );
  }
  @override
  void dispose() {
    _viewModel.dispose();
    super.dispose();
  }
  Widget _getContentWidget() {
    return
              SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column
                (crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height*1.3,
                      padding: const EdgeInsets.only(top: 20),
                      child: Form(
                          key: _Formkey,
                          child: SingleChildScrollView(
                              scrollDirection: Axis.vertical,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  _dateWidget(),
                                  SizedBox(height: 30),
                                   table(),


                                ],
                              ))))
        ]));
  }
  Widget _getAttendance(List<UserAttendance>? attendance) {
    if (attendance != null) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Padding(
                padding: EdgeInsets.fromLTRB(20, 30, 30, 30),
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Container(
                    //width: 400,
                    child: DataTable(
                        headingRowColor: MaterialStateColor.resolveWith(
                                (states) => colorManager.primary),
                        columns:  const [
                          DataColumn(
                              label: Text(
                               "Action",
                                style: TextStyle(color: colorManager.white),
                              )),
                          DataColumn(
                              label: Text("Action Time",
                                  style: TextStyle(color: colorManager.white))),

                        ],
                        rows: attendance
                            .map((item) => DataRow(cells: [
                          DataCell(Text(item.action)),
                          //DateFormat('dd-MM-yyyy').format(item.actiontime).toString()
                          DataCell(Text(item.actiontime.toString()))
                          ])
                        ).toList()),
                  ),
                )),
          ),
        ],
      );
    }
    return Padding(padding: const EdgeInsets.all(25.0), child: Container());
  }
  Widget _dateWidget(){
    return
      SingleChildScrollView(scrollDirection: Axis.vertical,
        child: Column(
          children:
          [
            Row(
                //crossAxisAlignment: CrossAxisAlignment.start,
                 mainAxisAlignment: MainAxisAlignment.start,
                         children: [
                            Expanded(
                              child: Container(
                  padding: const EdgeInsets.fromLTRB(40, 0, 20, 0),
                  height: 30,
                  child: Text(AppStrings.from.tr() +' : '+ _startDate,style: TextStyle(fontSize: 13,fontWeight: FontWeight.bold),)),
                            ),
                            Expanded(
                             child: Container(
                                 margin: const EdgeInsets.fromLTRB(30, 0, 20,0),
              height: 30, child: Text(AppStrings.to.tr() +' : '+ _endDate,style: TextStyle(fontSize: 13,fontWeight: FontWeight.bold))),
                           )
                                   ]),
            SizedBox(height: 40,
                width: 150,
                child:FloatingActionButton(
                child:  Text(AppStrings.select_time_duration.tr()),
                onPressed: () async{
                  //oKPressed=false;
                  await showDialogDate();
                  attendanceData= await getApiAttendance();
                  setState(() {
                    if(oKPressed)
                    {
                      attendanceData=attendanceData;

                    }

                  });
                    // showDialog(
                    //     context: context,
                    //     builder: (BuildContext context) {
                    //       return
                    //         SizedBox(
                    //             height: 350,
                    //             child:
                    //             Column(
                    //               mainAxisAlignment: MainAxisAlignment.center,
                    //               children: [
                    //                 getDateRangePicker(),
                    //                 FloatingActionButton(
                    //                   backgroundColor: colorManager.primary,
                    //                   child: Text(AppStrings.ok),
                    //                   onPressed: () {
                    //                     setState(() async {
                    //                       oKPressed = true;
                    //                       attendanceData = await getApiAttendance();
                    //                       Navigator.pop(context,true);
                    //                     });
                    //                   },
                    //                 )
                    //               ],
                    //
                    //             )
                    //         );
                    //     }
                    // );

                })),


            ]));





  }
  void selectionChanged(DateRangePickerSelectionChangedArgs args) {
    SchedulerBinding.instance.addPostFrameCallback((duration){
    setState(() {
      _startDate =
          DateFormat('yyyy-MM-dd').format(args.value.startDate).toString();
      _endDate = DateFormat('yyyy-MM-dd')
          .format(args.value.endDate ?? args.value.startDate)
          .toString();
    });});
  }
  Widget getDateRangePicker() {
    return  Card(
            child:SfDateRangePicker(
              view: DateRangePickerView.month,
              controller: _controller,
              selectionMode: DateRangePickerSelectionMode.range,
              onSelectionChanged: selectionChanged,
              allowViewNavigation: false,
            ));
  }

Future <List<UserAttendance>?> getApiAttendance() async
{
  userId = await _appPreferences.getUserToken();

  // string to uri
  //2020-9-12T11:41:47.053Z&toDate=2023-10-12T11:41:47.053Z';
  //https://mohrapi.azurewebsites.net/api/Attendance?fromDate=01-09-2023&toDate=22-10-2023
  var uri = Uri.parse(Constants.attendanceUrl+_startDate+'T11:41:47.053Z&toDate='+_endDate+'T11:41:47.053Z');
  List<UserAttendance>? a;

  var response = await http.get(
      uri, headers: <String, String>{'Content-Type': 'application/json; charset=UTF-8','userId':userId!});

  final responseData = json.decode(response.body);
  if(responseData['data']!=null)
  {
  var userAttend= responseData['data'] as List  ;

   a= await userAttend.map((data) => UserAttendance.fromJson(data)).toList();
  List<UserAttendance>? b=List<UserAttendance>.from(a as Iterable);
   return b ;
  }
  return null ;


}
  Widget _createAttendanceTable1(List<UserAttendance>? attendance) {
    if(attendance?.isEmpty==false) {
      return DataTable(
        headingRowColor: MaterialStateColor.resolveWith((states) =>
        colorManager.lightprimary),
        columns: _createColumns(),
        rows: _createRows(attendance),

      );
    }else
    {return
      Container(margin: const EdgeInsets.fromLTRB(40, 40, 30, 0),
        child: Text(AppStrings.noContent.tr(),style: TextStyle(color: Colors.orange),),);}
  }
  Future<Widget> _createAttendanceTable(List<UserAttendance>? attendance) async{
    if(attendance?.isEmpty==false) {
      return DataTable(
        headingRowColor: MaterialStateColor.resolveWith((states) =>
        colorManager.lightprimary),
        columns: _createColumns(),
        rows: _createRows(attendance),

      );
    }else
    {return
      Container(margin: const EdgeInsets.fromLTRB(40, 40, 30, 0),
      child: Text(AppStrings.noContent.tr(),style: TextStyle(color: Colors.orange),),);}
  }
  List<DataColumn> _createColumns() {
    return [
      DataColumn(
          label: Text(AppStrings.type.tr(), style: TextStyle(color: colorManager.white),)),
      DataColumn(label: Text(
        AppStrings.time.tr(), style: TextStyle(color: colorManager.white),)),

    ];
  }
  List<DataRow> _createRows(List<UserAttendance>? attendances) {
    return attendances!
        .map((attendanceItem) =>
        DataRow(cells: [
          DataCell(Text((attendanceItem.action).toString())),
          DataCell(Text((attendanceItem.actiontime).toString()))

        ]))
        .toList();
  }
 Future showDialogDate()
 {
   return
     showDialog(
         context: context,
         builder: (context) => StatefulBuilder
           (builder: (context,setState)=>
             SizedBox(
                 height: 350,
                 child:
                 Column(
                   mainAxisAlignment: MainAxisAlignment.center,
                   children: [
                     getDateRangePicker(),
                     FloatingActionButton(
                       backgroundColor: colorManager.primary,
                       child: Text(AppStrings.ok.tr()),
                       onPressed: () {
                       // setState(() {
                           oKPressed = true;
                           //attendanceData = await getApiAttendance();
                           Navigator.pop(context,true);
                        // });
                       },
                     )
                   ],

                 )
             )
   ));

 }

 Widget table(){
  return
    FutureBuilder(
       future:_createAttendanceTable(attendanceData),
       builder:(context,snapshot)
       {
         switch (snapshot.connectionState) {
           case ConnectionState.waiting:
             return const Center(
               child:CircularProgressIndicator());
           default:
             if (snapshot.hasError)
               return Text('Error: ${snapshot.error}');
             else
             if (oKPressed) {
               //attendanceData= getApiAttendance();
               return Center(
                   child:_createAttendanceTable1(attendanceData)
               );}
         }
         return const Text('');
       }
   );
 }
   
 }
class UserAttendance {
  final int id;
  final String mode;
  final String action;
  final String actiontime;

  UserAttendance ({
    required this.id,
    required this.mode,
    required this.action,
    required this.actiontime,
  });
  factory UserAttendance.fromJson(Map<String, dynamic> json) {
    return UserAttendance(
        id: json["Id"],
        mode: json["Mode"],
        action:json["Action"],
        actiontime: json["ActionTime"]
    );
  }
}

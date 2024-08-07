// ignore_for_file: camel_case_types

import 'dart:convert';

import 'package:animated_theme_switcher/animated_theme_switcher.dart';

import 'package:easy_localization/easy_localization.dart';
import 'package:essmohr/application/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

import 'package:http/http.dart' as http;
import 'package:essmohr/application/app_prefs.dart';
import 'package:essmohr/application/di.dart';
import 'package:essmohr/presentation/Attendance/viewModel/attendViewModel.dart';
import 'package:essmohr/presentation/common/state_renderer/state_render_impl.dart';
import 'package:essmohr/presentation/resources/colors.dart';
import 'package:essmohr/presentation/resources/strings_manager.dart';
import 'package:mat_month_picker_dialog/mat_month_picker_dialog.dart';


import 'package:syncfusion_flutter_datepicker/datepicker.dart';


class AttendanceAlertView extends StatefulWidget {
  const AttendanceAlertView({Key? key}) : super(key: key);

  @override
  State<AttendanceAlertView> createState() => _AttendanceAlertViewState();
}

final _Formkey = GlobalKey<FormState>();
DateTime Fromdate = DateTime(2023);
DateTime Todate = DateTime(2023);
bool oKPressed=false;
List<UserAttendanceAlert>? attendanceData;

late String _startDate;
final DateRangePickerController _controller = DateRangePickerController();
final AppPreferences _appPreferences = instance<AppPreferences>();
String? userId;
final TextEditingController _dateEditingController = TextEditingController();

class _AttendanceAlertViewState extends State<AttendanceAlertView> {
  final AttendanceViewModel _viewModel = instance<AttendanceViewModel>();

  @override
  void initState() {
    _bind();

    final DateTime today = DateTime.now();
    _startDate = DateFormat('yMMMM').format(today).toString();
    _controller.selectedRange =
        PickerDateRange(today, today.add(Duration(days: 0)));
    super.initState();
  }

  _bind() async {
    userId= await _appPreferences.getUserToken() ;
   // _viewModel.start();
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
                    padding: const EdgeInsets.only(top: 5),
                    child: Form(
                        key: _Formkey,
                        child: SingleChildScrollView(
                            scrollDirection: Axis.vertical,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                _dateWidget(),
                                SizedBox(height: 10),
                                SingleChildScrollView(
                                  scrollDirection: Axis.vertical,
                                  child: Column(
                                    children: [
                                      table(),
                                    ],
                                  ),
                                ),


                              ],
                            ))))
              ]));
  }
  // Widget _getAttendance(List<UserAttendanceAlert>? attendance) {
  //   if (attendance != null) {
  //     return Column(
  //       mainAxisAlignment: MainAxisAlignment.start,
  //       children: [
  //         SingleChildScrollView(
  //           scrollDirection: Axis.vertical,
  //           child: Padding(
  //               padding: EdgeInsets.fromLTRB(20, 30, 30, 30),
  //               child: SingleChildScrollView(
  //                 scrollDirection: Axis.vertical,
  //                 child: Container(
  //                   //width: 400,
  //                   child: DataTable(
  //                       headingRowColor: MaterialStateColor.resolveWith(
  //                               (states) => colorManager.primary),
  //                       columns:  const [
  //                         DataColumn(
  //                             label: Text(
  //                               "Action",
  //                               style: TextStyle(color: colorManager.white),
  //                             )),
  //                         DataColumn(
  //                             label: Text("Action Time",
  //                                 style: TextStyle(color: colorManager.white))),
  //
  //                       ],
  //                       rows: attendance
  //                           .map((item) => DataRow(cells: [
  //                         DataCell(Text(item.action)),
  //                         //DateFormat('dd-MM-yyyy').format(item.actiontime).toString()
  //                         DataCell(Text(item.actiontime.toString()))
  //                       ])
  //                       ).toList()),
  //                 ),
  //               )),
  //         ),
  //       ],
  //     );
  //   }
  //   return Padding(padding: const EdgeInsets.all(25.0), child: Container());
  // }
  Widget _dateWidget()
  {
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
                        child:
                        Container(
                          padding: const EdgeInsets.only(

                              left: 28,
                              right: 28),
                          child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TextFormField(onChanged: (_startDate){
                                oKPressed=false;
                              },
                                  onTap: () async {

                                    DateTime? newDate = await
                                    showMonthPicker
                                      (context: context,
                                        initialDate: DateTime.now(),
                                        firstDate: DateTime(1900),
                                        lastDate: DateTime(2100),
                                     // initialDatePickerMode:DatePickerMode.day,
                                    );
                                    if (newDate == null) return;
                                    setState(() {
                                      String _newDate=DateFormat('yMMMM').format(newDate).toString();
                                      _startDate = _newDate;
                                    });
                                  },

                                      keyboardType: TextInputType.text,
                                      controller: _dateEditingController,
                                      decoration: InputDecoration(


                                              focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide(color: colorManager.greywithOpacity, width: 1.0),
                                              ),
                                              enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(color: colorManager.greywithOpacity, width: 1.0),
                                              ),

                                          prefixIcon: const Icon(Icons.calendar_month),

                                        labelText: "${_startDate}",
                                          hintText:
                                          "${_startDate}"
                                        //errorText: snapshot.data
                                      )),
                                 SizedBox(height: 10,),

                                 Center(
                                   child: SizedBox(height: 40,
                                                       width: 150,
                                                       child:FloatingActionButton(
                                                           child:  Text(AppStrings.check.tr()),
                                                           onPressed: () async{
                                                              oKPressed=true;
                                                             // await showDialogDate();
                                                             attendanceData= await getApiAttendance(_startDate);
                                                             setState(() {
                                                               if(oKPressed)
                                                               {
                                                                 attendanceData=attendanceData;

                                                               }

                                                             }
                                                             );
                                                           })
                                   ),
                                 ),
              ]
                          )
      )
    )]
      )]))
    ;

  }
  void selectionChanged(DateRangePickerSelectionChangedArgs args) {
    SchedulerBinding.instance.addPostFrameCallback((duration){
      setState(() {
        _startDate =
            DateFormat('MM-dd-yyyy').format(args.value.startDate).toString();
        // _endDate = DateFormat('yyyy-MM-dd')
        //     .format(args.value.endDate ?? args.value.startDate)
        //     .toString();
      });});
  }
  Widget getDateRangePicker() {
    return  Card(
        child:SfDateRangePicker(
          view: DateRangePickerView.year,
          controller: _controller,
          selectionMode: DateRangePickerSelectionMode.single,
          onSelectionChanged: selectionChanged,
          allowViewNavigation: false,
        ));
  }

  Future <List<UserAttendanceAlert>?> getApiAttendance(String date) async
  {
    userId = await _appPreferences.getUserToken();

    // string to uri
    //2020-9-12T11:41:47.053Z&toDate=2023-10-12T11:41:47.053Z';
    //api/Attendance/GetEmployeeAlerts?date=
    var uri = Uri.parse(Constants.getAttendanceAlertUrl+date);
    List<UserAttendanceAlert>? a;

    var response = await http.get(
        uri, headers: <String, String>{'Content-Type': 'application/json; charset=UTF-8','userId':userId!});

    final responseData = json.decode(response.body);
    // if(responseData['data']!=null)
    // {
      var userAttend= responseData as List  ;

      a= await userAttend.map((data) => UserAttendanceAlert.fromJson(data)).toList();
      List<UserAttendanceAlert>? b=List<UserAttendanceAlert>.from(a as Iterable);
      return b ;
   // }
    //return null ;


  }
  Widget _createAttendanceTable1(List<UserAttendanceAlert>? attendance) {
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
  Future<Widget> _createAttendanceTable(List<UserAttendanceAlert>? attendance) async{
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

      DataColumn(label: Text(
        AppStrings.Date.tr(), style: TextStyle(color: colorManager.white),)),
      DataColumn(
          label: Text(AppStrings.time.tr(), style: TextStyle(color: colorManager.white),)),
      DataColumn(
          label: Text(AppStrings.type.tr(), style: TextStyle(color: colorManager.white),)),
      DataColumn(
          label: Text(AppStrings.Alert_Type.tr(), style: TextStyle(color: colorManager.white),)),
      DataColumn(
          label: Text(AppStrings.Alert_Handling.tr(), style: TextStyle(color: colorManager.white),)),
      DataColumn(
          label: Text(AppStrings.notes.tr(), style: TextStyle(color: colorManager.white),)),


    ];
  }
  List<DataRow> _createRows(List<UserAttendanceAlert>? attendances) {
    return attendances!
        .map((attendanceItem) =>
        DataRow(cells: [
          DataCell(Text(DateFormat('MMMMd').format(DateTime.parse(attendanceItem.date.toString())).toString())),
          DataCell(Text((attendanceItem.time).toString())),
          DataCell(Text((attendanceItem.type).toString())),
          DataCell(Text((attendanceItem.alertType).toString())),
          DataCell(Text((attendanceItem.handleType).toString())),
          DataCell(Text((attendanceItem.note).toString())),

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
                      child:SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Column(
                          children: [
                            _createAttendanceTable1(attendanceData),
                          ],
                        ),
                      )
                  );}
            }
            return const Text('');
          }
      );
  }

}
class UserAttendanceAlert {

  final String?  time;
  final String? date;
  final String? type;
  final bool? isManual;
  final String? userName;
  final String? alertType;
  final String? handleType;
  final String? note;

  UserAttendanceAlert ({
    required this.time,
    required this.date,
    required this.type,
    required this.isManual,
    required this.userName,
    required this.alertType,
    required this.handleType,
    required this.note,
  });
  factory UserAttendanceAlert.fromJson(Map<String, dynamic> json) {
    return UserAttendanceAlert(
    // id: json["Id"],
    time:json["Time"],
    date: json["Date"],
    type: json["Type"],
    isManual: json["IsManual"],
    userName: json["Username"],
    alertType: json["AlertType"],
    handleType: json["HandleType"],
    note: json["Note"]
    );
  }
}


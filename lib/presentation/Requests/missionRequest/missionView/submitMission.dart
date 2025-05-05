
import 'dart:convert';
import 'dart:core';
import 'dart:io';
import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:essmohr/domain/model/model.dart';
import 'package:essmohr/presentation/widgets/autoCompleteTextField.dart';
import 'package:essmohr/presentation/widgets/dateTime.dart';
import 'package:essmohr/presentation/widgets/profile_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:essmohr/application/app_prefs.dart';
import 'package:essmohr/application/constants.dart';
import 'package:essmohr/presentation/resources/colors.dart';
import 'package:essmohr/application/di.dart';
import 'package:essmohr/domain/model/navigationManu.dart';

import 'package:essmohr/presentation/resources/strings_manager.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:http/http.dart' as http;

class MissionSubmit extends StatefulWidget implements NavigationStates
{
  const MissionSubmit ({Key? key}) : super(key: key);
  @override
  State<MissionSubmit > createState() => _MissionSubmitState();
}

class _MissionSubmitState extends State<MissionSubmit>with TickerProviderStateMixin {

  final AppPreferences _appPreferences = instance<AppPreferences>();

  final _Formkey = GlobalKey<FormState>();
 // String? dropDownValue;
  int selectedOption = 1;
  var MissionTypeId;
  DateTime Fromdate = DateTime(2023);
  DateTime Todate = DateTime(2023);
  bool oKPressed = false;
  List<String>? MissionType;
  String? message;

  String daysOrHours="days";
  String? selectedMissionType;
  String selectedTimeType = "please select time type";
  late String _startDate, _endDate;

   String? _startTimeStr;
   String? _endTimeStr;
  TimeOfDay? _startTime;
  TimeOfDay? _endTime;
  late int durtionValue;
  final DateRangePickerController _controller = DateRangePickerController();
  final TextEditingController _DestinationEditingController = TextEditingController();
  final TextEditingController _DurationEditingController = TextEditingController();
  late TextEditingController _StartDateController = TextEditingController();
  final TextEditingController _EndDateController = TextEditingController();
  final TextEditingController _NoteEditingController = TextEditingController();
  final TextEditingController _AttachmentEditingController = TextEditingController();
  String? userId;
  List<TimeOfDay> selectedHours = [];
  @override
  void initState() {
    final DateTime today = DateTime.now();
    _startDate = DateFormat('dd-MM-yyyy')
        .format(today.subtract(const Duration(days: 1)))
        .toString();
    _endDate = DateFormat('dd-MM-yyyy').format(today).toString();
    durtionValue = 0;
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
                SingleChildScrollView(
                  child: Column(
                      children: [
                        Align(
                            alignment: Alignment.center,
                            child: Text(AppStrings.missionRequest.tr(),
                              style: TextStyle(fontWeight: FontWeight.bold,
                                  fontSize: 22,
                                  color: colorManager.lightprimary),)),
                        Form(
                          child: Container(
                              padding: const EdgeInsets.only(
                                  top: 12,
                                  left: 28,
                                  right: 28),
                              child: Column(children: [
                                const SizedBox(height: 10)
                                , const SizedBox(height: 5),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [

                                    Container(width: 250,
                                      child: TextFormField(
                                        controller: _DestinationEditingController,
                                        decoration: InputDecoration(
                                            focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: colorManager
                                                      .greywithOpacity,
                                                  width: 1.0),
                                            ),
                                            enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: colorManager
                                                      .greywithOpacity,
                                                  width: 1.0),
                                            ),
                                            // hintText:"1",
                                            label: Text(AppStrings.destination.tr())),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 5),
                                Row(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.center
                                  , children: [
                                  Text(AppStrings.days_hours.tr()),
                                  const SizedBox(width: 15,),
                                  getDropDownDurationItems(),
                                ],),
                                const SizedBox(height: 10),
                                SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Row(
                                      children: [
                                        Text('${AppStrings.from.tr()} : '),
                                        Text(_startTimeStr != null
                                            ? '$_startDate $_startTimeStr'
                                            : '$_startDate'
                                            , style: const TextStyle(
                                            fontSize: 13,
                                            fontWeight: FontWeight.bold),),
                                        const SizedBox(width: 40,),
                                        Text('${AppStrings.to.tr()} : '),
                                        Text(_endTimeStr != null
                                            ? '$_endDate $_endTimeStr'
                                            : '$_endDate'
                                            , style: const TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold))
                                      ]
                                  ),
                                ),
                                Row(
                                  //crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SizedBox(height: 40,
                                        width: 150,
                                        child: FloatingActionButton(
                                            child: Text(
                                                AppStrings.select_time_duration
                                                    .tr()),
                                            onPressed: () async {

                                              if(daysOrHours=="days" || daysOrHours=="أيام") {
                                                await showDialogDate();
                                              }else {
                                                await showDialogDate();
                                                await buildHoursCard();
                                              }
                                              setState(() {});
                                            }),
                                      )
                                    ]),
                                const SizedBox(height: 10),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    // Text(durtionValue.toString(),style: const TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                                    Container(width: 250,
                                      child: TextFormField(
                                        readOnly: true,
                                        controller: _DurationEditingController,
                                        //keyboardType: TextInputType.number,
                                        decoration: InputDecoration(
                                            focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: colorManager
                                                      .greywithOpacity,
                                                  width: 1.0),
                                            ),
                                            enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: colorManager
                                                      .greywithOpacity,
                                                  width: 1.0),
                                            ),
                                            // hintText:"1",
                                            label: Text(
                                                AppStrings.period.tr())),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 10),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Container(width: 250,
                                        //reviwer
                                        child: AutoCompleteTextField(
                                          date: "2024-10-30",
                                          typeId: 0,
                                          type: 1,)

                                    ),

                                  ],),
                                const SizedBox(height: 10),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Container(width: 250,
                                      child: TextFormField(
                                        controller: _NoteEditingController,
                                        keyboardType: TextInputType.text,
                                        decoration: InputDecoration(
                                            focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: colorManager
                                                      .greywithOpacity,
                                                  width: 1.0),
                                            ),
                                            enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: colorManager
                                                      .greywithOpacity,
                                                  width: 1.0),
                                            ),

                                            label: Text(AppStrings.notes.tr())),

                                      ),
                                    ),

                                  ],),

                                const SizedBox(height: 10),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Container(width: 240,
                                      child: TextFormField(
                                        readOnly: true,
                                        controller: _AttachmentEditingController,
                                        keyboardType: TextInputType.url,
                                        decoration: InputDecoration(
                                            focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: colorManager
                                                      .greywithOpacity,
                                                  width: 1.0),
                                            ),
                                            enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: colorManager
                                                      .greywithOpacity,
                                                  width: 1.0),
                                            ),
                                            label: Text(
                                                AppStrings.attachments.tr())),

                                      ),
                                    ),
                                    const SizedBox(width: 5,),
                                    FloatingActionButton(heroTag: null, child:
                                    const Text("+"), onPressed: () {
                                      showImagePicker(context);
                                    })
                                  ],),
                                const SizedBox(height: 20),
                                Row(

                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    FloatingActionButton(heroTag: null,
                                        child:
                                        Text(AppStrings.submit.tr(),
                                          textAlign: TextAlign.center,),
                                        onPressed: () async{
                                      setState(() {

                                          if(_startTimeStr!= null)
                                            {_startDate='$_startDate $_startTimeStr';}
                                          if(_endTimeStr!= null)
                                          {_endDate='$_endDate $_endTimeStr';}
                                      });


                                          bool? x = await getValidateMission(
                                              _StartDateController.text,
                                              _EndDateController.text,

                                              2);
                                              //int.parse(_DurationEditingController.text));
                                          if (x == false) {
                                            displayDialog();
                                          }
                                          else {
                                            addingMissionRequest();
                                          }


                                        }
                                        // {
                                        //   // bool? x = await getValidateMission(
                                        //   //     '2023-08-27', "2023-08-28", 572,
                                        //   //     0, 2);
                                        //   if (x == false) {
                                        //     displayDialog();
                                        //   }
                                        //   else {
                                        //    // addingMissionRequest();
                                        //   }
                                        // }
                                        )
                                  ],),
                              ]
                              )
                          ),
                        )

                      ]),
                ),
              ),
        ),
      );
  }

  int daysBetween(DateTime from, DateTime to) {
    from = DateTime(from.year, from.month, from.day);
    to = DateTime(to.year, to.month, to.day);
    return (to
        .difference(from)
        .inHours / 24).round();
  }

  void selectionChanged(DateRangePickerSelectionChangedArgs args) {
    SchedulerBinding.instance.addPostFrameCallback((duration) {
      setState(() {
        _startDate = DateFormat('yyyy-MM-dd').format(args.value.startDate).toString();
        _StartDateController.text=_startDate;

        DateTime? start = DateTime.tryParse(
            DateFormat('yyyy-MM-dd').format(args.value.startDate).toString());
        _endDate = DateFormat('yyyy-MM-dd')
            .format(args.value.endDate ?? args.value.startDate)
            .toString();
        _EndDateController.text=_endDate;

        DateTime? end = DateTime.tryParse(DateFormat('yyyy-MM-dd')
            .format(args.value.endDate ?? args.value.startDate)
            .toString());

        final data = daysBetween(start!, end!);
        durtionValue = data+1;
        _DurationEditingController.text = durtionValue
            .toString(); //Duration difference = _endDate(_startDate);

      });
    });
  }

  Widget getDateRangePicker() {
    return Card(
        child: SfDateRangePicker(
          view: DateRangePickerView.month,
          controller: _controller,
          selectionMode: DateRangePickerSelectionMode.range,
          onSelectionChanged: selectionChanged,
          allowViewNavigation: false,
        ));
  }

  // Widget buildHoursCard() {
  //   DateTime start =;
  //   return Column(
  //       children: List.generate(
  //       DateTime.parse(_endDate).difference()DateTime.parse(_startDate).inDays + 1,
  //               (index) {
  //             DateTime day = DateTime.parse(_startDate).add(Duration(days: index));
  //             return Card(
  //               child: ListTile(
  //                 title: Text(DateFormat('yyyy-MM-dd').format(day)),
  //                 subtitle: Row(
  //                   children: [
  //                     Text(AppStrings.from),
  //                     ElevatedButton(
  //                       onPressed: () async {
  //                         TimeOfDay? time = await showTimePicker(
  //                           context: context,
  //                           initialTime: TimeOfDay(hour: 9, minute: 0),
  //                         );
  //                         if (time != null) {
  //                           setState(() {
  //                             selectedHours.add(time);
  //                           });
  //                         }
  //                       },
  //                       child: Text("اختار الساعة من"),
  //                     ),
  //                     Text(AppStrings.to),
  //                     ElevatedButton(
  //                       onPressed: () async {
  //                         TimeOfDay? time = await showTimePicker(
  //                           context: context,
  //                           initialTime: TimeOfDay(hour: 17, minute: 0),
  //                         );
  //                         if (time != null) {
  //                           setState(() {
  //                             selectedHours.add(time);
  //                           });
  //                         }
  //                       },
  //                       child: Text("اختار الساعة إلى"),
  //                     ),
  //                   ],
  //                 ),
  //               ),
  //             );
  //           }
  //   )
  //   );
  // }


  Future showDialogDate() {
    return
      showDialog(
          context: context,
          builder: (context) =>
              StatefulBuilder
                (builder: (context, setState) =>
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


                              Navigator.of(context, rootNavigator: true).pop(
                                  context);
                              //Navigator.pop(context,true);
                              // });
                            },
                          )
                        ],

                      )
                  )
              ));
  }

  Map<String, Map<String, TimeOfDay>> selectedHoursPerDay = {};

  Future buildHoursCard() {
    return showDialog(
      context: context,
      builder: (context) => StatefulBuilder(
        builder: (context, setState) {
          int totalDays = DateTime.parse(fixDateFormat(_endDate))
              .difference(DateTime.parse(fixDateFormat(_startDate)))
              .inDays + 1;

          return SizedBox(
            height: 400,
            child: Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: totalDays,
                    itemBuilder: (context, index) {
                      DateTime day = DateTime.parse(fixDateFormat(_startDate)).add(Duration(days: index));
                      String dayStr = DateFormat('yyyy-mm-dd').format(day);

                      return Card(
                        child: ListTile(
                          title: Text(dayStr),
                          subtitle: Row(
                            children: [
                              Text(AppStrings.from.tr()),
                              ElevatedButton(
                                onPressed: () async {
                                  TimeOfDay? fromTime = await showTimePicker(
                                    context: context,
                                    initialTime: TimeOfDay(hour: 9, minute: 0),
                                  );
                                  if (fromTime != null) {
                                    setState(() {
                                      selectedHoursPerDay[dayStr] ??= {};
                                      selectedHoursPerDay[dayStr]!['from'] = fromTime;

                                        final hour = fromTime.hour.toString().padLeft(2, '0');
                                        final minute = fromTime.minute.toString().padLeft(2, '0');
                                      String formattedTime = "$hour:$minute";
                                      _startTime=fromTime;
                                      _startTimeStr=formattedTime;

                                      _StartDateController.text=_startDate + _startTimeStr!;
                                    });
                                  }
                                },
                                child: Text(
                                  selectedHoursPerDay[dayStr]?['from']?.format(context) ?? AppStrings.selectHours.tr(),
                                ),
                              ),
                              SizedBox(width: 10),
                              Text(AppStrings.to.tr()),
                              ElevatedButton(
                                onPressed: () async {
                                  TimeOfDay? toTime = await showTimePicker(
                                    context: context,
                                    initialTime: TimeOfDay(hour: 17, minute: 0),
                                  );
                                  if (toTime != null) {
                                    setState(() {
                                      selectedHoursPerDay[dayStr] ??= {};
                                      selectedHoursPerDay[dayStr]!['to'] = toTime;

                                      final hour = toTime.hour.toString().padLeft(2, '0');
                                      final minute = toTime.minute.toString().padLeft(2, '0');
                                      String formattedTime = "$hour:$minute";

                                      _endTime=toTime;
                                      _endTimeStr=formattedTime;
                                      _EndDateController.text=_endDate + _endTimeStr!;

                                    });
                                  }
                                },
                                child: Text(
                                  selectedHoursPerDay[dayStr]?['to']?.format(context) ?? AppStrings.selectHours.tr(),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    print(selectedHoursPerDay); // You can use it as needed
                    Navigator.pop(context);
                  },
                  child: Text(AppStrings.ok.tr()),
                ),
              ],
            ),
          );
        },
      ),
    );
  }



  // late Future<DateTime?> _selectedDate;
  //
  //
  // Future<void> showCustomDateTimePicker(BuildContext context) async {
  //   DateTime initialDate = DateTime.now();
  //
  //   await showDialog(
  //     context: context,
  //     builder: (context) {
  //       return StatefulBuilder(
  //         builder: (context, setState) {
  //           return AlertDialog(
  //             title: Text('اختر التاريخ والوقت'),
  //             content: SingleChildScrollView( // ✅ هذا يمنع مشاكل overflow
  //               child: SizedBox(
  //                 width: double.maxFinite, // اختياري لتوسيع العرض
  //                 child: Column(
  //                   mainAxisSize: MainAxisSize.min,
  //                   children: [
  //                     CalendarDatePicker(
  //                       initialDate: initialDate,
  //                       firstDate: DateTime(2020),
  //                       lastDate: DateTime(2100),
  //                       onDateChanged: (date) {
  //                         setState(() {
  //                           _selectedDate = Future.value(date);
  //                         });
  //                       },
  //                     ),
  //                     SizedBox(height: 16),
  //                     Row(
  //                       children: [
  //                         Text("من: "),
  //                         TextButton(
  //                           onPressed: () async {
  //                             TimeOfDay? time = await showTimePicker(
  //                               context: context,
  //                               initialTime: TimeOfDay(hour: 9, minute: 0),
  //                             );
  //                             if (time != null) {
  //                               setState(() {
  //                                 _startTime = time;
  //                               });
  //                             }
  //                           },
  //                           child: Text(_startTime == null
  //                               ? "اختيار"
  //                               : _startTime!.format(context)),
  //                         ),
  //                       ],
  //                     ),
  //                     Row(
  //                       children: [
  //                         Text("إلى: "),
  //                         TextButton(
  //                           onPressed: () async {
  //                             TimeOfDay? time = await showTimePicker(
  //                               context: context,
  //                               initialTime: TimeOfDay(hour: 17, minute: 0),
  //                             );
  //                             if (time != null) {
  //                               setState(() {
  //                                 _endTime = time;
  //                               });
  //                             }
  //                           },
  //                           child: Text(_endTime == null
  //                               ? "اختيار"
  //                               : _endTime!.format(context)),
  //                         ),
  //                       ],
  //                     ),
  //                   ],
  //                 ),
  //               ),
  //             ),
  //             actions: [
  //               TextButton(
  //                 onPressed: () => Navigator.of(context).pop(),
  //                 child: Text("إلغاء"),
  //               ),
  //               ElevatedButton(
  //                 onPressed: () async {
  //                   DateTime? date = await _selectedDate;
  //                   if (date != null && _startTime != null && _endTime != null) {
  //                     DateTime from = DateTime(date.year, date.month, date.day,
  //                         _startTime!.hour, _startTime!.minute);
  //                     DateTime to = DateTime(date.year, date.month, date.day,
  //                         _endTime!.hour, _endTime!.minute);
  //                     print("التاريخ المختار: $date");
  //                     print("من: $from");
  //                     print("إلى: $to");
  //                     Navigator.of(context).pop();
  //                   }
  //                 },
  //                 child: Text("تم"),
  //               ),
  //             ],
  //           );
  //         },
  //       );
  //     },
  //   );
  // }
  // Future<void> showCustomDateTimePicker1(BuildContext context) async {
  //   DateTime selectedDate = DateTime.now();
  //   TimeOfDay? startTime;
  //   TimeOfDay? endTime;
  //
  //   await showDialog(
  //     context: context,
  //     builder: (context) {
  //       return AlertDialog(
  //         title: Text('اختر التاريخ والوقت'),
  //       content: SingleChildScrollView( // ✅ هذا يمنع مشاكل overflow
  //       child: SizedBox(
  //       width: double.maxFinite, // اختياري لتوسيع العرض
  //       child: Column(
  //             mainAxisSize: MainAxisSize.min,
  //             children: [
  //               CalendarDatePicker(
  //                 initialDate: selectedDate,
  //                 firstDate: DateTime(2020),
  //                 lastDate: DateTime(2100),
  //                 onDateChanged: (date) {
  //                   selectedDate = date;
  //                 },
  //               ),
  //               SizedBox(height: 16),
  //               Row(
  //                 children: [
  //                   Text("من: "),
  //                   TextButton(
  //                     onPressed: () async {
  //                       TimeOfDay? picked = await showTimePicker(
  //                         context: context,
  //                         initialTime: TimeOfDay(hour: 9, minute: 0),
  //                       );
  //                       if (picked != null) {
  //                         startTime = picked;
  //                       }
  //                     },
  //                     child: Text(
  //                       startTime == null
  //                           ? "اختيار"
  //                           : startTime!.format(context),
  //                     ),
  //                   ),
  //                 ],
  //               ),
  //               Row(
  //                 children: [
  //                   Text("إلى: "),
  //                   TextButton(
  //                     onPressed: () async {
  //                       TimeOfDay? picked = await showTimePicker(
  //                         context: context,
  //                         initialTime: TimeOfDay(hour: 17, minute: 0),
  //                       );
  //                       if (picked != null) {
  //                         endTime = picked;
  //                       }
  //                     },
  //                     child: Text(
  //                       endTime == null
  //                           ? "اختيار"
  //                           : endTime!.format(context),
  //                     ),
  //                   ),
  //                 ],
  //               ),
  //             ],
  //           ),
  //         ),
  //    ),
  //         actions: [
  //           TextButton(
  //             onPressed: () => Navigator.of(context).pop(),
  //             child: Text("إلغاء"),
  //           ),
  //           ElevatedButton(
  //             onPressed: () {
  //               if (startTime != null && endTime != null) {
  //                 final from = DateTime(
  //                   selectedDate.year,
  //                   selectedDate.month,
  //                   selectedDate.day,
  //                   startTime!.hour,
  //                   startTime!.minute,
  //                 );
  //                 final to = DateTime(
  //                   selectedDate.year,
  //                   selectedDate.month,
  //                   selectedDate.day,
  //                   endTime!.hour,
  //                   endTime!.minute,
  //                 );
  //                 print("من: $from");
  //                 print("إلى: $to");
  //                 Navigator.of(context).pop();
  //               }
  //             },
  //             child: Text("تم"),
  //           ),
  //         ],
  //       );
  //     },
  //   );
  // }

  String fixDateFormat(String date) {
    DateTime parsedDate = DateFormat('dd-MM-yyyy').parse(date);
    return DateFormat('yyyy-MM-dd').format(parsedDate);
  }

  final picker = ImagePicker();

  DropdownButton getDropDownDurationItems() {
    // List<String> list = <String>[AppStrings.days.tr().toString()+"/"+AppStrings.day.tr().toString(),
    //   '1/2'+AppStrings.day.tr().toString(), '1/4'+ AppStrings.day.tr().toString()];
    List<String> list = <String>[AppStrings.days.tr().toString(),
      AppStrings.hours.tr().toString() ];
    return DropdownButton<String>(
      value: daysOrHours,
      onChanged: (String? value) {
        setState(() {
          daysOrHours = value!;
        });
      },
      items: list.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }

  Widget? displayDialog() {
    showAnimatedDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return ClassicGeneralDialogWidget(
          titleText: AppStrings.Information.tr(),
          contentText: AppStrings.ok,
          onPositiveClick: () {
            Navigator.of(context).pop();
          },
        );
      },
      animationType: DialogTransitionType.fade,
      curve: Curves.linear,
      duration: const Duration(seconds: 1),
    );
    return null;
  }

  Future<bool?> getValidateMission(String startDate, String endDate,
       int id) async
  {
    List<ValidationMissionModel> validationMission = [];
    bool? flag = false;
    userId = await _appPreferences.getUserToken();
    final response = await http.get(
      //{{baseUrl}}/Api/Mission/ValidateMission?from=2023-08-27 10:00:00.000&to=2023-08-27 11:00:00.000&unit=2
        Uri.parse('${Constants
            .validateMission}$startDate&to=$endDate&unit=$id'),
        headers: <String, String>
        {'Content-Type': 'application/json; charset=UTF-8', 'userId': userId!});
    Map<String, dynamic> responseData;

    String jsonsDataString = response.body.toString();
    responseData = json.decode(jsonsDataString);


    if (response.statusCode == 200) {
      flag = responseData.values
          .toList()
          .first;
    }

    //   validationMission.clear();
    //   for (var i in responseData.values) {
    //     validationMission.add(ValidationMissionModel.fromJson(i));
    //   }
    //   return validationMission[0].isValid ;
    // } else {
    return flag;
    // }

  }


  Widget? displayDialoge()
  {
    showAnimatedDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return ClassicGeneralDialogWidget(
          titleText: AppStrings.Alerts.tr(),
          contentText: AppStrings.Was_Saved_Successfully.tr(),
          positiveText:  AppStrings.confirm.tr(),
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

  Widget? displayFaileDialoge()
  {
    showAnimatedDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return ClassicGeneralDialogWidget(
          //titleText: AppStrings.tr(),
          positiveText:  AppStrings.confirm.tr(),
          contentText: AppStrings.saving_Failed,
          onPositiveClick: () {
            Navigator.of(context).pop();
          },

        );
      },
      animationType: DialogTransitionType.sizeFade,
      curve: Curves.linear,
      duration: Duration(seconds: 1),
    );
  }

  void showImagePicker(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (builder) {
          return StatefulBuilder(
              builder: (BuildContext context, StateSetter setState) {
                return Card(
                  child: Container(
                      width: MediaQuery
                          .of(context)
                          .size
                          .width,
                      height: MediaQuery
                          .of(context)
                          .size
                          .height / 4.2,
                      margin: const EdgeInsets.only(top: 8.0),
                      padding: const EdgeInsets.all(12),
                      child: Column(
                        children: [
                          Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children:
                              [
                                Expanded(
                                  child: ListTile(
                                    title: const Text("شهادة طبية"),
                                    leading: Radio(
                                      value: 1,
                                      groupValue: selectedOption,
                                      activeColor: Colors.blue,
                                      // Change the active radio button color here
                                      fillColor: WidgetStateProperty.all(
                                          Colors.blue),
                                      // Change the fill color when selected
                                      splashRadius: 20,
                                      // Change the splash radius when clicked
                                      onChanged: (int? value) {
                                        setState(() {
                                          selectedOption = value!;
                                        });
                                      },
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: ListTile(
                                    title: const Text("وثيقة مرضى"),
                                    leading: Radio(
                                      value: 2,
                                      groupValue: selectedOption,
                                      activeColor: Colors.blue,
                                      // Change the active radio button color here
                                      fillColor: WidgetStateProperty.all(
                                          Colors.blue),
                                      // Change the fill color when selected
                                      splashRadius: 25,
                                      // Change the splash radius when clicked
                                      onChanged: (int? value) {
                                        setState(() {
                                          selectedOption = value!;
                                        });
                                      },
                                    ),
                                  ),
                                ),
                              ]
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                  child: InkWell(
                                    child: Column(
                                      children: [
                                        Icon(Icons.image, size: 60.0,
                                            color: Colors.blue),
                                        SizedBox(height: 12.0),
                                        Text(
                                          AppStrings.Gallary.tr(),
                                          textAlign: TextAlign.center,
                                          style: TextStyle(fontSize: 16,
                                              color: Colors.black),
                                        )
                                      ],
                                    ),
                                    onTap: () {
                                      _imgFromGallery();
                                      Navigator.pop(context, true);
                                    },
                                  )),
                              Expanded(
                                  child: InkWell(
                                    child: SizedBox(
                                      child: Column(
                                        children: [
                                          Icon(Icons.camera_alt, size: 60.0,
                                            color: Colors.blue,),
                                          SizedBox(height: 12.0),
                                          Text(
                                            AppStrings.photoCamera.tr(),
                                            textAlign: TextAlign.center,
                                            style: TextStyle(fontSize: 16,
                                                color: Colors.black),
                                          )
                                        ],
                                      ),
                                    ),
                                    onTap: () {
                                      _imgFromCamera();
                                      Navigator.pop(context, true);
                                    },
                                  ))
                            ],
                          ),
                        ],
                      )),
                );
              });
        }
    );
  }

  _imgFromGallery() async {
    await picker.pickImage(
        source: ImageSource.gallery, imageQuality: 50
    ).then((value) {
      if (value != null) {
        _cropImage(File(value.path));
      }
    });
  }

  _imgFromCamera() async {
    await picker.pickImage(
        source: ImageSource.camera, imageQuality: 50
    ).then((value) {
      if (value != null) {
        _cropImage(File(value.path));
      }
    });
  }

  _cropImage(File imgFile) async {
    final croppedFile = await ImageCropper().cropImage(
        sourcePath: imgFile.path,

        uiSettings: [AndroidUiSettings(
            toolbarTitle: "Image Cropper",
            toolbarColor: Colors.deepOrange,
            toolbarWidgetColor: Colors.white,
            initAspectRatio: CropAspectRatioPreset.original,
            lockAspectRatio: false),
          IOSUiSettings(
            title: "Image Cropper",
          )
        ]);
    if (croppedFile != null) {
      imageCache.clear();
      setState(() {
        imageFile = File(croppedFile.path);
        if (selectedOption == 1) {
          //_AttachmentEditingController.text = croppedFile.path.toString();
          _AttachmentEditingController.text = "وثيقة مرضى";
        } else {
          _AttachmentEditingController.text = "شهادة طبية";
        }
      });
      // reload();
    }
  }

  void selectImage(BuildContext context) async {
    Map<Permission, PermissionStatus> statuses = await [
      Permission.storage, Permission.camera].request();
    if (statuses[Permission.storage]!.isGranted &&
        statuses[Permission.camera]!.isGranted) {
      showImagePicker(context);
    }
  }




  Future addingMissionRequest()  async
  {
    userId = await _appPreferences.getUserToken();
    var uri = Uri.parse(Constants.saveVacation);


    var response = await http.post(
        uri,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8', 'userId': userId!},
        body: jsonEncode(<String, dynamic>{
          "destination": _DestinationEditingController.text,
          "from": _startDate,
          "to": _endDate,
          "duration": _DurationEditingController.text,
          "unit":1,
          "notes": _NoteEditingController.text,
          "request": {
            "reviewers": [
              {"id": 121, "code": "", "name": ""},
              {"id": 121, "code": "", "name": ""}
            ]
          }
        }));
    if (response.statusCode == 200) {
      var x = Result.fromJson(jsonDecode(response.body));
      bool y = x.isValid;
      if (y == true) {
        displayDialoge();
        setState(() {
       //   message=x.message;
        });
      } else {
        displayFaileDialoge();
      }
    }
    else {
      displayFaileDialoge();
    }
  }
}


//________________save Mission________________________
class Result {
  //final String message;
  final bool isValid;


  const Result({
   // required this.message,
    required this.isValid});

  factory Result.fromJson(Map<String, dynamic> json) {
    return Result(
        isValid: json['IsValid']

    );
  }


}



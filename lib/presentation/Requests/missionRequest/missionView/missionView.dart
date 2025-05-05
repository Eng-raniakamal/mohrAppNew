//
// import 'dart:convert';
// import 'dart:core';
//
// import 'dart:io';
//
// import 'package:animated_theme_switcher/animated_theme_switcher.dart';
// import 'package:easy_localization/easy_localization.dart';
// import 'package:essmohr/domain/model/model.dart';
// import 'package:essmohr/presentation/widgets/appbarstart.dart';
// import 'package:essmohr/presentation/widgets/autoCompleteTextField.dart';
// import 'package:essmohr/presentation/widgets/profile_widget.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/scheduler.dart';
// import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
// import 'package:image_cropper/image_cropper.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:essmohr/application/app_prefs.dart';
// import 'package:essmohr/application/constants.dart';
// import 'package:essmohr/presentation/resources/colors.dart';
// import 'package:essmohr/application/di.dart';
// import 'package:essmohr/domain/model/navigationManu.dart';
//
// import 'package:essmohr/presentation/resources/strings_manager.dart';
// import 'package:permission_handler/permission_handler.dart';
// import 'package:syncfusion_flutter_datepicker/datepicker.dart';
// import 'package:http/http.dart' as http;
//
// class MissionRequestView extends StatefulWidget implements NavigationStates
// {
//   const MissionRequestView ({Key? key}) : super(key: key);
//   @override
//   State<MissionRequestView > createState() => _MissionRequestViewState();
// }
//
// class _MissionRequestViewState extends State<MissionRequestView>with TickerProviderStateMixin {
//
//   final AppPreferences _appPreferences = instance<AppPreferences>();
//
//   final _Formkey = GlobalKey<FormState>();
//   String? dropDownValue;
//   int selectedOption = 1;
//   var MissionTypeId;
//   DateTime Fromdate = DateTime(2023);
//   DateTime Todate = DateTime(2023);
//   bool oKPressed = false;
//   List<String>? MissionType;
//   String? message;
//
//   String? _selectedMissionType;
//   var _currentIndex = 0;
//   String? selectedMissionType;
//   String selectedTimeType = "please select time type";
//   late String _startDate, _endDate;
//   late int durtionValue;
//   final DateRangePickerController _controller = DateRangePickerController();
//   final TextEditingController _DestinationEditingController = TextEditingController();
//   final TextEditingController _DurationEditingController = TextEditingController();
//   late TextEditingController _StartDateController = TextEditingController();
//   final TextEditingController _EndDateController = TextEditingController();
//   final TextEditingController _ReplacementEditingController = TextEditingController();
//   final TextEditingController _NoteEditingController = TextEditingController();
//   final TextEditingController _ReviewerEditingController = TextEditingController();
//   final TextEditingController _AttachmentEditingController = TextEditingController();
//   String? userId;
//
//   @override
//   void initState() {
//     final DateTime today = DateTime.now();
//     _startDate = DateFormat('dd-MM-yyyy')
//         .format(today.subtract(const Duration(days: 1)))
//         .toString();
//     _endDate = DateFormat('dd-MM-yyyy').format(today).toString();
//     durtionValue = 0;
//
//     // MissionType =  await getMissionType();
//     super.initState();
//     initDB();
//   }
//
//   void initDB() async
//   {
//     //MissionType = await getMissionType();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return
//       ThemeSwitchingArea(
//         child: Builder(
//           builder: (context) =>
//               Scaffold(
//                 appBar: buildAppBarstart(context),
//                 // backgroundColor: colorManager.white,
//                 body:
//                 SingleChildScrollView(
//                   child: Column(
//                       children: [
//                         Align(
//                             alignment: Alignment.center,
//                             child: Text("طلب مامورية",
//                               style: TextStyle(fontWeight: FontWeight.bold,
//                                   fontSize: 22,
//                                   color: colorManager.lightprimary),)),
//                         Form(
//                           child: Container(
//                               padding: const EdgeInsets.only(
//                                   top: 12,
//                                   left: 28,
//                                   right: 28),
//                               child: Column(children: [
//                                 const SizedBox(height: 10)
//
//                                 // ,StatefulBuilder(
//                                 //     builder: (context, setState) =>
//                                 //         getMissionTypeDDL())
//
//                                 , const SizedBox(height: 5),
//                                 Row(
//                                   mainAxisAlignment: MainAxisAlignment.start,
//                                   children: [
//                                     // Text(durtionValue.toString(),style: const TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
//                                     Container(width: 250,
//                                       child: TextFormField(
//
//                                         controller: _DestinationEditingController,
//                                         //keyboardType: TextInputType.number,
//                                         decoration: InputDecoration(
//                                             focusedBorder: OutlineInputBorder(
//                                               borderSide: BorderSide(
//                                                   color: colorManager
//                                                       .greywithOpacity,
//                                                   width: 1.0),
//                                             ),
//                                             enabledBorder: OutlineInputBorder(
//                                               borderSide: BorderSide(
//                                                   color: colorManager
//                                                       .greywithOpacity,
//                                                   width: 1.0),
//                                             ),
//                                             // hintText:"1",
//                                             label: Text(AppStrings.destination.tr())),
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//
//                                 const SizedBox(height: 5),
//                                 Row(
//                                   mainAxisSize: MainAxisSize.min,
//                                   crossAxisAlignment: CrossAxisAlignment.center
//                                   , children: [
//                                   Text(AppStrings.days_hours.tr()),
//                                   const SizedBox(width: 15,),
//                                   getDropDownDurationItems(),
//                                 ],),
//                                 const SizedBox(height: 10),
//                                 Row(
//                                     children: [
//                                       Text('${AppStrings.from.tr()} : '),
//                                       Text(_startDate, style: const TextStyle(
//                                           fontSize: 15,
//                                           fontWeight: FontWeight.bold),),
//                                       const SizedBox(width: 40,),
//                                       Text('${AppStrings.to.tr()} : '),
//                                       Text(_endDate, style: const TextStyle(
//                                           fontSize: 15,
//                                           fontWeight: FontWeight.bold))
//                                     ]
//                                 ),
//                                 Row(
//                                   //crossAxisAlignment: CrossAxisAlignment.center,
//                                     mainAxisAlignment: MainAxisAlignment.center,
//                                     children: [
//                                       SizedBox(height: 40,
//                                         width: 150,
//                                         child: FloatingActionButton(
//                                             child: Text(
//                                                 AppStrings.select_time_duration
//                                                     .tr()),
//                                             onPressed: () async {
//                                               //oKPressed=false;
//                                               await showDialogDate();
//                                               setState(() {});
//                                             }),
//                                       )
//                                     ]),
//                                 const SizedBox(height: 10),
//                                 Row(
//                                   mainAxisAlignment: MainAxisAlignment.start,
//                                   children: [
//                                     // Text(durtionValue.toString(),style: const TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
//                                     Container(width: 250,
//                                       child: TextFormField(
//                                         readOnly: true,
//                                         controller: _DurationEditingController,
//                                         //keyboardType: TextInputType.number,
//                                         decoration: InputDecoration(
//                                             focusedBorder: OutlineInputBorder(
//                                               borderSide: BorderSide(
//                                                   color: colorManager
//                                                       .greywithOpacity,
//                                                   width: 1.0),
//                                             ),
//                                             enabledBorder: OutlineInputBorder(
//                                               borderSide: BorderSide(
//                                                   color: colorManager
//                                                       .greywithOpacity,
//                                                   width: 1.0),
//                                             ),
//                                             // hintText:"1",
//                                             label: Text(
//                                                 AppStrings.period.tr())),
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                                 const SizedBox(height: 10),
//                                 // Row(
//                                 //   mainAxisAlignment: MainAxisAlignment.start,
//                                 //   children: [
//                                 //     Container(width: 250,
//                                 //         child: AutoCompleteTextField(
//                                 //           date: "2024-10-30",
//                                 //           typeId: 0,
//                                 //           type: 1,)
//                                 //       // TextFormField(
//                                 //       //   controller: _ReplacementEditingController,
//                                 //       //   keyboardType: TextInputType.text,
//                                 //       //   decoration: InputDecoration(
//                                 //       //       focusedBorder: OutlineInputBorder(
//                                 //       //         borderSide: BorderSide(
//                                 //       //             color: colorManager
//                                 //       //                 .greywithOpacity,
//                                 //       //             width: 1.0),
//                                 //       //       ),
//                                 //       //       enabledBorder: OutlineInputBorder(
//                                 //       //         borderSide: BorderSide(
//                                 //       //             color: colorManager
//                                 //       //                 .greywithOpacity,
//                                 //       //             width: 1.0),
//                                 //       //       ),
//                                 //       //       label: Text(
//                                 //       //           AppStrings.Replacement.tr())),
//                                 //       // ),
//                                 //     ),
//                                 //
//                                 //   ],),
//                                 // const SizedBox(height: 10),
//                                 Row(
//                                   mainAxisAlignment: MainAxisAlignment.start,
//                                   children: [
//                                     Container(width: 250,
//                                         //reviwer
//                                         child: AutoCompleteTextField(
//                                           date: "2024-10-30",
//                                           typeId: 0,
//                                           type: 1,)
//                                       // child: TextFormField(
//                                       //   controller: _ReviewerEditingController,
//                                       //   keyboardType: TextInputType.text,
//                                       //   decoration: InputDecoration(
//                                       //       focusedBorder: OutlineInputBorder(
//                                       //         borderSide: BorderSide(
//                                       //             color: colorManager
//                                       //                 .greywithOpacity,
//                                       //             width: 1.0),
//                                       //       ),
//                                       //       enabledBorder: OutlineInputBorder(
//                                       //         borderSide: BorderSide(
//                                       //             color: colorManager
//                                       //                 .greywithOpacity,
//                                       //             width: 1.0),
//                                       //       ),
//                                       //
//                                       //       label: Text(
//                                       //           AppStrings.Reviewers.tr())),
//                                       //
//                                       // ),
//                                     ),
//
//                                   ],),
//                                 const SizedBox(height: 10),
//                                 Row(
//                                   mainAxisAlignment: MainAxisAlignment.start,
//                                   children: [
//                                     Container(width: 250,
//                                       child: TextFormField(
//                                         controller: _NoteEditingController,
//                                         keyboardType: TextInputType.text,
//                                         decoration: InputDecoration(
//                                             focusedBorder: OutlineInputBorder(
//                                               borderSide: BorderSide(
//                                                   color: colorManager
//                                                       .greywithOpacity,
//                                                   width: 1.0),
//                                             ),
//                                             enabledBorder: OutlineInputBorder(
//                                               borderSide: BorderSide(
//                                                   color: colorManager
//                                                       .greywithOpacity,
//                                                   width: 1.0),
//                                             ),
//
//                                             label: Text(AppStrings.notes.tr())),
//
//                                       ),
//                                     ),
//
//                                   ],),
//                                 //const SizedBox(height: 10),
//                                 // Row(
//                                 //   mainAxisAlignment: MainAxisAlignment.start,
//                                 //   children: [
//                                 //     Container(width: 250,
//                                 //         //reviwer
//                                 //         child: AutoCompleteTextField(
//                                 //           date: "2024-10-30",
//                                 //           typeId: 0,
//                                 //           type: 1,)
//                                 //       // child: TextFormField(
//                                 //       //   controller: _ReviewerEditingController,
//                                 //       //   keyboardType: TextInputType.text,
//                                 //       //   decoration: InputDecoration(
//                                 //       //       focusedBorder: OutlineInputBorder(
//                                 //       //         borderSide: BorderSide(
//                                 //       //             color: colorManager
//                                 //       //                 .greywithOpacity,
//                                 //       //             width: 1.0),
//                                 //       //       ),
//                                 //       //       enabledBorder: OutlineInputBorder(
//                                 //       //         borderSide: BorderSide(
//                                 //       //             color: colorManager
//                                 //       //                 .greywithOpacity,
//                                 //       //             width: 1.0),
//                                 //       //       ),
//                                 //       //
//                                 //       //       label: Text(
//                                 //       //           AppStrings.Reviewers.tr())),
//                                 //       //
//                                 //       // ),
//                                 //     ),
//                                 //
//                                 //   ],),
//                                 const SizedBox(height: 10),
//                                 Row(
//                                   mainAxisAlignment: MainAxisAlignment.start,
//                                   children: [
//                                     Container(width: 240,
//                                       child: TextFormField(
//                                         readOnly: true,
//                                         controller: _AttachmentEditingController,
//                                         keyboardType: TextInputType.url,
//                                         decoration: InputDecoration(
//                                             focusedBorder: OutlineInputBorder(
//                                               borderSide: BorderSide(
//                                                   color: colorManager
//                                                       .greywithOpacity,
//                                                   width: 1.0),
//                                             ),
//                                             enabledBorder: OutlineInputBorder(
//                                               borderSide: BorderSide(
//                                                   color: colorManager
//                                                       .greywithOpacity,
//                                                   width: 1.0),
//                                             ),
//                                             label: Text(
//                                                 AppStrings.attachments.tr())),
//
//                                       ),
//                                     ),
//                                     const SizedBox(width: 5,),
//                                     FloatingActionButton(heroTag: null, child:
//                                     const Text("+"), onPressed: () {
//                                       showImagePicker(context);
//                                     })
//                                   ],),
//                                 const SizedBox(height: 20),
//                                 Row(
//
//                                   mainAxisAlignment: MainAxisAlignment.center,
//                                   children: [
//                                     FloatingActionButton(heroTag: null,
//                                         child:
//                                         Text(AppStrings.submit.tr(),
//                                           textAlign: TextAlign.center,),
//                                         onPressed: () async{
//
//
//                                           bool? x = await getValidateMission(
//                                               _StartDateController.text,
//                                               _EndDateController.text,
//
//                                               2);
//                                               //int.parse(_DurationEditingController.text));
//                                           if (x == false) {
//                                             displayDialog();
//                                           }
//                                           else {
//                                             addingMissionRequest();
//                                           }
//
//
//                                         }
//                                         // {
//                                         //   // bool? x = await getValidateMission(
//                                         //   //     '2023-08-27', "2023-08-28", 572,
//                                         //   //     0, 2);
//                                         //   if (x == false) {
//                                         //     displayDialog();
//                                         //   }
//                                         //   else {
//                                         //    // addingMissionRequest();
//                                         //   }
//                                         // }
//                                         )
//                                   ],),
//                               ]
//                               )
//                           ),
//                         )
//
//                       ]),
//                 ),
//               ),
//         ),
//       );
//   }
//
//   int daysBetween(DateTime from, DateTime to) {
//     from = DateTime(from.year, from.month, from.day);
//     to = DateTime(to.year, to.month, to.day);
//     return (to
//         .difference(from)
//         .inHours / 24).round();
//   }
//
//   void selectionChanged(DateRangePickerSelectionChangedArgs args) {
//     SchedulerBinding.instance.addPostFrameCallback((duration) {
//       setState(() {
//         _startDate =
//             DateFormat('yyyy-MM-dd').format(args.value.startDate).toString();
//         _StartDateController.text=_startDate;
//
//         DateTime? start = DateTime.tryParse(
//             DateFormat('yyyy-MM-dd').format(args.value.startDate).toString());
//         _endDate = DateFormat('yyyy-MM-dd')
//             .format(args.value.endDate ?? args.value.startDate)
//             .toString();
//         _EndDateController.text=_endDate;
//
//         DateTime? end = DateTime.tryParse(DateFormat('yyyy-MM-dd')
//             .format(args.value.endDate ?? args.value.startDate)
//             .toString());
//
//         final data = daysBetween(start!, end!);
//         durtionValue = data+1;
//         _DurationEditingController.text = durtionValue
//             .toString(); //Duration difference = _endDate(_startDate);
//
//       });
//     });
//   }
//
//   Widget getDateRangePicker() {
//     return Card(
//         child: SfDateRangePicker(
//           view: DateRangePickerView.month,
//           controller: _controller,
//           selectionMode: DateRangePickerSelectionMode.range,
//           onSelectionChanged: selectionChanged,
//           allowViewNavigation: false,
//         ));
//   }
//
//   Future showDialogDate() {
//     return
//       showDialog(
//           context: context,
//           builder: (context) =>
//               StatefulBuilder
//                 (builder: (context, setState) =>
//                   SizedBox(
//                       height: 350,
//                       child:
//                       Column(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           getDateRangePicker(),
//                           FloatingActionButton(
//                             backgroundColor: colorManager.primary,
//                             child: Text(AppStrings.ok.tr()),
//                             onPressed: () {
//                               // setState(() {
//                               oKPressed = true;
//                               //attendanceData = await getApiAttendance();
//
//
//                               Navigator.of(context, rootNavigator: true).pop(
//                                   context);
//                               //Navigator.pop(context,true);
//                               // });
//                             },
//                           )
//                         ],
//
//                       )
//                   )
//               ));
//   }
//
//   final picker = ImagePicker();
//
//   DropdownButton getDropDownDurationItems() {
//     List<String> list = <String>[AppStrings.days.tr().toString()+"/"+AppStrings.day.tr().toString(),
//       '1/2'+AppStrings.day.tr().toString(), '1/4'+ AppStrings.day.tr().toString()];
//     return DropdownButton<String>(
//       value: dropDownValue,
//       //icon: const Icon(Icons.arrow_downward),
//       //elevation: 16,
//       //style: const TextStyle(color: Colors.deepPurple),
//       underline: Container(
//         // height: 2,
//         // color: Colors.deepPurpleAccent,
//       ),
//       onChanged: (String? value) {
//         // This is called when the user selects an item.
//         setState(() {
//           dropDownValue = value!;
//         });
//       },
//       items: list.map<DropdownMenuItem<String>>((String value) {
//         return DropdownMenuItem<String>(
//           value: value,
//           child: Text(value),
//         );
//       }).toList(),
//     );
//   }
//
//   // Widget getMissionTypeDDL() {
//   //   return FutureBuilder(
//   //       future: getMissionType(),
//   //       builder: (context, snapshot) {
//   //         if (snapshot.hasError) {
//   //           return Text('Error: ${snapshot.error}');
//   //         }
//   //         if (snapshot.data == null) {
//   //           return const CircularProgressIndicator();
//   //         }
//   //         return Padding(
//   //             padding: const EdgeInsets.all(5.0),
//   //             child: Column(
//   //                 mainAxisAlignment: MainAxisAlignment.start,
//   //                 children: [
//   //                   Row(
//   //                     crossAxisAlignment: CrossAxisAlignment.center,
//   //                     children: [
//   //                       // Text(AppStrings.Mission_Type.tr()),
//   //                       // SizedBox(
//   //                       //     width: 15),
//   //                       //
//   //                       // DropdownButton(
//   //                       //   //hint: const Text('-- select value --'),
//   //                       //   onChanged: (MissionType) =>
//   //                       //       setState(() =>
//   //                       //       selectedMissionType = MissionType!),
//   //                       //   value: selectedMissionType,
//   //                       //   items: [
//   //                       //     ...snapshot.data!.map(
//   //                       //           (item) =>
//   //                       //           DropdownMenuItem(
//   //                       //             value: item,
//   //                       //             child: Text(item),
//   //                       //           ),
//   //                       //     )
//   //                       //   ],
//   //                       // ),
//   //                       // ),
//   //
//   //                       // Expanded(
//   //                       //    child: ListView.separated(
//   //                       //      itemBuilder: (context, index) => ElevatedButton(
//   //                       //        onPressed: () => setState(
//   //                       //                () => _selectedMissionType = snapshot.data![index]),
//   //                       //        style: identical(
//   //                       //            _selectedMissionType, snapshot.data![index])
//   //                       //            ? ButtonStyle(
//   //                       //          backgroundColor: MaterialStateProperty.all(
//   //                       //              Colors.blue[400]),
//   //                       //          overlayColor: MaterialStateProperty.all(
//   //                       //              Colors.black12),
//   //                       //        )
//   //                       //            : ButtonStyle(
//   //                       //          backgroundColor:
//   //                       //          MaterialStateProperty.all(Colors.white),
//   //                       //          overlayColor: MaterialStateProperty.all(
//   //                       //              Colors.black12),
//   //                       //        ),
//   //                       //        child: Padding(
//   //                       //          padding: const EdgeInsets.all(4.0),
//   //                       //              child: Text(
//   //                       //                '${snapshot.data![index]}',
//   //                       //                style: const TextStyle(color: Colors.black),
//   //                       //              ),
//   //                       //        ),
//   //                       //      ),
//   //                       //      separatorBuilder: (context, _) =>
//   //                       //      const SizedBox(height: 12),
//   //                       //      itemCount: snapshot.data!.length,
//   //                       //    ),
//   //                       //  ),
//   //                     ],
//   //                   ),
//   //                 ]));
//   //       });
//   // }
//
//   Widget? displayDialog() {
//     showAnimatedDialog(
//       context: context,
//       barrierDismissible: true,
//       builder: (BuildContext context) {
//         return ClassicGeneralDialogWidget(
//           titleText: AppStrings.Information.tr(),
//           contentText: "DONE",
//           onPositiveClick: () {
//             Navigator.of(context).pop();
//           },
//         );
//       },
//       animationType: DialogTransitionType.fade,
//       curve: Curves.linear,
//       duration: const Duration(seconds: 1),
//     );
//     return null;
//   }
//
//   // Future<List<String>?> getMissionType() async {
//   //   // List<MissionType> a;
//   //   List<String> b = ["please select"];
//   //   userId = await _appPreferences.getUserToken();
//   //   var response = await http.get(
//   //       Uri.parse(Constants.MissionTypeUrl), headers: <String, String>
//   //   {'Content-Type': 'application/json; charset=UTF-8', 'userId': userId!});
//   //   var responseData;
//   //   // setState(() {
//   //   String jsonsDataString = response.body.toString();
//   //   responseData = json.decode(jsonsDataString);
//   //   // });
//   //
//   //
//   //   if (responseData != null) {
//   //     final a = (responseData as Iterable).map((data) {
//   //       return MissionType.fromJson(data as Map<String, dynamic>);
//   //     }).toList();
//   //
//   //
//   //     for (var item in a) {
//   //       b.add(item.name.toString());
//   //     }
//   //   }
//   //
//   //
//   //   //List<String> b = List<MissionType>.from(a['name'].toList());
//   //
//   //   //setState(() {
//   //   MissionType = b;
//   //   //});
//   //   return MissionType;
//   // }
//   //
//   Future<bool?> getValidateMission(String startDate, String endDate,
//        int id) async
//   {
//     List<ValidationMissionModel> validationMission = [];
//     bool? flag = false;
//     userId = await _appPreferences.getUserToken();
//     final response = await http.get(
//       //{{baseUrl}}/Api/Mission/ValidateMission?from=2023-08-27 10:00:00.000&to=2023-08-27 11:00:00.000&unit=2
//         Uri.parse('${Constants
//             .validateMission}$startDate&to=$endDate&unit=$id'),
//         headers: <String, String>
//         {'Content-Type': 'application/json; charset=UTF-8', 'userId': userId!});
//     Map<String, dynamic> responseData;
//
//     String jsonsDataString = response.body.toString();
//     responseData = json.decode(jsonsDataString);
//
//
//     if (response.statusCode == 200) {
//       flag = responseData.values
//           .toList()
//           .first;
//     }
//
//     //   validationMission.clear();
//     //   for (var i in responseData.values) {
//     //     validationMission.add(ValidationMissionModel.fromJson(i));
//     //   }
//     //   return validationMission[0].isValid ;
//     // } else {
//     return flag;
//     // }
//
//   }
//
//
//
//
//
//   Widget? displayDialoge()
//   {
//     showAnimatedDialog(
//       context: context,
//       barrierDismissible: true,
//       builder: (BuildContext context) {
//         return ClassicGeneralDialogWidget(
//           titleText: AppStrings.Alerts.tr(),
//           contentText: AppStrings.Was_Saved_Successfully.tr(),
//           positiveText:  AppStrings.confirm.tr(),
//           onPositiveClick: () {
//             Navigator.of(context).pop();
//           },
//
//         );
//       },
//       animationType: DialogTransitionType.fade,
//       curve: Curves.linear,
//       duration: Duration(seconds: 1),
//     );
//     return null;
//   }
//
//   Widget? displayFaileDialoge()
//   {
//     showAnimatedDialog(
//       context: context,
//       barrierDismissible: true,
//       builder: (BuildContext context) {
//         return ClassicGeneralDialogWidget(
//           //titleText: AppStrings.tr(),
//           positiveText:  AppStrings.confirm.tr(),
//           contentText: AppStrings.saving_Failed,
//           onPositiveClick: () {
//             Navigator.of(context).pop();
//           },
//
//         );
//       },
//       animationType: DialogTransitionType.sizeFade,
//       curve: Curves.linear,
//       duration: Duration(seconds: 1),
//     );
//   }
//
//   void showImagePicker(BuildContext context) {
//     showModalBottomSheet(
//         context: context,
//         builder: (builder) {
//           return StatefulBuilder(
//               builder: (BuildContext context, StateSetter setState) {
//                 return Card(
//                   child: Container(
//                       width: MediaQuery
//                           .of(context)
//                           .size
//                           .width,
//                       height: MediaQuery
//                           .of(context)
//                           .size
//                           .height / 4.2,
//                       margin: const EdgeInsets.only(top: 8.0),
//                       padding: const EdgeInsets.all(12),
//                       child: Column(
//                         children: [
//                           Row(
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               children:
//                               [
//                                 Expanded(
//                                   child: ListTile(
//                                     title: const Text("شهادة طبية"),
//                                     leading: Radio(
//                                       value: 1,
//                                       groupValue: selectedOption,
//                                       activeColor: Colors.blue,
//                                       // Change the active radio button color here
//                                       fillColor: WidgetStateProperty.all(
//                                           Colors.blue),
//                                       // Change the fill color when selected
//                                       splashRadius: 20,
//                                       // Change the splash radius when clicked
//                                       onChanged: (int? value) {
//                                         setState(() {
//                                           selectedOption = value!;
//                                         });
//                                       },
//                                     ),
//                                   ),
//                                 ),
//                                 Expanded(
//                                   child: ListTile(
//                                     title: const Text("وثيقة مرضى"),
//                                     leading: Radio(
//                                       value: 2,
//                                       groupValue: selectedOption,
//                                       activeColor: Colors.blue,
//                                       // Change the active radio button color here
//                                       fillColor: WidgetStateProperty.all(
//                                           Colors.blue),
//                                       // Change the fill color when selected
//                                       splashRadius: 25,
//                                       // Change the splash radius when clicked
//                                       onChanged: (int? value) {
//                                         setState(() {
//                                           selectedOption = value!;
//                                         });
//                                       },
//                                     ),
//                                   ),
//                                 ),
//                               ]
//                           ),
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: [
//                               Expanded(
//                                   child: InkWell(
//                                     child: Column(
//                                       children: [
//                                         Icon(Icons.image, size: 60.0,
//                                             color: Colors.blue),
//                                         SizedBox(height: 12.0),
//                                         Text(
//                                           AppStrings.Gallary.tr(),
//                                           textAlign: TextAlign.center,
//                                           style: TextStyle(fontSize: 16,
//                                               color: Colors.black),
//                                         )
//                                       ],
//                                     ),
//                                     onTap: () {
//                                       _imgFromGallery();
//                                       Navigator.pop(context, true);
//                                     },
//                                   )),
//                               Expanded(
//                                   child: InkWell(
//                                     child: SizedBox(
//                                       child: Column(
//                                         children: [
//                                           Icon(Icons.camera_alt, size: 60.0,
//                                             color: Colors.blue,),
//                                           SizedBox(height: 12.0),
//                                           Text(
//                                             AppStrings.photoCamera.tr(),
//                                             textAlign: TextAlign.center,
//                                             style: TextStyle(fontSize: 16,
//                                                 color: Colors.black),
//                                           )
//                                         ],
//                                       ),
//                                     ),
//                                     onTap: () {
//                                       _imgFromCamera();
//                                       Navigator.pop(context, true);
//                                     },
//                                   ))
//                             ],
//                           ),
//                         ],
//                       )),
//                 );
//               });
//         }
//     );
//   }
//
//   _imgFromGallery() async {
//     await picker.pickImage(
//         source: ImageSource.gallery, imageQuality: 50
//     ).then((value) {
//       if (value != null) {
//         _cropImage(File(value.path));
//       }
//     });
//   }
//
//   _imgFromCamera() async {
//     await picker.pickImage(
//         source: ImageSource.camera, imageQuality: 50
//     ).then((value) {
//       if (value != null) {
//         _cropImage(File(value.path));
//       }
//     });
//   }
//
//   _cropImage(File imgFile) async {
//     final croppedFile = await ImageCropper().cropImage(
//         sourcePath: imgFile.path,
//
//         uiSettings: [AndroidUiSettings(
//             toolbarTitle: "Image Cropper",
//             toolbarColor: Colors.deepOrange,
//             toolbarWidgetColor: Colors.white,
//             initAspectRatio: CropAspectRatioPreset.original,
//             lockAspectRatio: false),
//           IOSUiSettings(
//             title: "Image Cropper",
//           )
//         ]);
//     if (croppedFile != null) {
//       imageCache.clear();
//       setState(() {
//         imageFile = File(croppedFile.path);
//         if (selectedOption == 1) {
//           //_AttachmentEditingController.text = croppedFile.path.toString();
//           _AttachmentEditingController.text = "وثيقة مرضى";
//         } else {
//           _AttachmentEditingController.text = "شهادة طبية";
//         }
//       });
//       // reload();
//     }
//   }
//
//   void selectImage(BuildContext context) async {
//     Map<Permission, PermissionStatus> statuses = await [
//       Permission.storage, Permission.camera].request();
//     if (statuses[Permission.storage]!.isGranted &&
//         statuses[Permission.camera]!.isGranted) {
//       showImagePicker(context);
//     }
//   }
//
//
//
//
//   Future addingMissionRequest()  async
//   {
//     userId = await _appPreferences.getUserToken();
//     var uri = Uri.parse(Constants.saveVacation);
//
//
//     var response = await http.post(
//         uri,
//         headers: <String, String>{
//           'Content-Type': 'application/json; charset=UTF-8', 'userId': userId!},
//         body: jsonEncode(<String, dynamic>{
//           "destination": _DestinationEditingController.text,
//           "from": _startDate,
//           "to": _endDate,
//           "duration": _DurationEditingController.text,
//           "unit":1,
//           "notes": _NoteEditingController.text,
//           "request": {
//             "reviewers": [
//               {"id": 121, "code": "", "name": ""},
//               {"id": 121, "code": "", "name": ""}
//             ]
//           }
//         }));
//     if (response.statusCode == 200) {
//       var x = Result.fromJson(jsonDecode(response.body));
//       bool y = x.isValid;
//       if (y == true) {
//         displayDialoge();
//         setState(() {
//        //   message=x.message;
//         });
//       } else {
//         displayFaileDialoge();
//       }
//     }
//     else {
//       displayFaileDialoge();
//     }
//   }
// }
//
//
// class MissionType {
//   final int? id;
//   final String? name;
//   final int? type;
//   final int? balance;
//   final int? limit;
//   final bool? requiredAttachment;
//   MissionType ({
//     required this.id,
//     required this.name,
//     required this.type,
//     required this.balance,
//     required this.limit,
//     required this.requiredAttachment,
//   });
//   factory MissionType.fromJson(Map<String, dynamic> json) {
//     return MissionType(
//         id: json["Id"],
//         name: json["Name"],
//         type: json["Type"],
//         balance: json["Balance"],
//         limit: json["Limit"],
//         requiredAttachment:json["RequiredAttachment"]
//     );
//   }
// }
//
//
//
// //________________save Mission________________________
// class Result {
//   //final String message;
//   final bool isValid;
//
//
//   const Result({
//    // required this.message,
//     required this.isValid});
//
//   factory Result.fromJson(Map<String, dynamic> json) {
//     return Result(
//      //   message: json['Message'],
//         isValid: json['IsValid']
//
//     );
//   }
//
//
// }
//
// // class SaveMission{
// //
// // final int MissionTypeId;
// // final String fromDate;
// // final String toDate;
// // final int duration;
// // final String notes;
// //
// // final String  major;
// // final String university;
// // SaveMission({
// // required this.MissionTypeId,
// // required this.fromDate,
// // required this.toDate,
// // required this.duration,
// // required this.notes,
// // required this.major,
// // required this.university
// // });
// //
// // factory SaveMission.fromJson(Map<String, dynamic> json) {
// // return SaveMission(
// //     MissionTypeId: json["MissionTypeId"],
// //     fromDate: json["fromDate"],
// //     toDate: json["toDate"],
// //     duration: json["duration"],
// //     notes: json["notes"],
// //
// // major: json["Major"],
// // university: json["University"]
// // );
// // }
// // }
//
// // "MissionTypeId": 626,
// // "fromDate": "2024-03-21",
// // "toDate": "2024-03-22",
// // "duration":2,
// // "notes": "asddfasdfdsaf df sadf dasf sdaf dsafd saf dasf af sdf ",
// // "request": {
// // "reviewers" : [
// // {"employeeId": 121, "code": "", "name": ""},
// // {"employeeId": 122, "code": "", "name": ""}
//

import 'dart:core';
import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:essmohr/presentation/Requests/Permissions/permissionView/reviewPermission.dart';
import 'package:essmohr/presentation/Requests/Permissions/permissionView/reviewedPermission.dart';
import 'package:essmohr/presentation/Requests/Permissions/permissionView/submitPermission.dart';
import 'package:essmohr/presentation/Requests/Permissions/permissionView/viewPermission.dart';
import 'package:essmohr/presentation/Requests/missionRequest/missionView/reviewMission.dart';
import 'package:essmohr/presentation/Requests/missionRequest/missionView/reviewedMission.dart';
import 'package:essmohr/presentation/Requests/missionRequest/missionView/submitMission.dart';
import 'package:essmohr/presentation/Requests/missionRequest/missionView/viewMission.dart';
import 'package:essmohr/presentation/widgets/appbar_widget.dart';
import 'package:essmohr/presentation/widgets/appbarstart.dart';
import 'package:essmohr/presentation/widgets/navigator_bar.dart';
import 'package:flutter/material.dart';
import 'package:essmohr/application/app_prefs.dart';
import 'package:essmohr/application/constants.dart';
import 'package:essmohr/presentation/resources/colors.dart';
import 'package:essmohr/application/di.dart';
import 'package:essmohr/domain/model/navigationManu.dart';
import 'package:essmohr/presentation/resources/strings_manager.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class MissionView extends StatefulWidget implements NavigationStates
{
  const MissionView ({Key? key}) : super(key: key);
  @override
  State<MissionView > createState() => _MissionViewState();
}

class _MissionViewState extends State<MissionView> with TickerProviderStateMixin
{

  final AppPreferences _appPreferences = instance<AppPreferences>();
  final _Formkey = GlobalKey<FormState>();
  String? dropDownValue;
  int selectedOption = 1;
  var permissionTypeId;
  DateTime Fromdate = DateTime(2023);
  DateTime Todate = DateTime(2023);
  bool oKPressed = false;

  List<PermissionType> permissionType = [];
  List<PermissionType> items = [];

  String? message;
  String? selectedpermissionType;
  String selectedTimeType = "please select time type";
  late String _startDate, _endDate;
  late int durtionValue;

  String? userId;


  @override
  void initState() {
    final DateTime today = DateTime.now();
    _startDate = DateFormat('dd-MM-yyyy')
        .format(today.subtract(const Duration(days: 1)))
        .toString();
    _endDate = DateFormat('dd-MM-yyyy').format(today).toString();
    durtionValue = 0;

    // permissionType =  await getpermissionType();
    super.initState();
    initDB();
  }


  void initDB() async
  {

  }


  @override
  Widget build(BuildContext context) {
    final TabController _tabController = TabController(
        length: (4), vsync: this);

    return
      ThemeSwitchingArea (
          child: Builder(
            builder: (context) =>
                Scaffold(
                 // appBar: buildAppBar(context),
                  appBar: buildAppBarstart(context),
                  // backgroundColor: colorManager.white,
                  bottomNavigationBar:
                  NavigatorBar(index: 0, notificationNumber: Constants.notificationNumber,),

                  body:
                  Container(
                    height: MediaQuery
                        .of(context)
                        .size
                        .height,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [

                            Container(
                                padding: const EdgeInsets.only(top: 20),
                                width: MediaQuery
                                    .of(context)
                                    .size
                                    .width,
                                // height: 200,
                                //MediaQuery.of(context).size.height/3,
                                child: Form(
                                    key: _Formkey,
                                    child: Container(
                                      //height: 200,
                                      //MediaQuery.of(context).size.height/3,
                                      child: Column(
                                          children: [

                                            Container( //child:Align(
                                              alignment: Alignment.center,
                                              padding: const EdgeInsets.all(5),
                                              width: MediaQuery
                                                  .of(context)
                                                  .size
                                                  .width,
                                              height: 50,
                                              decoration: BoxDecoration(
                                                //color: Colors.grey[300],
                                                  borderRadius: BorderRadius
                                                      .circular(30.0,)),

                                              child: TabBar(
                                                controller: _tabController,
                                                isScrollable: true,
                                                labelColor: colorManager
                                                    .primary,
                                                unselectedLabelColor: colorManager
                                                    .primary,
                                                indicator: BoxDecoration(
                                                  borderRadius: BorderRadius
                                                      .circular(40.0),
                                                  color: colorManager
                                                      .greywithOpacity,
                                                ),
                                                tabs: [
                                                  Tab(text: "  ${AppStrings
                                                      .Submit
                                                      .tr()}  "),
                                                  Tab(text: "  ${AppStrings
                                                      .view
                                                      .tr()}  "),
                                                  Tab(text: "  ${AppStrings
                                                      .Review
                                                      .tr()}  "),
                                                  Tab(
                                                    text: "  ${AppStrings
                                                        .Reviewed
                                                        .tr()}  ",)
                                                ],
                                              ),
                                            ),

                                          ]
                                      ),
                                    )
                                )
                            ),

                            SizedBox(
                              child: Container(
                                width: MediaQuery
                                    .of(context)
                                    .size
                                    .width,
                                height: MediaQuery
                                    .of(context)
                                    .size
                                    .height * 2,
                                child: TabBarView(
                                  controller: _tabController,
                                  children: const [
                                    //ViewPermission(),
                                    MissionSubmit(),
                                    ViewMission(),
                                    ReviewMission(),
                                    ReviewedMission(),
                                    // ViewMission(),
                                    // ReviewMission(),
                                    // ReviewedMission(),

                                  ],
                                ),
                              ),
                            ),


                            //   ),
                          ]),
                    ),
                  ),
                ),
          )
      );
  }

}



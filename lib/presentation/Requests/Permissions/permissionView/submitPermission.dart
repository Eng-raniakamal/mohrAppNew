
import 'dart:async';
import 'dart:convert';
import 'dart:core';
import 'dart:io';
import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:essmohr/domain/model/model.dart';
import 'package:essmohr/presentation/widgets/appbarstart.dart';
import 'package:essmohr/presentation/widgets/autoCompleteTextField.dart';
import 'package:essmohr/presentation/widgets/profile_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

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




class PermissionSubmit extends StatefulWidget implements NavigationStates
{
  const PermissionSubmit ({Key? key}) : super(key: key);
  @override
  State<PermissionSubmit> createState() => _permissionSubmitState();
}




class _permissionSubmitState extends State<PermissionSubmit>with TickerProviderStateMixin {

  final AppPreferences _appPreferences = instance<AppPreferences>();
  final _Formkey = GlobalKey<FormState>();
  String? dropDownValue;
  int selectedOption = 1;
  var permissionTypeId;
  DateTime Fromdate = DateTime(2023);
  DateTime Todate = DateTime(2023);
  bool oKPressed = false;
  String selectedTimeType = "please select time type";
  List<PermissionType> permissionType=[];
  List<PermissionType> items=[];
  late Future<List<PermissionType>> _future;
  int? _selectedPermissionType;
  var _currentIndex = 0;
  String daysOrHours="days";
  String? selectedMissionType;
  //String selectedTimeType = "please select time type";
  late String _startDate, _endDate;
  String? message;
  String? _startTimeStr;
  String? _endTimeStr;
  TimeOfDay? _startTime;
  TimeOfDay? _endTime;
  late int durtionValue;
  final DateRangePickerController _controller = DateRangePickerController();
  late TextEditingController _StartDateController = TextEditingController();
  final TextEditingController _EndDateController = TextEditingController();
  final TextEditingController _DurationEditingController = TextEditingController();
  final TextEditingController _ReplacementEditingController = TextEditingController();
  final TextEditingController _NoteEditingController = TextEditingController();
  final TextEditingController _ReviewerEditingController = TextEditingController();
  final TextEditingController _AttachmentEditingController = TextEditingController();
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
    permissionType = await getPermissionType();
  }


  @override
  Widget build(BuildContext context) {
    return
      ThemeSwitchingArea(
        child: Builder(
          builder: (context) =>
              Scaffold(
                // appBar: buildAppBarstart(context),
                // backgroundColor: colorManager.white,
                body:
                SingleChildScrollView(
                  child: Column(
                      children: [
                        Align(
                            alignment: Alignment.center,
                            child: Text(AppStrings.permission_Request.tr(),
                              style: TextStyle(fontWeight: FontWeight.bold,
                                  fontSize: 22,
                                  color: colorManager.lightprimary),)),
                        Form(
                          child: Container(
                              padding: const EdgeInsets.only(
                                //top: 12,
                                  left: 28,
                                  right: 28),
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start
                                  ,children: [
                                const SizedBox(height: 10,width: 100,),
                                Row(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment: CrossAxisAlignment.start
                                    , children: [
                                  StatefulBuilder(
                                      builder: (context, setState) =>
                                          getPermissionTypeDDL())
                                ]),
                                const SizedBox(height: 5),
                                Row(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.center
                                  , children: [
                                  Text(AppStrings.days_hours.tr()),
                                  const SizedBox(width: 15,),
                                  getDropDownDurationItems(),
                                ],),
                                const SizedBox(height: 5),
                                Row(
                                    children: [
                                      Text('${AppStrings.from.tr()} : '),
                                      Text(_startDate, style: const TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold),),
                                      const SizedBox(width: 40,),
                                      Text('${AppStrings.to.tr()} : '),
                                      Text(_endDate, style: const TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold))
                                    ]
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
                                                      .greywithOpacity, width: 1.0),
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
                                        Text(AppStrings.Submit.tr(),
                                          textAlign: TextAlign.center,),
                                        onPressed: () async {
                                          bool? x = await getValidatePermission(
                                              _StartDateController.text,
                                              _EndDateController.text,
                                              _selectedPermissionType!,
                                              0,
                                              int.parse(_DurationEditingController.text));
                                          if (x == false) {
                                            displayDialoge(context);

                                          }
                                          else {
                                            addingPermissionRequest();
                                          }
                                        })
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

  void selectionChanged(DateRangePickerSelectionChangedArgs args) {
    SchedulerBinding.instance.addPostFrameCallback((duration) {
      setState(() {
        _startDate =
            DateFormat('yyyy-MM-dd').format(args.value.startDate).toString();
        DateTime? start = DateTime.tryParse(
            DateFormat('yyyy-MM-dd').format(args.value.startDate).toString());
        _endDate = DateFormat('yyyy-MM-dd')
            .format(args.value.endDate ?? args.value.startDate)
            .toString();
        DateTime? end = DateTime.tryParse(DateFormat('yyyy-MM-dd')
            .format(args.value.endDate ?? args.value.startDate)
            .toString());

        final data = daysBetween(start!, end!);
        durtionValue = data;
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

  final picker = ImagePicker();

  // DropdownButton getDropDownDurationItems() {
  //   List<String> list = <String>['day/days', '1/2 day', '1/4 day'];
  //   return DropdownButton<String>(
  //     value: dropDownValue,
  //     //icon: const Icon(Icons.arrow_downward),
  //     //elevation: 16,
  //     //style: const TextStyle(color: Colors.deepPurple),
  //     underline: Container(
  //       // height: 2,
  //       // color: Colors.deepPurpleAccent,
  //     ),
  //     onChanged: (String? value) {
  //       // This is called when the user selects an item.
  //       setState(() {
  //         dropDownValue = value!;
  //       });
  //     },
  //     items: list.map<DropdownMenuItem<String>>((String value) {
  //       return DropdownMenuItem<String>(
  //         value: value,
  //         child: Text(value),
  //       );
  //     }).toList(),
  //   );
  // }

  Widget getPermissionTypeDDL() {
    return FutureBuilder(
        future: getPermissionType(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          }
          if (snapshot.data == null) {
            return const CircularProgressIndicator();
          }
          return    Expanded( // Forces the child to take available space
              child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row( mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(AppStrings.permission_Type.tr()),
                            const SizedBox(
                                width: 30),
                            DropdownButton(
                              //hint: const Text('-- select value --'),
                              onChanged: (permissionType) =>
                                  setState(() =>
                                  _selectedPermissionType = permissionType!),
                              value: _selectedPermissionType,
                              items: [
                                ...snapshot.data!.map(
                                      (item) =>
                                      DropdownMenuItem(
                                        value: item.valueNumber,
                                        child: Text(item.text.toString()),
                                      ),
                                )
                              ],
                            ),
                          ]),

                    ],
                  )
              ));
        });
  }


  //
  Future<List<PermissionType>>getPermissionType() async {
    try {
      List<String> b = ["please select"];
      userId = await _appPreferences.getUserToken();
      var response = await http.get(
          Uri.parse(Constants.permissionTypeUrl), headers: <String, String>
      {'Content-Type': 'application/json; charset=UTF-8', 'userId': userId!})
          .timeout(Duration(seconds: 30));
      var responseData;
      if (response.statusCode == 200)
      {
        List<dynamic> data = jsonDecode(response.body);
        return data.map((json) => PermissionType.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load Permission types');
      }
    }
    on TimeoutException catch (e) {
      print('Timeout Error: $e');
      throw Exception('Timeout');
    } on SocketException catch (e) {
      print('Socket Error: $e');
      throw Exception('no internet');
    } catch (e) {
      print('General Error: $e');
      throw Exception('Failed to load Permission types');
    }
  }

  Future<bool?> getValidatePermission(String startDate, String endDate,
      int permissionTypeId, int id, int duration) async
  {
    List<ValidationMissionModel> validationpermission = [];
    bool? flag = false;
    userId = await _appPreferences.getUserToken();
    final response = await http.get(
      //{{baseUrl}}/api/permission/Vaildatepermission?permissionTypeId=572&fromDate=2023-08-27&toDate=2023-08-28&id=0&duration=2
        Uri.parse('${Constants
            .validatePermission}$startDate&toDate=$endDate&permissionType=$id'),
        headers: <String, String>{'Content-Type': 'application/json; charset=UTF-8', 'userId': userId!});

    Map<String, dynamic> responseData;

    String jsonsDataString = response.body.toString();
    responseData = json.decode(jsonsDataString);


    if (response.statusCode == 200) {
      flag = responseData.values
          .toList()
          .first;
      setState(() {
        message=responseData["Message"].toString();
      });
    }


    return flag;
    // }

  }

  Future addingPermissionRequest() async
  {
    userId = await _appPreferences.getUserToken();
    var uri = Uri.parse(Constants.savePermission);


    var response = await http.post(
        uri,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8', 'userId': userId!},
        body: jsonEncode(<String, dynamic>{

          "fromDate": _startDate,
          "toDate": _endDate,
          "permissionTypeId": permissionTypeId,
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
        displayDialoge(context);
        setState(() {
          // addingSuccess = true;
        });
      } else {
        displayFaileDialoge(context);
      }
    }
    else {
      displayFaileDialoge(context);
    }
  }



  void displayDialoge(BuildContext context) {
    AwesomeDialog(
      context: context,
      dialogType: DialogType.success,
      animType: AnimType.scale,
      title: AppStrings.alerts.tr(),
      desc: AppStrings.Was_Saved_Successfully.tr(),
      btnOkText: AppStrings.confirm.tr(),
      btnOkOnPress: () {
        Navigator.of(context).pop();
      },
    ).show();
  }

  void displayTimeFaileDialoge(BuildContext context) {
    AwesomeDialog(
      context: context,
      dialogType: DialogType.warning,
      animType: AnimType.scale,
      title: AppStrings.alerts.tr(),
      desc: AppStrings.saving_Failed.tr(),
      btnOkText: AppStrings.confirm.tr(),
      btnOkOnPress: () {
        Navigator.of(context).pop();
      },
    ).show();
  }

  void displayFaileDialoge(BuildContext context) {
    AwesomeDialog(
      context: context,
      dialogType: DialogType.error,
      animType: AnimType.scale,
      title: AppStrings.alerts.tr(),
      desc: AppStrings.saving_Failed.tr(),
      btnOkText: AppStrings.confirm.tr(),
      btnOkOnPress: () {
        Navigator.of(context).pop();
      },
    ).show();
  }




  String fixDateFormat(String date) {
    DateTime parsedDate = DateFormat('dd-MM-yyyy').parse(date);
    return DateFormat('yyyy-MM-dd').format(parsedDate);
  }
  Map<String, Map<String, TimeOfDay>> selectedHoursPerDay = {};

  Future buildHoursCard() {
    return showDialog(
      context: context,
      builder: (context) => StatefulBuilder(
        builder: (context, setState) {
          DateTime startDate = DateTime.parse(_startDate);
          DateTime endDate = DateTime.parse(_endDate);
          int totalDays = endDate.difference(startDate).inDays +1;

          return AlertDialog(
            contentPadding: EdgeInsets.all(8),
            content: SizedBox(
              height: 400,
              width: double.maxFinite,
              child: Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      itemCount: totalDays,
                      itemBuilder: (context, index) {
                        DateTime currentDate = startDate.add(Duration(days: index));
                        String formattedDate =DateFormat('dd-mm-yyyy').format(currentDate);
                        String formatted_Date=fixDateFormat(currentDate.toString());

                        return Card(
                          child: ListTile(
                            title: Text(formatted_Date),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Text('${AppStrings.from.tr()}: '),
                                    ElevatedButton(
                                      onPressed: () async {
                                        TimeOfDay? fromTime = await showTimePicker(
                                          context: context,
                                          initialTime: const TimeOfDay(hour: 9, minute: 0),
                                        );
                                        if (fromTime != null) {
                                          setState(() {
                                            selectedHoursPerDay[formattedDate] ??= {};
                                            selectedHoursPerDay[formattedDate]!['from'] = fromTime;
                                          });
                                        }
                                      },
                                      child: Text(
                                        selectedHoursPerDay[formattedDate]?['from']?.format(context) ?? AppStrings.selectHours.tr(),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 8),
                                Row(
                                  children: [
                                    Text('${AppStrings.to.tr()}: '),
                                    ElevatedButton(
                                      onPressed: () async {
                                        TimeOfDay? toTime = await showTimePicker(
                                          context: context,
                                          initialTime: const TimeOfDay(hour: 17, minute: 0),
                                        );
                                        if (toTime != null) {
                                          setState(() {
                                            selectedHoursPerDay[formattedDate] ??= {};
                                            selectedHoursPerDay[formattedDate]!['to'] = toTime;
                                          });
                                        }
                                      },
                                      child: Text(
                                        selectedHoursPerDay[formattedDate]?['to']?.format(context) ?? AppStrings.selectHours.tr(),
                                      ),
                                    ),
                                  ],
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
                      bool allValid = true;

                      for (var entry in selectedHoursPerDay.entries) {
                        final from = entry.value['from'];
                        final to = entry.value['to'];

                        if (from == null || to == null || !to.isAfter(from)) {
                          allValid = false;
                          break;
                        }
                      }

                      if (allValid) {
                        print(selectedHoursPerDay);
                        Navigator.pop(context);

                        // في حال أردت تعبئة حقل البداية والنهاية بالنطاق الكامل:
                        _StartDateController.text =
                        '${_startDate} ${selectedHoursPerDay[_startDate]?['from']?.format(context) ?? ''}';
                        _EndDateController.text =
                        '${_endDate} ${selectedHoursPerDay[_endDate]?['to']?.format(context) ?? ''}';
                      } else {
                        displayTimeFaileDialoge(context);
                        _StartDateController.text = " ";
                        _EndDateController.text = " ";
                      }
                    },
                    child: Text(AppStrings.ok.tr()),
                  ),
                ],
              ),
            ),
          );
        },
      ),
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

}
class PermissionType {
  final String? text;
  final String? value;
  final int? valueNumber;
  final int? duration;
  PermissionType ({
    required this.text,
    required this.value,
    required this.valueNumber,
    required this.duration,
  });
  factory PermissionType.fromJson(Map<String, dynamic> json) {
    return PermissionType(
      text: json["Text"],
      value: json["Value"],
      valueNumber: json["value"],
      duration: json["Duration"],
    );
  }
}
//________________save permission________________________
class Result {
  final String message;
  final bool isValid;


  const Result({
    required this.message,
    required this.isValid});

  factory Result.fromJson(Map<String, dynamic> json) {
    return Result(
        message: json['Message'],
        isValid: json['IsValid']

    );
  }


}
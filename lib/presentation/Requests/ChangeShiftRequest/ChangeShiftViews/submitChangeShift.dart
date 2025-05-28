
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
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:essmohr/application/app_prefs.dart';
import 'package:essmohr/application/constants.dart';
import 'package:essmohr/presentation/resources/colors.dart';
import 'package:essmohr/application/di.dart';
import 'package:essmohr/domain/model/navigationManu.dart';
import 'package:essmohr/presentation/resources/strings_manager.dart';
import 'package:permission_handler/permission_handler.dart' ;
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:http/http.dart' as http;

import '../../../widgets/ReviewerAutoComplet.dart';




class ChangeShiftSubmit extends StatefulWidget implements NavigationStates
{
  const ChangeShiftSubmit ({Key? key}) : super(key: key);
  @override
  State<ChangeShiftSubmit> createState() => _ChangeShiftSubmitState();
}




class _ChangeShiftSubmitState extends State<ChangeShiftSubmit>with TickerProviderStateMixin {

  final AppPreferences _appPreferences = instance<AppPreferences>();

  String? dropDownValue;
  int selectedOption = 1;
  var ChangeShiftTypeId;
  DateTime Fromdate = DateTime(2023);
  DateTime Todate = DateTime(2023);
  bool oKPressed = false;
  String selectedTimeType = "please select time type";
  List<ChangeShiftType>? ChangeShiftTypes=[];
  List<ChangeShiftType> items=[];
  late Future<List<ChangeShiftType>> _future;
  int? _selectedChangeShiftType;
  var _currentIndex = 0;
  String daysOrHours="days";

  //String selectedTimeType = "please select time type";
  late String _date;
  String? message;
  String? _timeStr;
  TimeOfDay? _time;
  late int durtionValue;
  final DateRangePickerController _controller = DateRangePickerController();
  late TextEditingController _DateController = TextEditingController();
  final TextEditingController _ValueEditingController = TextEditingController();
  final TextEditingController _NoteEditingController = TextEditingController();
  final TextEditingController _ReviewerEditingController = TextEditingController();
  final TextEditingController _AttachmentEditingController = TextEditingController();
  String? userId;
  EmployeeReviewers? selectedEmployee;
  String? selectedReviewerName;
  String? selectedReviewerCode;
  int? selectedReviewerId;




  @override
  void initState() {
    final DateTime today = DateTime.now();
    _date = DateFormat('dd-MM-yyyy').format(today).toString();

    super.initState();
    initDB();
  }


  void initDB() async
  {
    ChangeShiftTypes = await getChangeShiftType();
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
                            child: Text(AppStrings.ChangeShift_Request.tr(),
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
                                //const SizedBox(height: 10,width: 100,),
                                Row(
                                    //mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment: CrossAxisAlignment.start
                                    , children: [
                                  //Text(AppStrings.ChangeShift_Type.tr()),
                                  StatefulBuilder(
                                      builder: (context, setState) =>
                                          getChangeShiftTypeDDL())
                                ]),
                                const SizedBox(height: 5),
                                Row(
                                    children: [
                                        Text('${AppStrings.date.tr()} : '),
                                        Text(formatDateTime(selectedDateTime), style: const TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold))
                                    ]
                                ),
                                const SizedBox(height: 5),
                                Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SizedBox(height: 40,
                                        width: 150,
                                        child: FloatingActionButton(
                                            child: Text(
                                                AppStrings.select_time_duration
                                                    .tr()),
                                             onPressed: () async {
                                                 await showDialogDate();
                                            }),
                                      )
                                    ]),

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
                                        child: EmployeeTypeAheadField(
                                          date: '2025-5-15',
                                          typeId: 291,
                                          type: 5,
                                          onEmployeeSelected: (reviewer) {
                                            setState(() {
                                              selectedEmployee = reviewer;
                                              selectedReviewerName = reviewer.name;
                                              selectedReviewerCode = reviewer.code;
                                              selectedReviewerId = reviewer.id;
                                            });
                                          },
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
                                        Text(AppStrings.Submit.tr(),
                                          textAlign: TextAlign.center,),
                                        onPressed: () async {

                                            addingChangeShiftRequest();
                                          }
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

  // void selectionChanged(DateRangePickerSelectionChangedArgs args) {
  //   SchedulerBinding.instance.addPostFrameCallback((duration) {
  //     setState(() {
  //       _date =
  //           DateFormat('yyyy-MM-dd').format(args.value.startDate).toString();
  //       DateTime? start = DateTime.tryParse(
  //           DateFormat('yyyy-MM-dd').format(args.value.startDate).toString());
  //
  //
  //
  //       durtionValue = _data;
  //       _ValueEditingController.text = durtionValue
  //           .toString(); //Duration difference = _endDate(_startDate);
  //
  //     });
  //   });
  // }

  DateTime selectedDateTime=DateTime.now();

  Widget getDatePicker() {
    return Card(
      child: SfDateRangePicker(
        view: DateRangePickerView.month,
        controller: _controller,
        selectionMode: DateRangePickerSelectionMode.single,
        onSelectionChanged: selectionChanged,
        allowViewNavigation: false,
      ),
    );
  }

  void selectionChanged(DateRangePickerSelectionChangedArgs args) async {
    if (args.value is DateTime) {
      DateTime selectedDate = args.value;

      // فتح Time Picker لاختيار الساعة
     // TimeOfDay? pickedTime = await showTimePicker(
      //  context: context,
      //  initialTime: TimeOfDay.now(),
     // );

    //  if (pickedTime != null) {setState(() {
        // دمج التاريخ والوقت في كائن DateTime واحد
        selectedDateTime = DateTime(
          selectedDate.year,
          selectedDate.month,
          selectedDate.day,
          //pickedTime.hour,
          //pickedTime.minute,
        );

        print("التاريخ والوقت المختار: $selectedDateTime");
      setState(() {
        _controller.displayDate = selectedDateTime;
        _DateController.text = formatDateTime(selectedDateTime);
      }

//}
    )
    ;


      }
    }
  //}

  String formatDateTime(DateTime dateTime) {
    return "${dateTime.year}-${dateTime.month.toString().padLeft(2, '0')}-${dateTime.day.toString().padLeft(2, '0')} ";
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
                          getDatePicker(),
                          FloatingActionButton(
                            backgroundColor: colorManager.primary,
                            child: Text(AppStrings.ok.tr()),
                            onPressed: () {

                              oKPressed = true;
                              Navigator.of(context, rootNavigator: true).pop(context);

                            },
                          )
                        ],

                      )
                  )
              ));
  }

  final picker = ImagePicker();

  Widget getChangeShiftTypeDDL() {
    return FutureBuilder(
        future: getChangeShiftType(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          }
          if (snapshot.data == null) {
            return const CircularProgressIndicator();
          }
          return
            // Expanded( // Forces the child to take available space
            //   child: Padding(
            //       padding: const EdgeInsets.all(0.0),
            //       child: Column(
            //         mainAxisAlignment: MainAxisAlignment.start,
            //         children: [
            Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(AppStrings.ChangeShift_Type.tr()),
                            SizedBox(width: 20,),
                            DropdownButton(
                              //hint: const Text('-- select value --'),
                              onChanged: (ChangeShiftType) {
                                final selectedItem = snapshot.data!
                                .firstWhere((item) => item.id == ChangeShiftType);
                                  setState(() {
                                  _selectedChangeShiftType = ChangeShiftType;
                                  _ValueEditingController.text=selectedItem.name.toString();
                                  });},
                              value: _selectedChangeShiftType,
                              items: [
                                ...snapshot.data!.map(
                                      (item) =>
                                      DropdownMenuItem(
                                        value: item.id,
                                        child: Text(item.name.toString()),
                                      ),
                                )
          ],
                         //   ),



                   // ],
                //  )
            //  ));
                            )]);  }
        );
  }
  //
  Future<List<ChangeShiftType>>getChangeShiftType() async {
    try {
      List<String> b = ["please select"];
      userId = await _appPreferences.getUserToken();
      var response = await http.get(
          Uri.parse(Constants.getShiftTypes), headers: <String, String>
      {'Content-Type': 'application/json; charset=UTF-8', 'userId': userId!});

      if (response.statusCode == 200) {
        List<dynamic> data = jsonDecode(response.body);
          return data.map((json) => ChangeShiftType.fromJson(json)).toList();
      }
      else
      {
        throw Exception('Failed to load ChangeShift types');
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
      throw Exception('Failed to load ChangeShift types');
    }
  }


  Future addingChangeShiftRequest() async
  {
    userId = await _appPreferences.getUserToken();
    var uri = Uri.parse(Constants.saveChangeShift);


    var response = await http.post(
        uri,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8', 'userId': userId!},
        body: jsonEncode(<String, dynamic>{
          // {
          //   "RequestDate": "2025-05-20T11:02:42.443",
          //   "Date": "2025-05-15T10:40:57.26",
          //   "Value": 4753.0,
          //   "Notes": "hhhjjjkk",
          //   "Editable": false,
          //   "Attachments": "",
          //   "Status": "Pending",
          //   "Reviewers": [
          //     {
          //       "Name": "ahmed hussien",
          //       "Status": "Pending",
          //       "Note": ""
          //     }
          //   ],
          //   "PlanName": "Morning 9 to 17 Plan"
          // }
          "requestType": 8,
          "RequestDate": DateTime.now().toIso8601String(),
          "date": _DateController.text,
          "ChangeShiftTypeId": _selectedChangeShiftType,
          "notes": _NoteEditingController.text,
          "Editable": false,
          "Attachments":"",
          "Status": "Pending",
            "Reviewers": [
              {
               "Id": selectedReviewerId,
               "Code":selectedReviewerCode.toString() ,
                "Name": selectedReviewerName.toString(),
                "Status": "Pending",
                "Note": ""
              }
            ],
          "PlanName":_ValueEditingController.text

        }));
    if (response.statusCode == 200) {
      var x = Result.fromJson(jsonDecode(response.body));
      bool y = x.isValid;
      if (y == true) {
        displayDialoge(context);

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
      title: AppStrings.Alerts.tr(),
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
      title: AppStrings.Alerts.tr(),
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
      title: AppStrings.Alerts.tr(),
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

          return SizedBox(
            height: 400,
            child: Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    
                    itemBuilder: (context, index) {
                      DateTime day = DateTime.parse(fixDateFormat(_date)).add(Duration(days: index));
                      String dayStr =day.toString();
                      //DateFormat('dd-mm-yyyy').format(day);

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
                                    initialTime: const TimeOfDay(hour: 9, minute: 0),
                                  );
                                  if (fromTime != null) {
                                    setState(() {
                                      selectedHoursPerDay[dayStr] ??= {};
                                      selectedHoursPerDay[dayStr]!['from'] = fromTime;

                                      final hour = fromTime.hour.toString().padLeft(2, '0');
                                      final minute = fromTime.minute.toString().padLeft(2, '0');
                                      String formattedTime = "$hour:$minute";
                                      _time=fromTime;
                                      _timeStr=formattedTime;


                                    });
                                  }
                                }, child: null,
                          
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

}



//________________save ChangeShift________________________
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






import 'dart:convert';
import 'dart:core';
import 'dart:io';
import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:essmohr/domain/model/model.dart';
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
                                            displayDialog(context);
                                          }
                                          else {
                                            addingMissionRequest();
                                          }


                                        }

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
                              oKPressed = true;



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
                        String formattedDate =DateFormat('yyyy-mm-dd').format(currentDate);
                        String formatted_Date=fixDateFormat(currentDate.toString());
                        return Card(
                          child: ListTile(
                            title: Text('$formatted_Date'),
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

  void displayDialog(BuildContext context) {
    AwesomeDialog(
      context: context,
      dialogType: DialogType.info,
      animType: AnimType.scale,
      title: AppStrings.Information.tr(),
      desc: AppStrings.ok.tr(),
      btnOkText: AppStrings.confirm.tr(),
      btnOkOnPress: () {
        Navigator.of(context).pop();
      },
    ).show();
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
        displayDialoge(context);
        setState(() {
       //   message=x.message;
        });
      } else {
        displayFaileDialoge(context);
      }
    }
    else {
      displayFaileDialoge(context);
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



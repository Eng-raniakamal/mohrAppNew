
import 'dart:convert';
import 'dart:core';

import 'dart:io';

import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:essmohr/domain/model/model.dart';
import 'package:essmohr/presentation/widgets/appbarstart.dart';
import 'package:essmohr/presentation/widgets/autoCompleteTextField.dart';
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
import 'package:essmohr/presentation/Requests/Vacations/viewModel/VacationType_ViewModel.dart';
import 'package:essmohr/presentation/resources/strings_manager.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:http/http.dart' as http;

class VacationRequestView extends StatefulWidget implements NavigationStates
{
  const VacationRequestView ({Key? key}) : super(key: key);
  @override
  State<VacationRequestView > createState() => _VacationRequestViewState();
}

class _VacationRequestViewState extends State<VacationRequestView>with TickerProviderStateMixin {

  final AppPreferences _appPreferences = instance<AppPreferences>();
  final VacationTypeViewModel _VacationTypeviewModel = instance<
      VacationTypeViewModel>();
  final _Formkey = GlobalKey<FormState>();
  String? dropDownValue;
  int selectedOption = 1;
  var vacationTypeId;
  DateTime Fromdate = DateTime(2023);
  DateTime Todate = DateTime(2023);
  bool oKPressed = false;
  List<String>? vacationType;
  late Future<List<VacationType>> _future;
  String? _selectedVacationType;
  var _currentIndex = 0;
  String? selectedVacationType;
  String selectedTimeType = "please select time type";
  late String _startDate, _endDate;
  late int durtionValue;
  final DateRangePickerController _controller = DateRangePickerController();
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

    // vacationType =  await getVacationType();
    super.initState();
    initDB();
  }

  void initDB() async
  {
    vacationType = await getVacationType();
  }

  @override
  Widget build(BuildContext context) {
    return
      ThemeSwitchingArea(
        child: Builder(
          builder: (context) =>
              Scaffold(
                appBar: buildAppBarstart(context),
                // backgroundColor: colorManager.white,
                body:
                SingleChildScrollView(
                  child: Column(
                      children: [
                        Align(
                            alignment: Alignment.center,
                            child: Text(AppStrings.Vacation_Request.tr(),
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
                                const SizedBox(height: 10),

                                StatefulBuilder(
                                    builder: (context, setState) =>
                                        getVacationTypeDDL())

                                , const SizedBox(height: 5),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center
                                  , children: [
                                  Text(AppStrings.days_hours.tr()),
                                  const SizedBox(width: 15,),
                                  getDropDownDurationItems(),
                                ],),
                                const SizedBox(height: 10),
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
                                              //oKPressed=false;
                                              await showDialogDate();
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
                                        child: AutoCompleteTextField(
                                          date: "2024-10-30",
                                          typeId: 0,
                                          type: 1,)
                                      // TextFormField(
                                      //   controller: _ReplacementEditingController,
                                      //   keyboardType: TextInputType.text,
                                      //   decoration: InputDecoration(
                                      //       focusedBorder: OutlineInputBorder(
                                      //         borderSide: BorderSide(
                                      //             color: colorManager
                                      //                 .greywithOpacity,
                                      //             width: 1.0),
                                      //       ),
                                      //       enabledBorder: OutlineInputBorder(
                                      //         borderSide: BorderSide(
                                      //             color: colorManager
                                      //                 .greywithOpacity,
                                      //             width: 1.0),
                                      //       ),
                                      //       label: Text(
                                      //           AppStrings.Replacement.tr())),
                                      // ),
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
                                    Container(width: 250,
                                        //reviwer
                                        child: AutoCompleteTextField(
                                          date: "2024-10-30",
                                          typeId: 0,
                                          type: 1,)
                                      // child: TextFormField(
                                      //   controller: _ReviewerEditingController,
                                      //   keyboardType: TextInputType.text,
                                      //   decoration: InputDecoration(
                                      //       focusedBorder: OutlineInputBorder(
                                      //         borderSide: BorderSide(
                                      //             color: colorManager
                                      //                 .greywithOpacity,
                                      //             width: 1.0),
                                      //       ),
                                      //       enabledBorder: OutlineInputBorder(
                                      //         borderSide: BorderSide(
                                      //             color: colorManager
                                      //                 .greywithOpacity,
                                      //             width: 1.0),
                                      //       ),
                                      //
                                      //       label: Text(
                                      //           AppStrings.Reviewers.tr())),
                                      //
                                      // ),
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
                                        onPressed: () async {
                                          bool? x = await getValidateVacation(
                                              '2023-08-27', "2023-08-28", 572,
                                              0, 2);
                                          if (x == false) {
                                            displayDialog();
                                          }
                                          else {
                                            addingVacationRequest();
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
    return (to.difference(from).inHours / 24).round();
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

  DropdownButton getDropDownDurationItems() {
    List<String> list = <String>[AppStrings.days.tr().toString()+"/"+AppStrings.day.tr().toString(),
                        '1/2'+AppStrings.day.tr().toString(), '1/4'+ AppStrings.day.tr().toString()];
    return DropdownButton<String>(
      value: dropDownValue,
      //icon: const Icon(Icons.arrow_downward),
      //elevation: 16,
      //style: const TextStyle(color: Colors.deepPurple),
      underline: Container(
        // height: 2,
        // color: Colors.deepPurpleAccent,
      ),
      onChanged: (String? value) {
        // This is called when the user selects an item.
        setState(() {
          dropDownValue = value!;
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

  Widget getVacationTypeDDL() {
    return FutureBuilder(
        future: getVacationType(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          }
          if (snapshot.data == null) {
            return const CircularProgressIndicator();
          }
          return Padding(
              padding: const EdgeInsets.all(5.0),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(AppStrings.Vacation_Type.tr()),
                        SizedBox(
                            width: 15),

                        DropdownButton(
                          //hint: const Text('-- select value --'),
                          onChanged: (vacationType) =>
                              setState(() =>
                              selectedVacationType = vacationType!),
                          value: selectedVacationType,
                          items: [
                            ...snapshot.data!.map(
                                  (item) =>
                                  DropdownMenuItem(
                                    value: item,
                                    child: Text(item),
                                  ),
                            )
                          ],
                        ),
                        // ),

                        // Expanded(
                        //    child: ListView.separated(
                        //      itemBuilder: (context, index) => ElevatedButton(
                        //        onPressed: () => setState(
                        //                () => _selectedVacationType = snapshot.data![index]),
                        //        style: identical(
                        //            _selectedVacationType, snapshot.data![index])
                        //            ? ButtonStyle(
                        //          backgroundColor: MaterialStateProperty.all(
                        //              Colors.blue[400]),
                        //          overlayColor: MaterialStateProperty.all(
                        //              Colors.black12),
                        //        )
                        //            : ButtonStyle(
                        //          backgroundColor:
                        //          MaterialStateProperty.all(Colors.white),
                        //          overlayColor: MaterialStateProperty.all(
                        //              Colors.black12),
                        //        ),
                        //        child: Padding(
                        //          padding: const EdgeInsets.all(4.0),
                        //              child: Text(
                        //                '${snapshot.data![index]}',
                        //                style: const TextStyle(color: Colors.black),
                        //              ),
                        //        ),
                        //      ),
                        //      separatorBuilder: (context, _) =>
                        //      const SizedBox(height: 12),
                        //      itemCount: snapshot.data!.length,
                        //    ),
                        //  ),
                      ],
                    ),
                  ]));
        });
  }

  Widget? displayDialog() {
    showAnimatedDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return ClassicGeneralDialogWidget(
          titleText: AppStrings.Information.tr(),
          contentText: AppStrings.Invalid_Vacation.tr(),
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

  Future<List<String>?> getVacationType() async {
    // List<VacationType> a;
    List<String> b = ["please select"];
    userId = await _appPreferences.getUserToken();
    var response = await http.get(
        Uri.parse(Constants.vacationTypeUrl), headers: <String, String>
    {'Content-Type': 'application/json; charset=UTF-8', 'userId': userId!});
    var responseData;
    // setState(() {
    String jsonsDataString = response.body.toString();
    responseData = json.decode(jsonsDataString);
    // });


    if (responseData != null) {
      final a = (responseData as Iterable).map((data) {
        return VacationType.fromJson(data as Map<String, dynamic>);
      }).toList();


      for (var item in a) {
        b.add(item.name.toString());
      }
    }


    //List<String> b = List<VacationType>.from(a['name'].toList());

    //setState(() {
    vacationType = b;
    //});
    return vacationType;
  }

  Future<bool?> getValidateVacation(String startDate, String endDate,
      int vacationTypeId, int id, int duration) async {
    List<ValidationVacationModel> validationVacation = [];
    bool? flag = false;
    userId = await _appPreferences.getUserToken();
    final response = await http.get(
      //{{baseUrl}}/api/Vacation/VaildateVacation?vacationTypeId=572&fromDate=2023-08-27&toDate=2023-08-28&id=0&duration=2
        Uri.parse('${Constants
            .validateVacation}$vacationTypeId&fromDate=$startDate&toDate=$endDate&id=$id&duration=$duration'),
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

    //   validationVacation.clear();
    //   for (var i in responseData.values) {
    //     validationVacation.add(ValidationVacationModel.fromJson(i));
    //   }
    //   return validationVacation[0].isValid ;
    // } else {
    return flag;
    // }

  }


  Future addingVacationRequest() async
  {
    userId = await _appPreferences.getUserToken();

    // String? major=_MajorEditingController.text;
    // String? university=_UniversityEditingController.text;
    // String? notes=_NotesEditingController.text;
    // string to uri
    var uri = Uri.parse(Constants.saveVacation);

    // create multipart request
    // var request = http.Request("POST", uri);

    var response = await http.post(
        uri,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8', 'userId': userId!},
        body: jsonEncode(<String, dynamic>{
          "vacationTypeId": 626,
          "fromDate": _startDate,
          "toDate": _endDate,
          "duration": _DurationEditingController.text,
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
         // addingSuccess = true;
        });
      } else {
        displayFaileDialoge();
      }
    }
    else {
      displayFaileDialoge();
    }
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
  }


class VacationType {
  final int? id;
  final String? name;
  final int? type;
  final int? balance;
  final int? limit;
  final bool? requiredAttachment;
  VacationType ({
    required this.id,
    required this.name,
    required this.type,
    required this.balance,
    required this.limit,
    required this.requiredAttachment,
  });
  factory VacationType.fromJson(Map<String, dynamic> json) {
    return VacationType(
        id: json["Id"],
        name: json["Name"],
        type: json["Type"],
        balance: json["Balance"],
        limit: json["Limit"],
        requiredAttachment:json["RequiredAttachment"]
    );
  }
}



//________________save vacation________________________
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

  // class SaveVacation{
  //
  // final int vacationTypeId;
  // final String fromDate;
  // final String toDate;
  // final int duration;
  // final String notes;
  //
  // final String  major;
  // final String university;
  // SaveVacation({
  // required this.vacationTypeId,
  // required this.fromDate,
  // required this.toDate,
  // required this.duration,
  // required this.notes,
  // required this.major,
  // required this.university
  // });
  //
  // factory SaveVacation.fromJson(Map<String, dynamic> json) {
  // return SaveVacation(
  //     vacationTypeId: json["vacationTypeId"],
  //     fromDate: json["fromDate"],
  //     toDate: json["toDate"],
  //     duration: json["duration"],
  //     notes: json["notes"],
  //
  // major: json["Major"],
  // university: json["University"]
  // );
  // }
  // }

// "vacationTypeId": 626,
// "fromDate": "2024-03-21",
// "toDate": "2024-03-22",
// "duration":2,
// "notes": "asddfasdfdsaf df sadf dasf sdaf dsafd saf dasf af sdf ",
// "request": {
// "reviewers" : [
// {"employeeId": 121, "code": "", "name": ""},
// {"employeeId": 122, "code": "", "name": ""}


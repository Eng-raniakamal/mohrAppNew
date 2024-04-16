
import 'dart:convert';
import 'dart:io';
import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mohr_hr/application/app_prefs.dart';
import 'package:mohr_hr/application/constants.dart';
import 'package:mohr_hr/presentation/resources/colors.dart';
import 'package:mohr_hr/application/di.dart';
import 'package:mohr_hr/domain/model/model.dart';
import 'package:mohr_hr/domain/model/navigationManu.dart';
import 'package:mohr_hr/presentation/Requests/Vacations/viewModel/VacationType_ViewModel.dart';
import 'package:mohr_hr/presentation/resources/strings_manager.dart';
import 'package:mohr_hr/presentation/widgets/appbarMain.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:mohr_hr/presentation/widgets/profile_widget.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:http/http.dart' as http;

class VacationRequestView extends StatefulWidget with NavigationStates
{
  const VacationRequestView ({Key? key}) : super(key: key);
  @override
  State<VacationRequestView > createState() => _VacationRequestViewState();
}

class _VacationRequestViewState extends State<VacationRequestView>with TickerProviderStateMixin {

  final AppPreferences _appPreferences = instance<AppPreferences>();
  final VacationTypeViewModel _VacationTypeviewModel = instance<VacationTypeViewModel>();

  final _Formkey= GlobalKey<FormState>();

   var vacationTypeId;
  DateTime Fromdate = DateTime(2023);
  DateTime Todate = DateTime(2023);
  bool oKPressed=false;
  List<VacationType>? vacationType;

  late String _startDate, _endDate;
  final DateRangePickerController _controller = DateRangePickerController();
  final TextEditingController _DurationEditingController = TextEditingController();
  final TextEditingController _ReplacementEditingController = TextEditingController();
  final TextEditingController _NoteEditingController = TextEditingController();
  final TextEditingController _ReviewerEditingController = TextEditingController();
  final TextEditingController _AttachmentEditingController = TextEditingController();

  String? userId;
  @override
  void initState()
  { final DateTime today = DateTime.now();
    _startDate = DateFormat('dd-MM-yyyy').format(today.subtract(Duration(days: 1))).toString();
    _endDate = DateFormat('dd-MM-yyyy').format(today).toString();
  super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return
      ThemeSwitchingArea(
          child: Builder(
            builder: (context) =>
                Scaffold(
                  appBar: buildAppBarMain(context),
                 // backgroundColor: colorManager.white,
                  body:
                  SingleChildScrollView(
                    child: Column(
                          children: [
                            Align(
                                alignment:Alignment.center,
                                child: Text(AppStrings.Vacation_Request.tr(),
                                  style: TextStyle(fontWeight: FontWeight.bold,
                                      fontSize: 22,color: colorManager.lightprimary),)),
                              Form(
                              child: Container(
                                      padding: const EdgeInsets.only(
                                          top: 12,
                                          left: 28,
                                          right: 28),
                                      child: Column(children:[
                                        SizedBox(height:10),
                                        Row(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                              
                                            Text(AppStrings.Vacation_Type.tr()),
                                             SizedBox(width: 25,),
                                              StreamBuilder<VacationTypeObject>(
                                                stream: _VacationTypeviewModel.outputVacationType,
                                                builder: (context, snapshot) {
                                                  List<VacationTypeItem>? vacationType = snapshot.data?.vacationType.items;
                                                  return _getVacationType(vacationType);
                                               },
                                                                                       ),

                                      ]),
                                        SizedBox(height:10),
                                        Row(children: [
                                            Text(AppStrings.days_hours.tr()),
                                            SizedBox(width: 15,),
                                            getDropDownDurationItems(),
                                        ],),
                                        SizedBox(height:10),
                                        Row(
                                            children: [
                                              Text(AppStrings.from.tr() +' : '),
                                              Text(_startDate,style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                                              SizedBox(width: 40,),
                                              Text(AppStrings.to.tr() +' : '),
                                              Text(_endDate,style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold))
                                                      ]
                                            ),
                                        Row(
                                            //crossAxisAlignment: CrossAxisAlignment.center,
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children:[
                                            SizedBox(height: 40,
                                              width: 150,
                                              child: FloatingActionButton(
                                                  child:  Text(AppStrings.select_time_duration.tr()),
                                                  onPressed: () async {
                                                    //oKPressed=false;
                                                    await showDialogDate();

                                                    setState(() {

                                                    });
                                                  }),
                                            ) ]),
                                        SizedBox(height:10),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          children: [
                                            Container(width:250,
                                              child: TextFormField(
                                                controller: _DurationEditingController,
                                                keyboardType: TextInputType.number,
                                                decoration:  InputDecoration(
                                                    focusedBorder: OutlineInputBorder(
                                                      borderSide: BorderSide(color: colorManager.greywithOpacity, width: 1.0),
                                                    ),
                                                    enabledBorder: OutlineInputBorder(
                                                      borderSide: BorderSide(color: colorManager.greywithOpacity, width: 1.0),
                                                    ),
                                                    hintText:"1",
                                                    label:   Text("المدة")),

                                              ),
                                            ),


                                          ],),
                                        SizedBox(height:10),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          children: [
                                            Container(width:250,
                                              child: TextFormField(
                                                controller: _ReplacementEditingController,
                                                keyboardType: TextInputType.text,
                                                 decoration:  InputDecoration(
                                                     focusedBorder: OutlineInputBorder(
                                                   borderSide: BorderSide(color: colorManager.greywithOpacity, width: 1.0),
                                                 ),
                                                     enabledBorder: OutlineInputBorder(
                                                       borderSide: BorderSide(color: colorManager.greywithOpacity, width: 1.0),
                                                     ),

                                                    label:   Text("النائب")),

                                               ),
                                            ),

                                        ],),
                                        SizedBox(height:10),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          children: [
                                            Container(width:250,
                                              child: TextFormField(
                                                controller: _NoteEditingController,
                                                keyboardType: TextInputType.text,
                                                decoration:  InputDecoration(
                                                    focusedBorder: OutlineInputBorder(
                                                      borderSide: BorderSide(color: colorManager.greywithOpacity, width: 1.0),
                                                    ),
                                                    enabledBorder: OutlineInputBorder(
                                                      borderSide: BorderSide(color: colorManager.greywithOpacity, width: 1.0),
                                                    ),

                                                    label: Text("الوصف")),

                                              ),
                                            ),

                                          ],),
                                        SizedBox(height:10),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          children: [
                                            Container(width:250,
                                              child: TextFormField(
                                                controller: _ReviewerEditingController,
                                                keyboardType: TextInputType.text,
                                                decoration:  InputDecoration(
                                                    focusedBorder: OutlineInputBorder(
                                                      borderSide: BorderSide(color: colorManager.greywithOpacity, width: 1.0),
                                                    ),
                                                    enabledBorder: OutlineInputBorder(
                                                      borderSide: BorderSide(color: colorManager.greywithOpacity, width: 1.0),
                                                    ),

                                                    label:   Text("المراجعين")),

                                              ),
                                            ),

                                          ],),
                                        SizedBox(height:10),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          children: [
                                            Container(width:240,
                                              child: TextFormField(
                                                controller: _AttachmentEditingController,
                                                keyboardType: TextInputType.url,
                                                decoration:  InputDecoration(
                                                      focusedBorder: OutlineInputBorder(
                                                      borderSide: BorderSide(color: colorManager.greywithOpacity, width: 1.0),
                                                    ),
                                                      enabledBorder: OutlineInputBorder(
                                                      borderSide: BorderSide(color: colorManager.greywithOpacity, width: 1.0),
                                                    ),
                                                    label:const Text("الوثائق")),

                                              ),
                                            ),
                                            SizedBox(width: 5,),
                                            FloatingActionButton(child:
                                            Text("+"),onPressed: (){})
                                          ],),
                                        SizedBox(height:10),
                                        Row(

                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            FloatingActionButton(child:
                                            Text(AppStrings.submit.tr()),onPressed: (){})
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
  final picker = ImagePicker();

  DropdownButton getDropDownDurationItems()
    {
      return DropdownButton<String>(
        items: <String>['please select the duration','day/days', '1/2 day', '1/4 day'].map((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
        onChanged: (value) {
          setState(() {
          value = value;
          if(value=="day/days")
          {
           // startDateTime=DateTime.now();

          }
        });},
      );}

  _getVacationType(List<VacationTypeItem>? vacationTypes)
  {
  //var  dropdownvalue;
      var items=vacationTypes?.map(
              (item) {
            return DropdownMenuItem(
              value: item.id,
              child: Text(item.name.toString()),);
          }).toList();
      return DropdownButton(
        items:  items,
        onChanged: (newvalue) {
          setState(() {
            vacationTypeId = newvalue;
          });
        },
        value:  vacationTypeId,
      );
    }

  void showImagePicker(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (builder){
          return Card(
            child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height/5.2,
                margin: const EdgeInsets.only(top: 8.0),
                padding: const EdgeInsets.all(12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                        child: InkWell(
                          child: Column(
                            children:  [
                              Icon(Icons.image, size: 60.0,color:Colors.blue),
                              SizedBox(height: 12.0),
                              Text(
                                AppStrings.Gallary.tr(),
                                textAlign: TextAlign.center,
                                style: TextStyle(fontSize: 16, color: Colors.black),
                              )
                            ],
                          ),
                          onTap: () {
                            _imgFromGallery();
                            Navigator.pop(context);
                          },
                        )),
                    Expanded(
                        child: InkWell(
                          child: SizedBox(
                            child: Column(
                              children: [
                                Icon(Icons.camera_alt, size: 60.0,color:Colors.blue,),
                                SizedBox(height: 12.0),
                                Text(
                                  AppStrings.Camera.tr(),
                                  textAlign: TextAlign.center,
                                  style: TextStyle(fontSize: 16, color: Colors.black),
                                )
                              ],
                            ),
                          ),
                          onTap: () {

                            _imgFromCamera();
                            Navigator.pop(context);
                          },
                        ))
                  ],
                )),
          );
        }
    );
  }
  _imgFromGallery() async {
    await  picker.pickImage(
        source: ImageSource.gallery, imageQuality: 50
    ).then((value){
      if(value != null){
        _cropImage(File(value.path));

      }
    });
  }
  _imgFromCamera() async {
    await picker.pickImage(
        source: ImageSource.camera, imageQuality: 50
    ).then((value){
      if(value != null){
        _cropImage(File(value.path));
      }
    });
  }
  _cropImage(File imgFile) async {
    final croppedFile = await ImageCropper().cropImage(
        sourcePath: imgFile.path,
        aspectRatioPresets: Platform.isAndroid
            ? [
          CropAspectRatioPreset.square,
          CropAspectRatioPreset.ratio3x2,
          CropAspectRatioPreset.original,
          CropAspectRatioPreset.ratio4x3,
          CropAspectRatioPreset.ratio16x9
        ] : [
          CropAspectRatioPreset.original,
          CropAspectRatioPreset.square,
          CropAspectRatioPreset.ratio3x2,
          CropAspectRatioPreset.ratio4x3,
          CropAspectRatioPreset.ratio5x3,
          CropAspectRatioPreset.ratio5x4,
          CropAspectRatioPreset.ratio7x5,
          CropAspectRatioPreset.ratio16x9
        ],
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
      });
      // reload();
    }
  }
  void selectImage(BuildContext context)
  async {
    Map<Permission, PermissionStatus> statuses = await [
      Permission.storage, Permission.camera].request();
    if (statuses[Permission.storage]!.isGranted &&
        statuses[Permission.camera]!.isGranted) {
      showImagePicker(context);
    }
  }
  Widget? displayDialog()
  {

    showAnimatedDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return ClassicGeneralDialogWidget(
          titleText: AppStrings.Information.tr(),
          contentText: AppStrings.permission_message.tr(),
          onPositiveClick: () {
            Navigator.of(context).pop();
          },

        );
      },
      animationType: DialogTransitionType.fadeRotate,
      curve: Curves.linear,
      duration: Duration(seconds: 1),
    );
  }
  Future <List<VacationType>?> getVacationType() async {
    List<VacationType>? a;
    userId = await _appPreferences.getUserToken();
    var response = await http.get(
        Uri.parse(Constants.vacationTypeUrl), headers: <String, String>{'Content-Type': 'application/json; charset=UTF-8','userId':userId!});
    var responseData = json.decode(response.body);
    //.cast<Map<String, dynamic>>();
    if(responseData['VacationType']!=null) {
      var useVacationType = responseData['VacationType'] as List;
      a = await useVacationType.map((jsonData) =>
          VacationType.fromJson(jsonData)).toList();
      List<VacationType>? b = List<VacationType>.from(a);
      vacationType = b;
      return vacationType;
    } return null;
  }
}

class VacationType {
  final int id;
  final String name;
  final int type;
  final int balance;
  final int limit;
  final bool requiredAttachment;

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
        name: json["name"],
        type: json["type"],
        balance: json["balance"],
        limit: json["limit"],
        requiredAttachment:json["requiredAttachment"]
    );
  }
}

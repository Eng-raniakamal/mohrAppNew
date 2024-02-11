
import 'dart:io';

import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

import 'package:mohr_hr/application/constants.dart';
import 'package:mohr_hr/application/di.dart';
import 'package:mohr_hr/domain/model/model.dart';
import 'package:mohr_hr/domain/model/navigationManu.dart';

import 'package:mohr_hr/presentation/Requests/Vacations/viewModel/VacationType_ViewModel.dart';

import 'package:mohr_hr/presentation/resources/strings_manager.dart';
import 'package:permission_handler/permission_handler.dart';

import 'package:mohr_hr/presentation/widgets/profile_widget.dart';


class VacationRequestView extends StatefulWidget with NavigationStates
{
  const VacationRequestView ({Key? key}) : super(key: key);
  @override
  State<VacationRequestView > createState() => _VacationRequestViewState();
}

class _VacationRequestViewState extends State<VacationRequestView>with TickerProviderStateMixin {

 // final AppPreferences _appPreferences = instance<AppPreferences>();
  final VacationTypeViewModel _VacationTypeviewModel = instance<VacationTypeViewModel>();

  final _Formkey= GlobalKey<FormState>();
   DateTime? startDateTime;
   DateTime? endDateTime;
   var vacationTypeId;

  @override
  Widget build(BuildContext context) {

    return
      ThemeSwitchingArea(
          child: Builder(
            builder: (context) =>
                Scaffold(
                  //appBar: buildAppBarMain(context),
                  //backgroundColor: colorManager.white,
                  body:
                  Column(
                        children: [
                          Flexible(
                            flex: 1,
                            child:
                            Container(
                                padding: EdgeInsets.only(top:20),
                                width: MediaQuery.of(context).size.width,
                                child: Form(
                                    key: _Formkey,
                                    child: Container(
                                      // height: MediaQuery.of(context).size.height,
                                      child: Column(
                                          children: [
                                            SizedBox(height: 40,),
                                            ProfileWidget(
                                              imagePath: Constants.imagePath,
                                              isEdit:true,
                                              onClicked: () {
                                                bool? canEditImage=Constants.canUpload;
                                                if(canEditImage== false)
                                                {
                                                  displayDialoge();
                                                }
                                                setState(() {
                                                  showImagePicker(context);
                                                });

                                              },
                                            ),
                                            //const SizedBox(height: 20),

                                          ]
                                      ),
                                    )
                                )
                            ),
                          ),
                          Flexible(
                            flex: 2,
                              child: Container(
                                  alignment: AlignmentDirectional.topStart,
                                  padding: const EdgeInsets.only(
                                      top: 12,
                                      left: 28,
                                      right: 28),
                                  child: Column(children:[
                                     Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text("Vacation Type", textAlign: TextAlign.start,),
                                        StreamBuilder<VacationTypeObject>(
                                          stream: _VacationTypeviewModel.outputVacationType,
                                          builder: (context, snapshot) {
                                            List<VacationTypeItem>? vacationType = snapshot.data?.vacationType.items;
                                            return _getVacationType(vacationType);
                                          },
                                        ),
                                        Text("Days/Hours", textAlign: TextAlign.start,),
                                        getDropDownDurationItems(),
                                        Row(children: [
                                          Text("From"),
                                        ],)


                                      ])]),)
                            ),


                         // ),
                        ]),
                  ),
                ),
          );
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
            startDateTime=DateTime.now();

          }
        });},
      );}

  _getVacationType(List<VacationTypeItem>? vacationTypes)
  // {
  //   var dropdownvalue;
  //   return DropdownButton(
  //     hint: Text("Choose a Vacation Type"),
  //     items: items?.map(
  //             (Item) {
  //           dropdownvalue=Item.id.toString();
  //           return DropdownMenuItem(
  //             value: dropdownvalue,
  //             child: Text(Item.name.toString()),);
  //         }).toList(),
  //     onChanged: (newvalue) {
  //       setState(() {
  //         dropdownvalue = newvalue;
  //       });
  //     },
  //     value: dropdownvalue,
  //   );
  // }{{
  {
  //var  dropdownvalue;
      var items=vacationTypes?.map(
              (gradeItem) {
            return DropdownMenuItem(
              value: gradeItem.id,
              child: Text(gradeItem.name.toString()),);
          }).toList();

      return DropdownButton(
        //hint: Text("Choose grade"),
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
  Widget? displayDialoge()
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

}

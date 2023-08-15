
import 'dart:io';

import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mohr_hr/application/di.dart';
import 'package:mohr_hr/presentation/editEmployee/View/empAcademicDegree_view.dart';
import 'package:mohr_hr/presentation/editEmployee/ViewModel/empSkills_viewModel.dart';
import 'package:mohr_hr/presentation/resources/colors.dart';
import 'package:permission_handler/permission_handler.dart';
import '../../../application/app_prefs.dart';
import '../../../application/constants.dart';
import '../../../domain/model/navigationManu.dart';
import '../../common/state_renderer/state_render_impl.dart';
import '../../resources/strings_manager.dart';
import '../../widgets/appbarMain.dart';
import '../../widgets/appbar_widget.dart';
import '../../widgets/profile_widget.dart';
import 'empBasicData_view.dart';
import 'empSkills_view.dart';


class EmployeeEditView extends StatefulWidget with NavigationStates
{
  const EmployeeEditView({Key? key}) : super(key: key);
  @override
  State<EmployeeEditView> createState() => _EmployeeEditViewState();
}

class _EmployeeEditViewState extends State<EmployeeEditView>with TickerProviderStateMixin {

  final AppPreferences _appPreferences = instance<AppPreferences>();
  final _Formkey= GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final TabController _tabController= TabController(length: (3),vsync:this);
    return
      ThemeSwitchingArea(
          child: Builder(
              builder: (context) =>
                  Scaffold(
                    appBar: buildAppBarMain(context),
                    backgroundColor: colorManager.white,
                    body:
                    Column(
                        children: [
                      Flexible(
                           flex: 1,
                           child:
                          Container(
                                      padding: EdgeInsets.only(top:20),
                                     width: MediaQuery.of(context).size.width,
                                       //height: MediaQuery.of(context).size.height,
                                       child: Form(
                                          key: _Formkey,
                                         child: Container(
                                          // height: MediaQuery.of(context).size.height,
                                           child: Column(
                                              children: [
                                                ProfileWidget(
                                                    imagePath: Constants.imagePath,
                                                    isEdit: true,
                                                    onClicked: () {
                                                      // bool canEditImage=Constants.canUpload;
                                                      // if(canEditImage== false)
                                                      // {
                                                      //   displayDialoge();
                                                      // }
                                                      setState(() {
                                                        showImagePicker(context);
                                                      });

                                                      },
                                               ),
                                                //const SizedBox(height: 20),
                                                Container(//child:Align(
                                                  alignment: Alignment.center,
                                                  padding: EdgeInsets.all(10),
                                                  width: MediaQuery.of(context).size.width,
                                                  decoration: BoxDecoration(
                                                    color: Colors.grey[300],
                                                      borderRadius: BorderRadius.circular(30.0,)),

                                                    child: TabBar(
                                                      controller: _tabController,
                                                      isScrollable: true,
                                                      labelColor: colorManager.primary,
                                                      unselectedLabelColor:  colorManager.white,
                                                      indicator: BoxDecoration(
                                                        borderRadius: BorderRadius.circular(30.0),
                                                        color: colorManager.greywithOpacity,
                                                      ),
                                                      tabs:[Tab(text:AppStrings.BasicData.tr()),
                                                        Tab(text:AppStrings.Skills.tr()),
                                                        Tab(text: AppStrings.AcadmicDegree.tr(),)],
                                                    ),
                                                  ),

                                       ]
                                           ),
                                         )
                                       )
                                     ),
                          ),

                      Flexible(
                        flex: 2,
                        child:Container(
                          width: MediaQuery.of(context).size.width,
                          //height: MediaQuery.of(context).size.height,
                          child: TabBarView(
                                  controller: _tabController,
                                  children: [

                                    BasicDataView(),
                                    EmployeeSkillsView(),
                                    EmployeeSkillsView()
                                     ],
                                ),
                        ),


                       ),
                      ]),
                    ),

          ));
  }

  final picker = ImagePicker();

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
          titleText: 'Information',
          contentText: 'Sorry,You do not have permission to change your Photo',
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

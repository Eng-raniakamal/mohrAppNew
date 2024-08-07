
import 'dart:convert';
import 'dart:io';

import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:essmohr/application/app_prefs.dart';
import 'package:essmohr/application/constants.dart';
import 'package:essmohr/application/di.dart';

import 'package:essmohr/domain/model/model.dart';
import 'package:essmohr/domain/model/navigationManu.dart';
import 'package:essmohr/presentation/AddImage/viewModel/GetImage_ViewModel.dart';
import 'package:essmohr/presentation/Attendance/view/attendanceAlert.dart';
import 'package:essmohr/presentation/Attendance/view/attendanceView.dart';
import 'package:essmohr/presentation/editEmployee/View/empAcademicDegree_view.dart';
import 'package:essmohr/presentation/resources/assets_manager.dart';

import 'package:essmohr/presentation/resources/colors.dart';
import 'package:essmohr/presentation/resources/routes.dart';
import 'package:essmohr/presentation/resources/strings_manager.dart';
import 'package:essmohr/presentation/widgets/appbar_widget.dart';
import 'package:essmohr/presentation/widgets/appbarstart.dart';
import 'package:essmohr/presentation/widgets/navigator_bar.dart';
import 'package:essmohr/presentation/widgets/profile_widget.dart';
import 'package:permission_handler/permission_handler.dart';




final AppPreferences _appPreferences = instance<AppPreferences>();
final EmployeeImageViewModel _imageViewModel = instance<EmployeeImageViewModel>();

class MissionLayout extends StatefulWidget implements NavigationStates
{
  const MissionLayout({Key? key}) : super(key: key);
  @override
  State<MissionLayout> createState() => _EmployeeEditViewState();
}

class _EmployeeEditViewState extends State<MissionLayout>with TickerProviderStateMixin {
  
  final _Formkey = GlobalKey<FormState>();
  String? userId;
  String? userImage;
  File? image;
  _bind(){
    _imageViewModel.start();
  }
  @override
  void initState() {
    _bind();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    final TabController _tabController = TabController(
        length: (3), vsync: this);
    final item=<Widget>
    [ const Icon(Icons.person,size: 30,color: colorManager.white,),
      const Icon(Icons.home,size: 30,color: colorManager.white),
      const Icon(Icons.notifications,size: 30,color: colorManager.white),

    ];
    return
      ThemeSwitchingArea(
          child: Builder(
            builder: (context) =>
                Scaffold(
                  appBar: buildAppBar(context),
                  // backgroundColor: colorManager.white,
                  bottomNavigationBar:NavigatorBar(index: 0,notificationNumber: Constants.notificationNumber,)
                  ,body:
                Column(
                    children: [
                      Flexible(
                        // flex: 1,
                        child:
                        Container(
                            padding: const EdgeInsets.only(top: 20),
                            width: MediaQuery
                                .of(context)
                                .size
                                .width,
                            height: 250,
                            //MediaQuery.of(context).size.height/3,
                            child: Form(
                                key: _Formkey,
                                child: Container(width: MediaQuery.of(context).size.width,
                                  height: MediaQuery.of(context).size.height*3,
                                  child: Column(
                                      children: [
                                        StreamBuilder<UserImageModel>(
                                            stream: _imageViewModel.outputUserImage,
                                            builder: (context, snapshot) {
                                              return
                                                _getImageWidget(
                                                    snapshot.data,context)
                                              ;}
                                        ),
                                        Container( //child:Align(
                                          alignment: Alignment.center,
                                          padding: const EdgeInsets.all(10),
                                          width: MediaQuery.of(context).size.width,
                                          height: 50,
                                          decoration: BoxDecoration(
                                            //color: Colors.grey[300],
                                              borderRadius: BorderRadius
                                                  .circular(30.0,)),

                                          child: TabBar(
                                            controller: _tabController,
                                            isScrollable: false,
                                            labelColor: colorManager.primary,
                                            unselectedLabelColor: colorManager
                                                .primary,
                                            indicator: BoxDecoration(
                                              borderRadius: BorderRadius
                                                  .circular(40.0),
                                              color: colorManager
                                                  .greywithOpacity,
                                            ),
                                            tabs: const [
                                              // Tab(text:"  "+ AppStrings.attendance_Activity
                                              //     .tr()+"  "),
                                              // Tab(text:"  "+ AppStrings.attendance_Alerts
                                              //     .tr()+"  "),
                                              //Add the tabs name

                                            ],
                                          ),
                                        ),

                                      ]
                                  ),
                                )
                            )
                        ),
                      ),
                      Flexible(
                        // flex:2 ,
                        child:
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height*3.5,
                          child: TabBarView(
                            controller: _tabController,
                            children: const [
                            // add the different screens
                            ],
                          ),
                        ),


                      ),
                    ]),
                ),
          ));
  }

  Widget _getImageWidget(UserImageModel? image,BuildContext context) {
    if (image != null) {
      // userImage = image.data;
      Constants.imagePath=image.data;
      return ProfileWidget(
          imagePath: image.data,
          isEdit: true,
          onClicked: () async {
            showImagePicker(context);
          }
      );
    }
    else {
      //  userImage = ImageAssets.noPhoto;
      Constants.imagePath=ImageAssets.noPhoto;
      return ProfileWidget(
          imagePath: ImageAssets.noPhoto,
          isEdit: true,
          onClicked: () async {
            showImagePicker(context);
          }
      );
    }
  }




}










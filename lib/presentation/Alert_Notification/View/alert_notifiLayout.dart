import 'dart:convert';
import 'dart:io';

import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:essmohr/presentation/widgets/profileImage.dart';
import 'package:flutter/material.dart';

import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:essmohr/application/di.dart';

import 'package:essmohr/domain/model/model.dart';
import 'package:essmohr/presentation/AddImage/viewModel/GetImage_ViewModel.dart';
import 'package:essmohr/presentation/Alert_Notification/View/alertView.dart';
import 'package:essmohr/presentation/Alert_Notification/View/notificationView.dart';
import 'package:essmohr/presentation/Alert_Notification/testpaging.dart';
import 'package:essmohr/presentation/Attendance/view/attendanceAlert.dart';
import 'package:essmohr/presentation/Attendance/view/attendanceView.dart';
import 'package:essmohr/presentation/editEmployee/View/empAcademicDegree_view.dart';
import 'package:essmohr/presentation/resources/assets_manager.dart';

import 'package:essmohr/presentation/resources/colors.dart';
import 'package:essmohr/presentation/resources/routes.dart';
import 'package:essmohr/presentation/widgets/appbar_widget.dart';
import 'package:essmohr/presentation/widgets/appbarstart.dart';
import 'package:essmohr/presentation/widgets/navigator_bar.dart';
import 'package:permission_handler/permission_handler.dart';
import '../../../application/app_prefs.dart';
import '../../../application/constants.dart';
import '../../../domain/model/navigationManu.dart';

import '../../resources/strings_manager.dart';
import '../../widgets/profile_widget.dart';

final AppPreferences _appPreferences = instance<AppPreferences>();
final EmployeeImageViewModel _imageViewModel =
    instance<EmployeeImageViewModel>();

class AlertLayout extends StatefulWidget implements NavigationStates {
  const AlertLayout({Key? key}) : super(key: key);
  @override
  State<AlertLayout> createState() => _AlertViewState();
}

class _AlertViewState extends State<AlertLayout> with TickerProviderStateMixin {
  final _Formkey = GlobalKey<FormState>();
  String? userId;
  String? userImage;
  File? image;
  _bind() {
    _imageViewModel.start();
  }

  @override
  void initState() {
    _bind();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final TabController _tabController =
        TabController(length: (2), vsync: this);
    final item = <Widget>[
      const Icon(
        Icons.person,
        size: 30,
        color: colorManager.white,
      ),
      const Icon(Icons.home, size: 30, color: colorManager.white),
      const Icon(Icons.notifications, size: 30, color: colorManager.white),
    ];
    return ThemeSwitchingArea(
        child: Builder(
      builder: (context) => Scaffold(
        appBar: buildAppBar(context, AppStrings.Notifications.tr()),
        bottomNavigationBar: NavigatorBar(
          index: 2,
          notificationNumber: Constants.notificationNumber,
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(children: [
            Container(
                padding: EdgeInsets.only(top: 20),
                width: MediaQuery.of(context).size.width,
                height: 250,
                //MediaQuery.of(context).size.height/3,
                child: Form(
                    key: _Formkey,
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 3,
                      child: Column(children: [
                        StreamBuilder<UserImageModel>(
                            stream: _imageViewModel.outputUserImage,
                            builder: (context, snapshot) {
                              return _getImageWidget(snapshot.data, context);
                            }),
                        Container(
                          //child:Align(
                          alignment: Alignment.center,
                          padding: const EdgeInsets.all(10),
                          width: MediaQuery.of(context).size.width,
                          height: 50,
                          decoration: BoxDecoration(
                              //color: Colors.grey[300],
                              borderRadius: BorderRadius.circular(
                            30.0,
                          )),

                          child: TabBar(
                            controller: _tabController,
                            isScrollable: true,
                            labelColor: colorManager.primary,
                            unselectedLabelColor: colorManager.primary,
                            indicator: BoxDecoration(
                              borderRadius: BorderRadius.circular(40.0),
                              color: colorManager.greywithOpacity,
                            ),
                            tabs: [
                              Tab(text: "  " + AppStrings.memos.tr() + "  "),
                              Tab(
                                  text: "  " +
                                      AppStrings.announcements.tr() +
                                      "  "),
                            ],
                          ),
                        ),
                      ]),
                    ))),
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 3,
              child: TabBarView(
                controller: _tabController,
                children: const [
                  //PaginatedDataTableView(),
                  NotificationView(),
                  AlertView(),
                ],
              ),
            ),
          ]),
        ),
      ),
    ));
  }

  Widget _getImageWidget(UserImageModel? image, BuildContext context) {
    if (image != null) {
      // userImage = image.data;
      Constants.imagePath = image.data;
      return ProfileImageWidget(
        imagePath: image.data,
      );
    } else {
      //  userImage = ImageAssets.noPhoto;
      Constants.imagePath = ImageAssets.noPhoto;
      return ProfileImageWidget(
        imagePath: ImageAssets.noPhoto,
      );
    }
  }
}

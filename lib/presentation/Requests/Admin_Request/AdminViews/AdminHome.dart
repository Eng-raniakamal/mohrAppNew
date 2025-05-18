
import 'dart:core';
import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:essmohr/presentation/Requests/Admin_Request/AdminViews/reviewAdmin.dart';
import 'package:essmohr/presentation/Requests/Admin_Request/AdminViews/reviewedAdmin.dart';
import 'package:essmohr/presentation/Requests/Admin_Request/AdminViews/submitAdmin.dart';
import 'package:essmohr/presentation/Requests/Admin_Request/AdminViews/viewAmin.dart';
import 'package:essmohr/presentation/Requests/Permissions/permissionView/submitPermission.dart';
import 'package:essmohr/presentation/widgets/appbarstart.dart';
import 'package:essmohr/presentation/widgets/navigator_bar.dart';
import 'package:flutter/material.dart';
import 'package:essmohr/application/app_prefs.dart';
import 'package:essmohr/application/constants.dart';
import 'package:essmohr/presentation/resources/colors.dart';
import 'package:essmohr/application/di.dart';
import 'package:essmohr/domain/model/navigationManu.dart';
import 'package:essmohr/presentation/resources/strings_manager.dart';


class AdminHome extends StatefulWidget implements NavigationStates
{
  const AdminHome ({Key? key}) : super(key: key);
  @override
  State<AdminHome> createState() => _AdminHomeState();
}

class _AdminHomeState extends State<AdminHome> with TickerProviderStateMixin
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
      ThemeSwitchingArea(
          child: Builder(
            builder: (context) =>
                Scaffold(

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

                                child: Form(
                                    key: _Formkey,
                                    child: Container(
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
                                    AdminSubmit(),
                                    ViewAdmin(),
                                    ReviewAdmin(),
                                    ReviewedAdmin(),

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



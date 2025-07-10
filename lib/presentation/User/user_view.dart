import 'package:animated_theme_switcher/animated_theme_switcher.dart';

import 'package:easy_localization/easy_localization.dart';

import 'package:essmohr/presentation/Requests/Permissions/permissionView/permissionsView.dart';

import 'package:essmohr/presentation/Requests/Vacations/view/vactionRequests_view.dart';
import 'package:essmohr/presentation/Requests/missionRequest/missionView/missionView.dart';
import 'package:essmohr/presentation/newDesign/core/utils/import_file.dart';
import 'package:essmohr/presentation/newDesign/feature/home/control/home_cubit.dart';

import 'package:flutter/material.dart';
import 'package:essmohr/application/app_prefs.dart';
import 'package:essmohr/application/constants.dart';
import 'package:essmohr/application/core.dart';
import 'package:essmohr/application/di.dart';
import 'package:essmohr/data/data_source/local_data_source.dart';
import 'package:essmohr/domain/model/model.dart';

import 'package:essmohr/presentation/AddImage/viewModel/GetImage_ViewModel.dart';

import 'package:essmohr/presentation/common/state_renderer/state_render_impl.dart';
import 'package:essmohr/presentation/User/User_viewModel.dart';
import 'package:essmohr/presentation/resources/colors.dart';
import 'package:essmohr/presentation/resources/strings_manager.dart';
import 'package:essmohr/presentation/widgets/appbar_widget.dart';
import 'package:essmohr/presentation/widgets/button_widget.dart';
import 'package:essmohr/presentation/widgets/clipPathWidget.dart';
import 'package:essmohr/presentation/widgets/navigator_bar.dart';
import 'package:essmohr/presentation/widgets/profile_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/model/navigationManu.dart';
import '../Requests/Admin_Request/AdminViews/AdminHome.dart';
import '../Requests/ChangeShiftRequest/ChangeShiftViews/ChangeShiftHome.dart';
import '../Requests/Financial_Requests/FinancialViews/FinancialHome.dart';
import '../Requests/Vacations/view/VacationHome.dart' show vacationHome;
import '../newDesign/feature/home/presentation/widget/header_home_widget.dart';
import '../newDesign/feature/home/presentation/widget/home_body_widget.dart';
import '../newDesign/feature/home/presentation/widget/last_salary_widget.dart';
import '../newDesign/feature/home/presentation/widget/no_report_widget.dart';
import '../newDesign/feature/notification/control/tab_notification_cubit.dart';
import '../newDesign/feature/notification/presentation/screen/notification_screen.dart';
import '../newDesign/feature/vacation/presentation/widget/vacation_type_widget/Vacation_Carousel_Widget.dart';
import '../resources/assets_manager.dart';
import '../resources/routes.dart';


// final items=<Widget>
// [ const Icon(Icons.person,size: 30,),
//   const Icon(Icons.home,size: 30,),
//   const Icon(Icons.notifications,size: 30,),
//
// ];
class userView extends StatefulWidget implements NavigationStates{
  const userView({Key? key}) : super(key: key);
  @override
  _userViewState createState() =>_userViewState();
}

class _userViewState extends State<userView> {

  final EmployeeViewModel _viewModel = instance<EmployeeViewModel>();
  final EmployeeImageViewModel _imageViewModel = instance<EmployeeImageViewModel>();
  final AppPreferences _appPreferences = instance<AppPreferences>();
  //LocalDataSource _localDataSource = instance<LocalDataSource>();
  bool canEditImage=true;

  _bind(){

    _viewModel.start();
    _imageViewModel.start();
  }
  @override
  void initState() {
    checkNewNotifications();
    _bind();
    super.initState();
  }

  static final List<Widget> _body = [
    HomeBodyWidget(),
    NotificationScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
        BlocProvider(
        create: (context) => HomeCubit(),),
   ],


   child: ThemeSwitchingArea(
        child: Builder(
        builder: (context) =>
        Scaffold(
            extendBodyBehindAppBar: true,
          //  appBar: buildAppBar(context),
          //   bottomNavigationBar:
          //    NavigatorBar(index: 1,notificationNumber: Constants.notificationNumber),
            body:
        StreamBuilder<FlowState>(
            stream: _viewModel.outputState,
            builder: (context, snapshot) {

              final data = snapshot.data;
              if (data is FlowState) {
                return data.getScreenWidget(
                  context,
                  _getContentWidget(),
                  _viewModel.start,
                      () {}, // onPopupClick
                );
              } else {
                // Log or handle unexpected types safely
                return _getContentWidget(); // fallback UI
              }


//-----------------------------
            }
        )
    )
    )
    )
    );
  }
  Widget _getContentWidget() {
     return
       StreamBuilder<EmployeeDataModel>(
           stream: _viewModel.outputUserData,
           builder: (context, snapshot) {
             return
               Container(

                   child: SingleChildScrollView(
                       child:
                         Column(
                             children: [

                               StreamBuilder<EmployeeDataModel>(
                                   stream: _viewModel.outputUserData,
                                   builder: (context, snapshot) {
                                     return
                                       _getEmployeeDataWidget(snapshot.data)

                                   ;})

                             ]),


                       )

               );
           });
             }
  Widget buildCountaner(String reqName) {
    return
    Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Hero(
            tag:reqName,
            child:
            ButtonWidget(buttonBgColor: colorManager.lightprimary,
              text: reqName,
              onClicked: () {

              },
            ),

          )
        ],
      ),
    );
  }
  Widget _getEmployeeDataWidget(EmployeeDataModel? userData) {

    if (userData != null) {
      var empData = userData.userDataModel;
      Constants.canUpload = empData.masterImage["CanUploadMasterImage"];
      canEditImage = empData.masterImage["CanUploadMasterImage"];
      String name = _appPreferences.getLanguage() == "en"
          ? empData.EnglishName
          : empData.ArabicName;
      // String email = empData.UserName.toString();
      // String code = empData.EmployeeCode.toString();

      return SafeArea(
          child: SingleChildScrollView(
          child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 25).r,
    child: Column(

        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HeaderHomeWidget(title: name),
          SizedBox(height: 200,),
          VacationCarouselWidget(),
          //NoReportWidget(),
          // ReportWidget(
          //   typeReport: "تقرير الطلبات",
          //   nameReport: "طلب سلفة",
          //   isRequestAdvance: true,
          //   isCertified: true,
          //   numberOfInstallments: 3,
          //   amount: 234,
          //   not: "تقبل الله منكم الحج وقد تم اعتماد الاجازة",
          // ),
          // ReportWidget(
          //   typeReport: "تقرير الاجازات",
          //   nameReport: "اجازة مرضية",
          //   isUnderReview: true,
          //   isSickLeave: true,
          //   numberOfInstallments: 2,
          //   amount: 20,
          // ),
         // SizedBox(height: 20),
          //LastSalaryWidget()
          // Text(name, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: colorManager.white)),
          // const SizedBox(height: 3),
          // Text(email, style: const TextStyle(color: colorManager.white)),
          // const SizedBox(height: 3),
          // Text(code, style: const TextStyle(color: colorManager.white)),
        ],
    ),
          ),
          ),
      );
    }
    return Container();

    }
  Widget _getImageWidget(UserImageModel? userImage) {
    String? URLimage ;
    if (userImage != null) {
       URLimage = userImage.data;

    Constants.imagePath=URLimage;
     return ProfileWidget(
          imagePath: URLimage,
          isEdit: false,
          onClicked: () {
            resetModules();
            Navigator.of(context).pushNamed(Routes.editProfileRoute);
          }
      );
    }
    else {
          URLimage=ImageAssets.noPhoto;
          Constants.imagePath= URLimage;
          return ProfileWidget(
          //imagePath: ImageAssets.noPhoto,
            imagePath: Constants.imagePath,
          isEdit: false,
          onClicked: () {
            resetModules();
            Navigator.of(context).pushNamed(Routes.editProfileRoute);
          }

      );
    }
  }
  Widget _buildItemList(BuildContext context, int index) {
    return Container(

        child:Column(
           mainAxisAlignment: MainAxisAlignment.end,
            children:[
              Container(
                  color:Colors.orange,
                  width:50,
                  height:50,
                  child:Center(
                      child:Text("${Constants.Rlist[index]}")
                  )
              )
            ]
        )
    );
  }

  @override
  void dispose() {
    _viewModel.dispose();
    super.dispose();
  }

  final List<Map<String, dynamic>> screens =
  [
    {'title': AppStrings.Vacation.tr(), 'screen':  vacationHome()},
    {'title': AppStrings.Permissions.tr(), 'screen': PermissionView(),},
    {'title': AppStrings.missions.tr(), 'screen': MissionView (), },
    {'title': AppStrings.Financial.tr(), 'screen': FinancialHome (), },
    {'title': AppStrings.Admin.tr(), 'screen': AdminHome (), },
    {'title': AppStrings.ChangeShift.tr(), 'screen': ChangeShiftHome (), },
    // {'title': AppStrings.TimeSheet.tr(), 'screen': TimeSheetHome (), },
    // {'title': AppStrings.overTime.tr(), 'screen': overTimeHome (), },
  ];

  void showCustomDropdown(BuildContext context, Offset position) {
    showMenu(
      context: context,
      position: RelativeRect.fromLTRB(position.dx, position.dy, position.dx + 50, position.dy + 50),
      items: screens.map((item) {
        return PopupMenuItem<Map<String, dynamic>>(
          value: item,
          child: Row(
            children: [

              Text(item['title']!),
            ],
          ),
        );
      }).toList(),
    ).then((selectedScreen) async{
      if (selectedScreen != null) {

        Future.microtask(() {
          Navigator.push(context, MaterialPageRoute(
              builder: (context) => selectedScreen['screen']));
        });

        }
        //);
      }
    );}

}










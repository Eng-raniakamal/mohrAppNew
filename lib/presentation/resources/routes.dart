import 'package:easy_localization/easy_localization.dart';
import 'package:essmohr/presentation/Requests/Permissions/Layout/permissionLayout.dart';
import 'package:essmohr/presentation/Requests/missionRequest/Layout/missionLayout.dart';

import 'package:essmohr/presentation/Requests/missionRequest/missionView/missionView.dart';
import 'package:flutter/material.dart';
import 'package:essmohr/application/di.dart';
import 'package:essmohr/presentation/Alert_Notification/View/alert_notfiHome.dart';
import 'package:essmohr/presentation/Attendance/view/AttendanceHome.dart';
import 'package:essmohr/presentation/Requests/Salary/Layout/salaryLayout.dart';
import 'package:essmohr/presentation/Requests/Salary/View/salaryDetailsView.dart';
import 'package:essmohr/presentation/Requests/Vacations/view/vactionRequests_view.dart';
import 'package:essmohr/presentation/User/user_view.dart';
import 'package:essmohr/presentation/home/Home.dart';
import 'package:essmohr/presentation/onbourding/onbording_screen.dart';
import 'package:essmohr/presentation/resources/strings_manager.dart';
import 'package:essmohr/presentation/splash/splashScreen.dart';
import 'package:essmohr/presentation/underConstraction.dart';
import '../ChangePassword/layout/changePasswordLayout.dart';
import '../Requests/Salary/View/salary_View.dart';
import '../Requests/Vacations/Layout/vacationLayout.dart';
import '../Requests/Vacations/view/vactions_view.dart' show vacationsView;
import '../User/layout/employeeLayout.dart';
import '../login/loginView.dart';
import '../newDesign/core/service/dependency_injection/init_cubits.dart';
import '../newDesign/feature/home/presentation/home_screen.dart';
import '../newDesign/feature/layout/presentation/screen/layout_screen.dart';
import '../newDesign/feature/notification/presentation/screen/notification_screen.dart';
import '../newDesign/feature/onboarding/presentation/screen/onboarding_screen.dart';
import '../newDesign/feature/salary/presentation/screen/detail_salary_screen.dart';
import '../settings/layout/settingsLayout.dart';
import '../splash/splash.dart';

class Routes
{
  static const String underConstraction="/underConstruction.dart";
  static const String onboarding1Route="/onboarding";
  static const String onboarding2Route="/newDesign/feature/onboarding/presentation/screen/onboarding";
  static const String splashRoute="/splash";
  static const String loginRoute="/login";
  static const String profileRoute="/user";
  static const String homeRoute="/home/Home.dart";
  //static const String notification="/Alert_Notification";
  static const String notification="/newDesign/feature/notification/presentation/screen/notification_Screen.dart";
  static const String editProfileRoute="/user/layout";
  static const String main="/main";
  static const String settings="/settings";
  static const String changePassword="/changePassword";
  static const String employee="/user/layout";
  static const String attendance="/Attendance/attendanceView.dart";
  static const String Vacations="/Requests/Vacations";
  static const String VacationRequest="/Requests/Vacations/vacationRequests_view.dart";
  static const String salary="/Requests/Salary/View/salary_View.dart";
  static const String salaryDetails="/Requests/Salary/View/salaryDetailsDialog.dart";
  static const String missionRequest="/Requests/missionRequest/missionView/missionView.dart";
  static const String PermissionRequest="/Requests/Permissions/PermissionView/Permissions_View.dart";
}


class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.onboarding1Route:
        return MaterialPageRoute(builder: (_)=> const OnboadingScreen());

      case Routes.onboarding2Route:
        return MaterialPageRoute(builder: (_)=> const Onboarding2Screen());

      case Routes.splashRoute:
        return MaterialPageRoute(builder: (_)=> const SplashView());

      case Routes.loginRoute:
        initLoginModule();
        return MaterialPageRoute(builder: (_)=> const LoginView());

       case Routes.profileRoute:
        initUserModule();
        initUserImageModule();
        return MaterialPageRoute(builder: (_)=>  HomeScreen());

      case Routes.homeRoute:
        initUserModule();
        initUserImageModule();
        initSalaryModule();
        initEmployeeBasicDataModule();
        initEmployeeBasicDataModule();
        initEmployeeSkillsModule();
        initDisplayEmployeeSkillsModule();
        initSaveEmpBasicDataModule();
        initDisplayAcademicDegreesModule();
        initSaveAcademicDegreesModule();
        initQualificationModule();
        initGradeModule();
        initDegreeModule();
        initVacationTypeModule();
        return MaterialPageRoute(builder: (_)=>   LayoutScreen(initialIndex: 0,));

      case Routes.notification:

       // initUserImageModule();
        return MaterialPageRoute(builder: (_)=> NotificationScreen());

        case Routes.editProfileRoute:
          initUserModule();
          initUserImageModule();
          initEmployeeBasicDataModule();
          initEmployeeSkillsModule();
          initDisplayEmployeeSkillsModule();
          initSaveEmpBasicDataModule();
          initDisplayAcademicDegreesModule();
          initSaveAcademicDegreesModule();
          initQualificationModule();
          initGradeModule();
          initDegreeModule();
          initVacationTypeModule();


      return MaterialPageRoute(builder: (_)=>
          //Employee()
      LayoutScreen(initialIndex: 0,)
      );

      case Routes.settings:
          return MaterialPageRoute(builder: (_)=>  Settings());
      case Routes.changePassword:
        return MaterialPageRoute(builder: (_)=>  ChangePassword());
      case Routes.Vacations:
        initVacationModule();
        initCubits();
       // LayoutScreen(initialIndex: 0,)
       // return MaterialPageRoute(builder: (_)=> vacationsView());
        return MaterialPageRoute(builder: (_)=>  LayoutScreen(initialIndex: 2,));

      case Routes.attendance:
        initAttendanceModule();
          return MaterialPageRoute(builder: (_) => AttendanceHome());


      case Routes.VacationRequest:
        initVacationTypeModule();
        initCubits();
        return MaterialPageRoute(builder: (_)=>  VacationLayout());

      case Routes.salary:
        initSalaryModule();
        initUserModule();
        initUserImageModule();
        initEmployeeBasicDataModule();
        initEmployeeSkillsModule();
        initDisplayEmployeeSkillsModule();
        initSaveEmpBasicDataModule();
        initSave2EmpBasicDataModule();
        initDisplayAcademicDegreesModule();
        initSaveAcademicDegreesModule();
        initQualificationModule();
        initGradeModule();
        initDegreeModule();
        initVacationTypeModule();
        return MaterialPageRoute(builder: (_)=>  LayoutScreen(initialIndex: 3,));


      case Routes.salaryDetails:
        initSalaryDetailsModule();
        return MaterialPageRoute(builder: (_)=> salaryDetailsView());


      case Routes.missionRequest:
        initVacationTypeModule();

        return MaterialPageRoute(builder: (_)=>   MissionLayout());

       case Routes.PermissionRequest:
        initVacationTypeModule();
        return MaterialPageRoute(builder: (_)=>   PermissionLayout());


       case Routes.underConstraction:
        initSalaryModule();
        return MaterialPageRoute(builder: (_)=>  UnderConstructionScreen());

       case Routes.employee:
        initEmployeeSkillsModule();
        initDisplayEmployeeSkillsModule();
        initEmployeeBasicDataModule();
        initSaveEmpBasicDataModule();
        initDisplayAcademicDegreesModule();
        initSaveAcademicDegreesModule();
        initQualificationModule();
        initGradeModule();
        initDegreeModule();

        return MaterialPageRoute(builder: (_)=>  Employee());
          default:
          return unDefinedRoute();
    }
  }
  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
        builder: (_) => Scaffold(
          appBar: AppBar(
            title: const Text(AppStrings.noRouteFound).tr(), // todo move this string to strings manager
          ),
          body:  Center(
              child: Text(AppStrings.noRouteFound).tr()), // todo move this string to strings manager
        ));
  }



}


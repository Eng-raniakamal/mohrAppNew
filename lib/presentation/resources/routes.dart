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
import '../Requests/Vacations/Layout/vacationLayout.dart';
import '../User/layout/employeeLayout.dart';
import '../login/loginView.dart';
import '../settings/layout/settingsLayout.dart';

class Routes
{
  static const String underConstraction="/underConstruction.dart";
  static const String onboardingRoute="/onboarding";
  static const String splashRoute="/splash";
  static const String loginRoute="/login";
  static const String profileRoute="/user";
  static const String homeRoute="/home/Home.dart";
  static const String notification="/Alert_Notification";
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
      case Routes.onboardingRoute:
        return MaterialPageRoute(builder: (_)=> const OnboadingScreen ());

      case Routes.splashRoute:
        return MaterialPageRoute(builder: (_)=> const splashScreen());

      case Routes.loginRoute:
        initLoginModule();
        return MaterialPageRoute(builder: (_)=> const LoginView());

       case Routes.profileRoute:
        initUserModule();
        initUserImageModule();
        return MaterialPageRoute(builder: (_)=>  const userView());

      case Routes.homeRoute:
        initUserModule();
        initUserImageModule();
        return MaterialPageRoute(builder: (_)=>  Home());

      case Routes.notification:

       // initUserImageModule();
        return MaterialPageRoute(builder: (_)=>  AlertHome());

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


      return MaterialPageRoute(builder: (_)=>  Employee());

      case Routes.settings:
          return MaterialPageRoute(builder: (_)=>  Settings());
      case Routes.changePassword:
        return MaterialPageRoute(builder: (_)=>  ChangePassword());
      case Routes.Vacations:
        initVacationModule();
        return MaterialPageRoute(builder: (_)=> VacationScreen());

      case Routes.attendance:
        initAttendanceModule();
          return MaterialPageRoute(builder: (_) => AttendanceHome());


      case Routes.VacationRequest:
        initVacationTypeModule();
        return MaterialPageRoute(builder: (_)=>  VacationRequestView());

      case Routes.salary:
        initSalaryModule();
        return MaterialPageRoute(builder: (_)=>  SalaryScreen());


      case Routes.salaryDetails:
        initSalaryDetailsModule();
        return MaterialPageRoute(builder: (_)=>  salaryDetailsView());


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


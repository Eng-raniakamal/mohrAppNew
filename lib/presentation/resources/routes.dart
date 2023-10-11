import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:mohr_hr/application/di.dart';
import 'package:mohr_hr/presentation/Requests/Salary/Layout/salaryLayout.dart';
import 'package:mohr_hr/presentation/Requests/Salary/View/salaryDetailsDialog.dart';
import 'package:mohr_hr/presentation/Requests/Salary/View/salaryDetailsView.dart';
import 'package:mohr_hr/presentation/Requests/Salary/View/salary_View.dart';
import 'package:mohr_hr/presentation/Requests/Vacations/view/vactionRequests_view.dart';
import 'package:mohr_hr/presentation/User/user_view.dart';
//import 'package:mohr_hr/presentation/home/home_Screen.dart';
import 'package:mohr_hr/presentation/home/Home.dart';
//import 'package:mohr_hr/presentation/onboarding/onbording_screen.dart';
import 'package:mohr_hr/presentation/onbourding/onbording_screen.dart';
import 'package:mohr_hr/presentation/resources/strings_manager.dart';
//import 'package:mohr_hr/presentation/profile/profileScreen.dart';
import 'package:mohr_hr/presentation/splash/splashScreen.dart';
//import 'package:mohr_hr/presentation/profile/editProfileScreen.dart';

import '../Requests/Vacations/Layout/vacationLayout.dart';
import '../Requests/Vacations/view/vactions_view.dart';
import '../User/layout/employeeLayout.dart';
import '../editEmployee/View/editEmployee.dart';
import '../editEmployee/View/empSkills_view.dart';
import '../login/loginView.dart';
import '../settings/layout/settingsLayout.dart';
import '../settings/settings_Screen.dart';

class Routes
{
  static const String onboardingRoute="/onboarding";
  static const String splashRoute="/splash";
  static const String loginRoute="/login";
  static const String profileRoute="/user";
  static const String HomeRoute="/home/Home.dart";
  static const String editProfileRoute="/user/layout";
    //  "/editEmployee/editEmployee.dart";
  static const String main="/main";
  static const String settings="/settings";
  static const String employee="/user/layout";
  static const String Vacations="/Requests/Vacations";
  static const String VacationRequest="/Requests/Vacations/vacationRequests_view.dart";
  static const String salary="/Requests/Salary/View/salary_View.dart";
  static const String salaryDetails="/Requests/Salary/View/salaryDetailsDialog.dart";
}


class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.onboardingRoute:
        return MaterialPageRoute(builder: (_)=> OnboadingScreen ());

      case Routes.splashRoute:
        return MaterialPageRoute(builder: (_)=> splashScreen());

      case Routes.loginRoute:
        initLoginModule();
        return MaterialPageRoute(builder: (_)=> const LoginView());

       case Routes.profileRoute:
        initUserModule();
        initUserImageModule();
        return MaterialPageRoute(builder: (_)=>  const userView());

      case Routes.HomeRoute:
        initUserModule();
        initUserImageModule();
        return MaterialPageRoute(builder: (_)=>  Home());

        case Routes.editProfileRoute:
           initEmployeeBasicDataModule();

          initEmployeeSkillsModule();
          initDisplayEmployeeSkillsModule();
          initEmployeeBasicDataModule();
          initSaveEmpBasicDataModule();
          initDisplayAcademicDegreesModule();
          initSaveAcademicDegreesModule();
          initQualificationModule();
          initGradeModule();

        return MaterialPageRoute(builder: (_)=>  Employee());

      case Routes.settings:
          return MaterialPageRoute(builder: (_)=>  Settings());

      case Routes.Vacations:
        initVacationModule();
        return MaterialPageRoute(builder: (_)=> VacationScreen());


      case Routes.VacationRequest:
        initVacationTypeModule();
        return MaterialPageRoute(builder: (_)=> VacationRequestView());

      case Routes.salary:
        initSalaryModule();
        return MaterialPageRoute(builder: (_)=>  SalaryScreen());


      case Routes.salaryDetails:
        initSalaryDetailsModule();
        return MaterialPageRoute(builder: (_)=>  salaryDetailsView());

      case Routes.employee:
        initEmployeeSkillsModule();
        initDisplayEmployeeSkillsModule();
        initEmployeeBasicDataModule();
        initSaveEmpBasicDataModule();
        initDisplayAcademicDegreesModule();
        initSaveAcademicDegreesModule();
        initQualificationModule();
        initGradeModule();

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


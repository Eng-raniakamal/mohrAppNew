import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:essmohr/domain/model/navigationManu.dart';

import 'package:essmohr/presentation/widgets/sidebar/slideWidget.dart';
import 'package:essmohr/presentation/resources/colors.dart';
import 'package:essmohr/presentation/resources/language_manager.dart';
import 'package:essmohr/presentation/settings/settings_Screen.dart';
import '../../editEmployee/View/editEmployee.dart';
import '../../resources/routes.dart';
//import 'package:easy_localization/easy_localization.dart';

import 'dart:math' as math;
import '../../widgets/navigator_bar.dart';
import '../editProfileScreen.dart';

class Employee extends StatelessWidget implements NavigationStates{

  @override
  Widget build(BuildContext context) {

    //  var initialState;
    return Scaffold(

      body: BlocProvider<NavigationBloc>(
        create:(BuildContext context) => NavigationBloc(),
        //(context) => NavigationBloc(initialState),
        child:
        Stack(
          children: [
            EmployeeEditView() ,
            SideBar(),
         ],
        ),
      ),
    );
  }



}




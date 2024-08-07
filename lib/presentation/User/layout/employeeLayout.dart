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
      //backgroundColor: Colors.transparent,
      // bottomNavigationBar:
      // CurvedNavigationBar(items: item,
      //     index: 0,
      //
      //     buttonBackgroundColor: colorManager.lightprimary,
      //     backgroundColor: Colors.transparent,
      //     color: colorManager.lightprimary,
      //
      //
      //     onTap: (int index) {
      //   if(index==1)
      //     {
      //       // changeIndex(index);
      //       Navigator.of(context).pushReplacementNamed(Routes.HomeRoute);
      //     }
      //   else
      //     if(index==2)
      //       {
      //         //Navigator.of(context).pushReplacementNamed(Routes.);
      //       }
      //       }
      // ),
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
  final item=<Widget>
  [ const Icon(Icons.person,size: 30,color: colorManager.white,),
    const Icon(Icons.home,size: 30,color: colorManager.white),
    const Icon(Icons.notifications,size: 30,color: colorManager.white),

  ];


}




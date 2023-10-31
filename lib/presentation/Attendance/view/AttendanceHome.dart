import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mohr_hr/domain/model/navigationManu.dart';
import 'package:mohr_hr/presentation/Attendance/view/AttendanceLayout.dart';

import 'package:mohr_hr/presentation/widgets/sidebar/slideWidget.dart';
import 'package:mohr_hr/presentation/resources/colors.dart';

import '../../editEmployee/View/editEmployee.dart';



class AttendanceHome extends StatelessWidget with NavigationStates{

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
            AttendanceLayout() ,
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




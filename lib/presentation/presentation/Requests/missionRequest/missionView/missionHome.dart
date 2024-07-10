
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mohr_hr/domain/model/navigationManu.dart';
import 'package:mohr_hr/presentation/Requests/missionRequest/missionView/missionLayout.dart';
import 'package:mohr_hr/presentation/widgets/sidebar/slideWidget.dart';
import 'package:mohr_hr/presentation/resources/colors.dart';

class MissionHome extends StatelessWidget with NavigationStates{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider<NavigationBloc>(
        create:(BuildContext context) => NavigationBloc(),
        //(context) => NavigationBloc(initialState),
        child:
        Stack(
          children: [
            const MissionLayout() ,
            SideBar(),
          ],
        ),
      ),
    );
  }
  final item=<Widget>
  [
    const Icon(Icons.person,size: 30,color: colorManager.white,),
    const Icon(Icons.home,size: 30,color: colorManager.white),
    const Icon(Icons.notifications,size: 30,color: colorManager.white),
  ];
}




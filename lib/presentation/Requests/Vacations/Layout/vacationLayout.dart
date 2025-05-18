import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:essmohr/presentation/Requests/Vacations/view/VacationHome.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:essmohr/domain/model/navigationManu.dart';
import 'package:essmohr/presentation/widgets/sidebar/slideWidget.dart';
import 'package:essmohr/presentation/resources/colors.dart';
import '../../../resources/routes.dart';
import '../view/vactions_view.dart';
//

class VacationLayout extends StatelessWidget implements NavigationStates{

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
            vacationHome(),
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




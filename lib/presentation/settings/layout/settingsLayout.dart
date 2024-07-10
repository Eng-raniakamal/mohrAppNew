import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:essmohr/domain/model/navigationManu.dart';

import 'package:essmohr/presentation/widgets/sidebar/slideWidget.dart';

import '../../editEmployee/View/editEmployee.dart';
//import '../editProfileScreen.dart';
import '../settings_Screen.dart';


class Settings extends StatelessWidget implements NavigationStates{

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
            SettingsPage() ,
            // BlocListener<NavigationBloc, NavigationStates>(
            //   listener: (BuildContext context, state) {
            //     // Check here if the state is unathenticated
            //
            //     //Get.toNamed(); // Your login or initial page
            //   },
            //   child: BlocBuilder<NavigationBloc, NavigationStates>(
            //     builder: (context, navigationState) {
            //       return navigationState as Widget;
            //     },
            //
            //   ),
            // ),
            SideBar(),
          ],
        ),
      ),
    );
  }
}




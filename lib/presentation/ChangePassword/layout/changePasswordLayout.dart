import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:essmohr/domain/model/navigationManu.dart';
import 'package:essmohr/presentation/ChangePassword/changePassword.dart';

import 'package:essmohr/presentation/widgets/sidebar/slideWidget.dart';

import '../../editEmployee/View/editEmployee.dart';
//import '../editProfileScreen.dart';








class ChangePassword extends StatelessWidget implements NavigationStates{

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
            ChangePasswordPage() ,
            SideBar(),
          ],
        ),
      ),
    );
  }
}




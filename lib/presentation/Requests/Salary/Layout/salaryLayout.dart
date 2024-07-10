import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:essmohr/domain/model/navigationManu.dart';
import 'package:essmohr/presentation/Requests/Salary/View/salary_View.dart';
import 'package:essmohr/presentation/widgets/sidebar/slideWidget.dart';
import 'package:essmohr/presentation/resources/colors.dart';
import '../../../resources/routes.dart';



//
class SalaryScreen extends StatelessWidget implements NavigationStates{

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
             salaryView(),
            //EmployeeEditView() ,
            SideBar(),
          ],
        ),
      ),
    );
  }

}




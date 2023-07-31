import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mohr_hr/domain/model/navigationManu.dart';
import 'package:mohr_hr/presentation/Requests/Salary/View/salary_View.dart';
import 'package:mohr_hr/presentation/widgets/sidebar/slideWidget.dart';
import 'package:mohr_hr/presentation/resources/colors.dart';
import '../../../resources/routes.dart';



//
class SalaryScreen extends StatelessWidget with NavigationStates{

  @override
  Widget build(BuildContext context) {
    //  var initialState;
    return Scaffold(
      bottomNavigationBar:
      CurvedNavigationBar(items: item,
          index: 0,
          buttonBackgroundColor: colorManager.lightprimary,
          backgroundColor: Colors.transparent,
          color: colorManager.lightprimary,

          onTap: (int index) {
            if(index==1)
            {
              // changeIndex(index);
              Navigator.of(context).pushReplacementNamed(Routes.HomeRoute);
            }
            else
            if(index==2)
            {
              //Navigator.of(context).pushReplacementNamed(Routes.);
            }
          }
      ),
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
  final item=<Widget>
  [
    const Icon(Icons.person,size: 30,color: colorManager.white,),
    const Icon(Icons.home,size: 30,color: colorManager.white),
    const Icon(Icons.notifications,size: 30,color: colorManager.white),
  ];
}




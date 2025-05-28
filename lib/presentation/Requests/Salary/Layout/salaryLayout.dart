import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:essmohr/domain/model/navigationManu.dart';
import 'package:essmohr/presentation/Requests/Salary/View/salary_View.dart';


//
class SalaryScreen extends StatelessWidget implements NavigationStates{

  @override
  Widget build(BuildContext context) {
    //  var initialState;
    return Scaffold(
      // bottomNavigationBar:
      // CurvedNavigationBar(items: item,
      //     index: 0,
      //     buttonBackgroundColor: colorManager.lightprimary,
      //     backgroundColor: Colors.transparent,
      //     color: colorManager.lightprimary,
      //
      //     onTap: (int index) {
      //       if(index==1)
      //       {
      //         // changeIndex(index);
      //         Navigator.of(context).pushReplacementNamed(Routes.HomeRoute);
      //       }
      //       else
      //       if(index==2)
      //       {
      //         //Navigator.of(context).pushReplacementNamed(Routes.);
      //       }
      //     }
      // ),
      body: BlocProvider<NavigationBloc>(
        create:(BuildContext context) => NavigationBloc(),
        //(context) => NavigationBloc(initialState),
        child:
        Stack(
          children: [
             salaryView(),
            //EmployeeEditView() ,

          ],
        ),
      ),
    );
  }
  // final item=<Widget>
  // [
  //   const Icon(Icons.person,size: 30,color: colorManager.white,),
  //   const Icon(Icons.home,size: 30,color: colorManager.white),
  //   const Icon(Icons.notifications,size: 30,color: colorManager.white),
  // ];
}




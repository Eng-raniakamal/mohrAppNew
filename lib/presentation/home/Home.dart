import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mohr_hr/domain/model/navigationManu.dart';

import 'package:mohr_hr/presentation/widgets/sidebar/slideWidget.dart';

import '../User/user_view.dart';



class Home extends StatelessWidget with NavigationStates{

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
            // userView(),
             BlocListener<NavigationBloc, NavigationStates>(
               listener: (BuildContext context, state) {
                 // Check here if the state is unathenticated

                 //Get.toNamed(); // Your login or initial page
               },
              child: BlocBuilder<NavigationBloc, NavigationStates>(
                builder: (context, navigationState) {
                  return navigationState as Widget;
                },

           ),
            ),
            SideBar(),
          ],
        ),
      ),
    );
  }
  }




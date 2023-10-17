import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mohr_hr/presentation/resources/colors.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';


int index=2;

final items=<Widget>
[
  Icon(Icons.menu,size: 30,),
  Icon(Icons.search,size: 30,),
  Icon(Icons.settings,size: 30,),
  Icon(Icons.notifications,size: 30,),
  Icon(Icons.person,size: 30,),

];



CurvedNavigationBar buildNavigatorBar(BuildContext context) {
  return CurvedNavigationBar(
    height: 50,
     index: 0,
      items: items,
      color: colorManager.primary,
      buttonBackgroundColor: Colors.transparent,
      backgroundColor: Colors.transparent,

      //(index)=>setState(()=>.index=index),

  );

}
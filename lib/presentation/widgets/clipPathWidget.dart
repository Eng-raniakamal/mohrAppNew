import 'package:flutter/material.dart';

import 'package:mohr_hr/presentation/widgets/clipPath.dart';
import 'package:mohr_hr/presentation/resources/colors.dart';



class clipPathWidgets extends StatelessWidget {
  const clipPathWidgets({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return

      Padding(
      padding: const EdgeInsets.all(0.0),
      child: Stack(
          children: [
          ClipPath(
          clipper: CustomClipPathOpecity(),
            child: Container(
               width: MediaQuery.of(context).size.width,
                height: 170,
                decoration:  BoxDecoration(color:Colors.grey[300],
        ),
      ),),
    ClipPath(
    clipper: CustomClipPath(),
    child: Container(
    width: MediaQuery.of(context).size.width,
    height: 150,
    color: colorManager.primary,
    // decoration:  BoxDecoration(
    // gradient: LinearGradient(
    // colors: [colorManager.primary, colorManager.lightprimary, colorManager.grey],
    // begin: Alignment.topRight,
    // end: Alignment.bottomLeft),
    ),
    ),
   // )
    ])
    );
  }
}







// Padding(
// padding: const EdgeInsets.all(0.0),
// child: Stack(
// children: [
// ClipPath(
// clipper: CustomClipPathOpecity(),
// child: Container(
// width: MediaQuery.of(context).size.width,
// height: 170,
// decoration:  BoxDecoration(color:Colors.grey[300],
// ),
// ),),
// ClipPath(
// clipper: CustomClipPath(),
// child: Container(
// width: MediaQuery.of(context).size.width,
// height: 150,
// decoration:  BoxDecoration(
// gradient: LinearGradient(
// colors: [colorManager.primary, colorManager.lightprimary, colorManager.grey],
// begin: Alignment.topRight,
// end: Alignment.bottomLeft),
// ),
// ),),
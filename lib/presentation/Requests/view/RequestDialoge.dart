import 'package:flutter/material.dart';
import 'package:mohr_hr/presentation/resources/colors.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mohr_hr/presentation/Requests/Salary/View/salaryDetailsView.dart';


Widget?  showRequestDialog(BuildContext context, {required ValueChanged onValue}) {
  showGeneralDialog(
    context: context,
    barrierLabel: "Barrier",
    barrierDismissible: true,
    barrierColor: Colors.black.withOpacity(0.5),
    transitionDuration: const Duration(milliseconds: 400),
    pageBuilder: (_, __, ___) {
      return Center(
          child: Container(
            height: 620,
            margin: const EdgeInsets.symmetric(horizontal: 16),
            padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 24),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.95),
              borderRadius: BorderRadius.circular(40),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.3),
                  offset: const Offset(0, 30),
                  blurRadius: 60,
                ),
                const BoxShadow(
                  color: Colors.black45,
                  offset: Offset(0, 30),
                  blurRadius: 60,
                ),
              ],
            ),
            child: Scaffold(
              backgroundColor: Colors.transparent,
              body: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    SingleChildScrollView(
                      scrollDirection: Axis.vertical,

                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [

                                 Text(
                                  "Requests",
                                  style: TextStyle(
                                    fontSize: 30,
                                    fontFamily: "Poppins",
                                    fontWeight: FontWeight.w600,
                                  ),
                              ),

                              //Drawer(),

                            // Container(
                            //     width: 300,
                            //     //height:200,
                            //     padding: EdgeInsets.all(10),
                            //     margin: EdgeInsets.all(5),
                            //
                            //       child:
                            //          Row(
                            //
                            //            children:[
                            //              buildButton("Vacation",colorManager.greywithOpacity),
                            //              SizedBox(height: 10,width:150,child:
                            //              buildButton("Financial",colorManager.lightprimary),),
                            //              SizedBox(height: 10,width:100,child:
                            //              buildButton("Errands",colorManager.lightprimary),),
                            //              SizedBox(height: 10,width:100,child:
                            //              buildButton("Admin",colorManager.lightprimary),)
                            //
                            //              ]
                            //       ),
                            //
                            // )
                              ]),
                        ),


              ]),


           )
          ));
    },
    transitionBuilder: (_, anim, __, child) {
      Tween<Offset> tween;
      if (anim.status == AnimationStatus.reverse) {
        tween = Tween(begin: const Offset(0, 1), end: Offset.zero);
      } else {
        tween = Tween(begin: const Offset(0, -1), end: Offset.zero);
      }

      tween = Tween(begin: const Offset(0, -1), end: Offset.zero);

      return SlideTransition(
        position: tween.animate(
          CurvedAnimation(parent: anim, curve: Curves.easeInOut),
        ),

        child: child,
      );
    },
  ).then(onValue);
}
Widget buildButton(String ReqName,Color bgColor) {

  switch (ReqName) {
    case "Vacation":
      return Hero(
          tag: ReqName,
         // transitionOnUserGestures: true,
          child: InkWell(
              onTap: () {
               // Navigator.of(context).pushReplacementNamed(Routes.Vacations);
              },

                  ),

      );
    case "Financial":
      return Hero(
          tag: ReqName,
          transitionOnUserGestures: true,
          child: InkWell(
              onTap: () {

              },
              child: Column(
                children:const [
                  SizedBox(width: 70,height: 70,

                  ),

                ],
              )
          )
      );
    case "Errands":
      return Hero(
          tag: ReqName,
          transitionOnUserGestures: true,
          child: InkWell(
              onTap: () {

              },
              child: Column(mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children:const [
                  SizedBox(width: 70,height: 70,
                    ),

                  SizedBox(width: 80,height: 70,child: Text("Attendance"))
                ],
              )
          )
      );
    case "Admin":
      return Hero(
          tag: ReqName,
          transitionOnUserGestures: true,
          child: InkWell(
              onTap: () {

                },
              child: Column(
                children:const [
                  SizedBox(width: 70,height: 70,

                  ),
                  SizedBox(width:70,height: 70,child: Text("Requests"))
                ],
              )
          )
      );
    default:
      return Container();
  }
}

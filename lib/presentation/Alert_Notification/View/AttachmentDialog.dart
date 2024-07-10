import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/material.dart';
import 'package:essmohr/presentation/Requests/Salary/View/salaryDetailsView.dart';
import 'package:essmohr/presentation/resources/themes.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
final GlobalKey<SfPdfViewerState> _pdfViewerKey = GlobalKey();

Widget?  showAttachmentDialog(dynamic data,BuildContext context, {required ValueChanged onValue}) {
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
              color: Colors.white70,
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
            // child:  ThemeSwitchingArea(
            child:
            Builder(
              builder: (context) =>
                  Scaffold(
                    backgroundColor:Colors.white70,
                    body:  Stack(
                          clipBehavior: Clip.none,
                          children: [

                             SingleChildScrollView(
                                scrollDirection: Axis.vertical,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [

                                       Text(data[0]["Name"].toSting(),
                                         style: TextStyle(     //    style: TextStyle(
                           fontSize: 20,
                           fontFamily: "Poppins",
                           fontWeight: FontWeight.w600,),
                                      // Image.network(data[0]["img"]?.toSting()),


                                       ) ],
                                  ),
                                ),


                          ]),
                    ),
                  ),
            ),

      );
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

Widget? attachmentContent(dynamic data)
{
  return Container
    (
    child: Column(
      children: [
        Text(data[0]["Name"]?.toSting()),
        Image.network(data[0]["img"]?.toSting()),
        // SfPdfViewer.network(
        //  data[0]["pdf"].toString(),
        //   key: _pdfViewerKey,
       // ),
      ],
    )

  );
}

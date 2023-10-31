
import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:lottie/lottie.dart';
import 'package:page_transition/page_transition.dart';
import 'package:mohr_hr/presentation/login/loginView.dart';
import 'package:mohr_hr/presentation/resources/routes.dart';

class UnderConstructionScreen extends StatelessWidget {
  const UnderConstructionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return

        Column(crossAxisAlignment: CrossAxisAlignment.center,
            children: [Padding(
              padding: const EdgeInsets.all(5.0),
              child: SizedBox(height: 200,width: 200,
                  child: Image.asset("assets/images/44190-under-construction-1 (1).gif)"),


    ))]);


    //  children: [Image.asset("images/Logo.png")

  }
}

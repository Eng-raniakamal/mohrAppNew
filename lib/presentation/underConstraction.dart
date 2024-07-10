
import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:lottie/lottie.dart';
import 'package:essmohr/presentation/widgets/appbar_widget.dart';
import 'package:essmohr/presentation/widgets/appbarstart.dart';
import 'package:page_transition/page_transition.dart';
import 'package:essmohr/presentation/login/loginView.dart';
import 'package:essmohr/presentation/resources/routes.dart';

class UnderConstructionScreen extends StatelessWidget {
  const UnderConstructionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBarstart(context),
        // leading: BackButton(onPressed: ()=>Navigator.pop(context),),
        // title: const Text('Second Route')),
      body:Center(
      child: Container(color: Colors.white,
          child: Image.asset("assets/images/44190-under-construction-1 (1).gif"))
    ))
    ;

    //  children: [Image.asset("images/Logo.png")

  }
}

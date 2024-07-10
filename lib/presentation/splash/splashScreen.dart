
import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:lottie/lottie.dart';
import 'package:page_transition/page_transition.dart';
import 'package:essmohr/presentation/login/loginView.dart';
import 'package:essmohr/presentation/resources/routes.dart';

class splashScreen extends StatelessWidget {
  const splashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
      AnimatedSplashScreen(
        splash:
        // Column(crossAxisAlignment: CrossAxisAlignment.center,
        //     children: [Padding(
        //       padding: const EdgeInsets.all(5.0),
        //       child: SizedBox(height: 200,width: 200,
        //           child: Image.asset("assets/images/Logo.png")),
              //Lottie.network("https://assets9.lottiefiles.com/packages/lf20_hslwihoj.json"),

          //  )]),
        Lottie.asset("assets/jsonFiles/splash.json"),
        nextRoute: Routes.loginRoute,
        nextScreen: LoginView(),
        splashIconSize: 230,
        duration: 3000,
        splashTransition: SplashTransition.fadeTransition,
        pageTransitionType: PageTransitionType.leftToRight,
        animationDuration: const Duration(seconds: 3),

    );

                //  children: [Image.asset("images/Logo.png")

  }
}


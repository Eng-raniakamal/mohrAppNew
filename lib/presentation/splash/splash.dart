import 'dart:async';
import 'dart:ui';


import 'package:flutter/material.dart';
import 'package:mohr_hr/application/app_prefs.dart';
import 'package:mohr_hr/application/di.dart';
import 'package:mohr_hr/presentation/resources/assets_manager.dart';
import 'package:mohr_hr/presentation/resources/colors.dart';
import 'package:mohr_hr/presentation/resources/routes.dart';
import 'package:rive/rive.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  _SplashViewState createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  Timer? _timer;
  AppPreferences _appPreferences = instance<AppPreferences>();

  _startDelay() {
    _timer = Timer(Duration(seconds: 2), _goNext);
  }

  _goNext() async {
    _appPreferences.isUserLoggedIn().then((isUserLoggedIn) => {
          if (isUserLoggedIn)
            {
              // navigate to main screen
              Navigator.pushReplacementNamed(context, Routes.HomeRoute)
            }
          else
            {
              _appPreferences
                  .isOnBoardingScreenViewed()
                  .then((isOnBoardingScreenViewed) => {
                        if (isOnBoardingScreenViewed)
                          {
                            Navigator.pushReplacementNamed(
                                context, Routes.loginRoute)
                          }
                        else
                          {
                            Navigator.pushReplacementNamed(
                                context, Routes.onboardingRoute)
                          }
                      })
            }
        });
  }

  @override
  void initState() {
    super.initState();
    _startDelay();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorManager.white,
      body:
      // Center(
      //   child: Image(
      //     image: AssetImage(ImageAssets.startLogo),
      //   ),
      // ),
      Stack(
        children: [
          Positioned(
            width: MediaQuery.of(context).size.width * 1.7,
            left: 100,
            bottom: 100,
            child: Image.asset(
              "assets/Backgrounds/Spline.png",
            ),
          ),
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
              child: const SizedBox(),
            ),
          ),
          const RiveAnimation.asset(
            "assets/RiveAssets/shapes.riv",
          ),
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 30, sigmaY: 30),
              child: const SizedBox(),
            ),
          ),
          AnimatedPositioned(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            duration: const Duration(milliseconds: 260),
            child: const SafeArea(
              child: Padding(
                padding: EdgeInsets.fromLTRB(50,200,50,50),
                child:   Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                   children: [

                          Image(image: AssetImage(ImageAssets.startLogo))

                        ],
                      ),
                  //  ),


                ),
              ),
            ),
         // ),
        ],
      ),
    );
  }
}

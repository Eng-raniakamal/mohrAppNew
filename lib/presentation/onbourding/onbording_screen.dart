import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:mohr_hr/presentation/resources/assets_manager.dart';
import 'package:mohr_hr/presentation/resources/routes.dart';
import 'package:mohr_hr/presentation/widgets/components/animated_btn.dart';
//import 'package:mohr_hr/presentation/widgets/components/sign_in_dialog.dart';
import 'package:rive/rive.dart';
import 'package:mohr_hr/presentation/resources/strings_manager.dart';

import '../../application/app_prefs.dart';
import '../../application/di.dart';


class OnboadingScreen extends StatefulWidget {
  const OnboadingScreen({super.key});

  @override
  State<OnboadingScreen> createState() => _OnboadingScreenState();
}

class _OnboadingScreenState extends State<OnboadingScreen> {
  late RiveAnimationController _btnAnimationController;

  bool isShowSignInDialog = false;
  final AppPreferences _appPreferences = instance<AppPreferences>();

  _bind()
  {
    _appPreferences.setOnBoardingScreenViewed();


  }

  @override
  void initState() {
    _bind();
    _btnAnimationController = OneShotAnimation(
      "active",
      autoplay: false,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
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
            top: isShowSignInDialog ? -50 : 0,
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            duration: const Duration(milliseconds: 260),
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Spacer(),
                    SizedBox(
                      width: 260,
                      child: Column(
                        children:  const [

                           Center(child: Image(image: AssetImage(ImageAssets.startLogo)))
                          // Text(
                          //   "MOHR",
                          //   style: TextStyle(
                          //     fontSize: 60,
                          //     fontWeight: FontWeight.w700,
                          //     fontFamily: "Poppins",
                          //     height: 1.2,
                          //   ),
                          // ),
                          ,SizedBox(height: 16),
                          Text(AppStrings.spalshText
                           ,
                          ),
                        ],
                      ),
                    ),
                    const Spacer(flex: 2),
                    AnimatedBtn(
                      btnAnimationController: _btnAnimationController,
                      press: () {

                        _btnAnimationController.isActive = true;

                        Future.delayed(
                          const Duration(milliseconds: 800),
                              () {
                            setState(() {
                              isShowSignInDialog = true;
                            });
                            _appPreferences.isUserLoggedIn().then
                              ((isUserLoggedIn)=>{
             // if user is already logged go to the home directly
                               if(isUserLoggedIn)
                                 {
                                Navigator.of(context).pushReplacementNamed(Routes.HomeRoute)
                              }
                            else
                               {
                                Navigator.of(context).pushReplacementNamed(Routes.loginRoute)
                                }


                         //   Navigator.of(context).pushReplacementNamed(Routes.loginRoute);
                            // showCustomDialog(
                            //   context,
                            //   onValue: (_) {
                            //     setState(() {
                            //       isShowSignInDialog = false;
                            //     });
                            //   },
                            // );
                          },
                        );
                      },
    );}),
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 24),
                      child: Text(
                         ""),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

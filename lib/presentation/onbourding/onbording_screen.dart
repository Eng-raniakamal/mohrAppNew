import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:essmohr/presentation/resources/assets_manager.dart';
import 'package:essmohr/presentation/resources/routes.dart';
import 'package:essmohr/presentation/widgets/components/animated_btn.dart';
import 'package:rive/rive.dart 'as Rive;
import 'package:essmohr/presentation/resources/strings_manager.dart';
import 'package:toggle_switch/toggle_switch.dart';
import 'package:easy_localization/easy_localization.dart';
import '../../application/app_prefs.dart';
import '../../application/di.dart';


class OnboadingScreen extends StatefulWidget {
  const OnboadingScreen({super.key});
  @override
  State<OnboadingScreen> createState() => _OnboadingScreenState();
}

class _OnboadingScreenState extends State<OnboadingScreen> {
  late Rive.RiveAnimationController _btnAnimationController;

  bool isShowSignInDialog = false;
  final AppPreferences _appPreferences = instance<AppPreferences>();

  _bind()
  {
    _appPreferences.setOnBoardingScreenViewed();

  }


  @override
  void didChangeDependencies() {
    // _navigator = Navigator.of(context);
    _appPreferences.getLocal().then((local) => {context.setLocale(local)});
    super.didChangeDependencies();
  }

  @override
  void initState() {
    _bind();
    _btnAnimationController = Rive.OneShotAnimation(
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
          const Rive.RiveAnimation.asset(
            "assets/RiveAssets/shapes.riv",
          ),
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 30, sigmaY: 30),
              child: const SizedBox(),
            ),
          ),
          AnimatedPositioned(
            //top: isShowSignInDialog ? -50 : 0,
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
                      child: SingleChildScrollView(
                        child: Column(
                          children:   [

                             Center(child: Image(image: AssetImage(ImageAssets.startLogo)))

                            ,Text(AppStrings.spalshText.tr()

                            ),
                            SizedBox(height: 16),
                          ],
                        ),
                      ),
                    ),

                    const Spacer(flex: 1),
                ToggleSwitch(
                  minWidth: 90.0,
                  initialLabelIndex: 1,
                  cornerRadius: 20.0,
                  activeFgColor: Colors.white,
                  inactiveBgColor: Colors.grey,
                  inactiveFgColor: Colors.white,
                  totalSwitches: 2,
                  labels: ['English', 'عربى'],
                  activeBgColors: [[Colors.blue],[Colors.blue]],
                  onToggle: (index) {
                   // print('switched to: $index');
                    changeLanguage();
                  },),
                    const Spacer(flex: 1),
                    AnimatedBtn(
                      btnAnimationController: _btnAnimationController,
                      press: () {

                        _btnAnimationController.isActive = true;

                        Future.delayed(
                          const Duration(milliseconds: 800),
                              () {
                            setState(() {
                             // isShowSignInDialog = true;
                            });
                            _appPreferences.isUserLoggedIn().then
                              ((isUserLoggedIn)=>{
             // if user is already logged go to the home directly
                               if(isUserLoggedIn)
                                 {
                                Navigator.of(context).pushReplacementNamed(Routes.homeRoute)
                              }
                            else
                               {
                                Navigator.of(context).pushReplacementNamed(Routes.loginRoute)
                                }

                          },
                        );
                      },
    );}),
                    // const Padding(
                    //   padding: EdgeInsets.symmetric(vertical: 24),
                    //   child: Text(
                    //      ""),
                    // )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void changeLanguage() async{

    await _appPreferences.setLanguageChanged();
    Navigator.of(context).pushReplacementNamed(Routes.onboardingRoute);
    //Phoenix.rebirth(context);
  }
}

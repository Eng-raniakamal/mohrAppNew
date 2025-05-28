import 'package:essmohr/presentation/newDesign/core/configure/route/app_route.dart';
import 'package:essmohr/presentation/newDesign/core/utils/app_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    navTimer();
    super.initState();
  }

  navTimer() {
    Future.delayed(Duration(seconds: 3), () {
      if (mounted) {
        Navigator.pushReplacementNamed(
          context,
          AppRoute.onboarding,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.sizeOf(context).height;
    return Scaffold(
      body:
          h >= 100
              ? Center(
                child: SizedBox(
                  height: 168.h,
                  width: 145.w,
                  child: Image.asset(AppImage.logo),
                ),
              )
              : SizedBox(),
    );
  }
}

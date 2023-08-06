import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:mohr_hr/application/app_prefs.dart';
import 'package:mohr_hr/application/di.dart';
import 'package:mohr_hr/data/data_source/local_data_source.dart';
import 'package:mohr_hr/presentation/resources/assets_manager.dart';
import 'package:mohr_hr/presentation/resources/language_manager.dart';
import 'package:mohr_hr/presentation/resources/routes.dart';
import 'package:mohr_hr/presentation/resources/strings_manager.dart';
import 'package:mohr_hr/presentation/resources/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:flutter_svg/svg.dart';
import 'package:easy_localization/easy_localization.dart';

import 'dart:math' as math;

import 'package:mohr_hr/presentation/widgets/appbar_widget.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  AppPreferences _appPreferences = instance<AppPreferences>();
  LocalDataSource _localDataSource = instance<LocalDataSource>();

  @override
  Widget build(BuildContext context) {
   return ThemeSwitchingArea(
        child: Builder(
        builder: (context) =>
        Scaffold(
          appBar: buildAppBar(context),
          body:
        ListView(
          padding: const EdgeInsets.all(AppPadding.p8),
          children: [
            ListTile(
              title: Text(
                AppStrings.changeLanguage,
                  style: TextStyle(fontSize: 18)
               // style: Theme.of(context).textTheme.headline2,
              ).tr(),
              leading: SvgPicture.asset(ImageAssets.changeLangIc),
               trailing:
               Transform(
                alignment: Alignment.center,
                transform: Matrix4.rotationY(isRtl() ? math.pi : 0),
               child:
                SvgPicture.asset(ImageAssets.settingsRightArrowIc),
             ),
              onTap: () {
                changeLanguage();
              },
            ),
            ListTile(
              title: Text(
                  AppStrings.contact_us.tr(), style: TextStyle(fontSize: 18)
               // style: Theme.of(context).textTheme.headline2,
              ).tr(),
              leading: SvgPicture.asset(ImageAssets.contactUsIc),
              trailing:
              Transform(
                alignment: Alignment.center,
                transform: Matrix4.rotationY(isRtl() ? math.pi : 0),
                child:
               SvgPicture.asset(ImageAssets.settingsRightArrowIc),
               ),
              onTap: () {
                _contactUs();
              },
            ),

            ListTile(
              title: Text(
                AppStrings.logout.tr(),
                style: TextStyle(fontSize: 18),
              ).tr(),
              leading: SvgPicture.asset(ImageAssets.logoutIc),
              trailing:
              Transform(
                alignment: Alignment.center,
                transform: Matrix4.rotationY(isRtl() ? math.pi : 0),
                child:
                SvgPicture.asset(ImageAssets.settingsRightArrowIc),
             ),
              onTap: () {
                _logout();
              },
            )
          ],
        ),
        )
        ),

    );

  }

  bool isRtl() {
   // return true;
    return context.locale == ARABIC_LOCAL; // app is in arabic language
  }

  void changeLanguage() {

    _appPreferences.setLanguageChanged();
    Phoenix.rebirth(context);
    // restart to apply language changes
  }

  void _contactUs() {

  }



  void _logout() {
    _appPreferences.logout(); // clear login flag from app prefs
    _localDataSource.clearCache();
    Navigator.pushReplacementNamed(context, Routes.loginRoute);
  }
}

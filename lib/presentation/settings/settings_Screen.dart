import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:essmohr/application/app_prefs.dart';
import 'package:essmohr/application/di.dart';
import 'package:essmohr/data/data_source/local_data_source.dart';
import 'package:essmohr/presentation/resources/assets_manager.dart';
import 'package:essmohr/presentation/resources/language_manager.dart';
import 'package:essmohr/presentation/resources/routes.dart';
import 'package:essmohr/presentation/resources/strings_manager.dart';
import 'package:essmohr/presentation/resources/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:flutter_svg/svg.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:essmohr/presentation/resources/routes.dart';


import 'dart:math' as math;

import 'package:essmohr/presentation/widgets/appbar_widget.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  AppPreferences _appPreferences = instance<AppPreferences>();
  LocalDataSource _localDataSource = instance<LocalDataSource>();

  @override
  void  initState()
  {
    // _appPreferences.setLanguageChanged();
    // context.setLocale(ENGLISH_LOCAL);
    super.initState();

  }
  @override
  void didChangeDependencies() {
    // _navigator = Navigator.of(context);
    _appPreferences.getLocal().then((local) => {context.setLocale(local)});
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
   return  Localizations.override(
       context: context,
       locale:  context.locale,
       delegates: context.localizationDelegates,
    child:
     ThemeSwitchingArea(
        child: Builder(
        builder: (context) =>
        Scaffold(
          appBar: buildAppBar(context,AppStrings.settings.tr()),
          body:
                ListView(
          padding: const EdgeInsets.all(AppPadding.p8),
          children: [
            SizedBox(height: 20,),
            ListTile(

                  title: Text(
                    AppStrings.changeLanguage.tr(),
                      style: TextStyle(fontSize: 20)
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
                      AppStrings.contact_us.tr(), style: const TextStyle(fontSize: 18)
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


           ] ),

        ))

    ));

  }

  bool isRtl() {
   // return true;
    return context.locale == ARABIC_LOCAL;
    // app is in arabic language
  }

  void changeLanguage()
   async {
     await _appPreferences.setLanguageChanged();

       Navigator.of(context).pushReplacementNamed(Routes.settings);
    }

      //Phoenix.rebirth(context);;

    // restart to apply language changes


  void _contactUs() {

  }



  void _logout() {
    _appPreferences.logout(); // clear login flag from app prefs
    _localDataSource.clearCache();
    Navigator.pushReplacementNamed(context, Routes.loginRoute);
  }
 }
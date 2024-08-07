import 'package:flutter/material.dart';
import 'package:essmohr/application/app_prefs.dart';
import 'package:essmohr/application/rive_utils.dart';
import 'package:essmohr/domain/model/menu.dart';
import 'package:essmohr/presentation/User/editProfileScreen.dart';
import 'package:essmohr/presentation/home/home_Screen.dart';
import 'package:essmohr/presentation/resources/language_manager.dart';
import 'package:essmohr/presentation/resources/routes.dart';
import '../../../data/data_source/local_data_source.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:flutter_svg/svg.dart';
import 'package:easy_localization/easy_localization.dart';
import 'side_menu.dart';
import 'package:essmohr/application/di.dart';

class SideBar extends StatefulWidget {
  const SideBar({super.key});

  @override
  State<SideBar> createState() => _SideBarState();
}

class _SideBarState extends State<SideBar> {
  AppPreferences _appPreferences = instance<AppPreferences>();
  LocalDataSource _localDataSource = instance<LocalDataSource>();

  Menu selectedSideMenu = sidebarMenus.first;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        width: 288,
        height: double.infinity,
        decoration: const BoxDecoration(
          color: Color(0xFF17203A),
          borderRadius: BorderRadius.all(
            Radius.circular(30),
          ),
        ),
        child: DefaultTextStyle(
          style: const TextStyle(color: Colors.white),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 24, top: 32, bottom: 16),
                child: Text(
                  "Welcome to MOHR".toUpperCase(),
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(color: Colors.white70),
                ),
              ),
              ...sidebarMenus
                  .map((menu) => SideMenu(
                        menu: menu,
                        selectedMenu: selectedSideMenu,
                        press: () {
                          RiveUtils.chnageSMIBoolState(menu.rive.status!);
                          setState(() {
                            selectedSideMenu = menu;
                          });
                          switch (menu.title) {
                            case "HOME":
                              Navigator.of(context).pushReplacementNamed(Routes.homeRoute);
                              //MaterialPageRoute(builder: (_) => const Home());
                              break;
                            case "My profile":
                              Navigator.of(context).pushReplacementNamed(Routes.editProfileRoute);
                              MaterialPageRoute(builder: (_) =>  editProfileScreen());
                              break;
                            case "Change Language":
                              changeLanguage();
                              break;
                            case "Logout":
                              _logout();
                              break;

                          }
                        },
                        riveOnInit: (artboard) {
                          menu.rive.status = RiveUtils.getRiveInput(artboard,
                              stateMachineName: menu.rive.stateMachineName);
                        },
                      ))
                  .toList(),

            ],
          ),
        ),
      ),
    );
  }
  bool isRtl() {
    // return true;
    return context.locale == ARABIC_LOCAL; // app is in arabic language
  }

  void changeLanguage() {
    // i will apply localisation later
    _appPreferences.setLanguageChanged();
    Phoenix.rebirth(context);
    // restart to apply language changes
  }
  void _logout() {
    _appPreferences.logout(); // clear login flag from app prefs
    _localDataSource.clearCache();
    Navigator.pushReplacementNamed(context, Routes.loginRoute);
  }
}

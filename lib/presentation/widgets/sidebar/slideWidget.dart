import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:essmohr/application/constants.dart';
import 'package:essmohr/presentation/widgets/profile_widget.dart';
import 'package:rxdart/rxdart.dart';
import 'package:essmohr/presentation/resources/strings_manager.dart';
import 'package:essmohr/presentation/resources/colors.dart';
import 'package:essmohr/domain/model/navigationManu.dart';
import 'package:essmohr/presentation/widgets/sidebar/menu_item.dart';
import 'package:essmohr/presentation/resources/language_manager.dart';

import 'dart:math' as math;
import '../../../application/di.dart';
import '../../resources/routes.dart';


import 'package:flutter/material.dart';
import 'package:essmohr/application/app_prefs.dart';
import 'package:essmohr/application/di.dart';
import 'package:essmohr/data/data_source/local_data_source.dart';



class SideBar extends StatefulWidget {
  @override
  _SideBarState createState() => _SideBarState();
}

class _SideBarState extends State<SideBar> with SingleTickerProviderStateMixin<SideBar> {
  late AnimationController _animationController;
  late StreamController<bool> isSidebarOpenedStreamController;
  late Stream<bool> isSidebarOpenedStream;
  late StreamSink<bool> isSidebarOpenedSink;
  final _animationDuration = const Duration(milliseconds: 500);

  AppPreferences _appPreferences = instance<AppPreferences>();
  LocalDataSource _localDataSource = instance<LocalDataSource>();

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(vsync: this, duration: _animationDuration);
    isSidebarOpenedStreamController = PublishSubject<bool>();
    isSidebarOpenedStream = isSidebarOpenedStreamController.stream;
    isSidebarOpenedSink = isSidebarOpenedStreamController.sink;
  }

  @override
  void didChangeDependencies() {
    // _navigator = Navigator.of(context);
    _appPreferences.getLocal().then((local) => {context.setLocale(local)});
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _animationController.dispose();
    isSidebarOpenedStreamController.close();
    isSidebarOpenedSink.close();
    super.dispose();
  }

  void onIconPressed() {

    final animationStatus = _animationController.status;
    final isAnimationCompleted = animationStatus == AnimationStatus.completed;
    // if (isRtl()) {
    if (isAnimationCompleted) {
      isSidebarOpenedSink.add(false);
      _animationController.reverse();
    } else {
      isSidebarOpenedSink.add(true);
      _animationController.forward();
    }

  }
  bool isRtl() {
    // return true;
    return context.locale == ARABIC_LOCAL; // app is in arabic language
  }
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    // bool isRtl() {
    //   // return true;
    //   return context.locale == ARABIC_LOCAL; // app is in arabic language
    // }

     return BlocListener<NavigationBloc, NavigationStates>(
        listener: (BuildContext context, state) {
        // Check here if the state is unathenticated
        //Get.toNamed(); // Your login or initial page
      },
      child: StreamBuilder<bool>(
        initialData: false,
        stream: isSidebarOpenedStream,
        builder: (context, isSideBarOpenedAsync) {
          return
            AnimatedPositioned(
              duration: _animationDuration,
              top: 0,
              bottom: 0,
              left:
              isRtl() ?
              isSideBarOpenedAsync.data! ? 0 : screenWidth - 45 :
              isSideBarOpenedAsync.data! ? 0 : -screenWidth ,
              right:
              isRtl() ?
              isSideBarOpenedAsync.data! ? 0 : -screenWidth :
              isSideBarOpenedAsync.data! ? 0 : screenWidth - 45,
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      color:colorManager.primary,
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 100,
                          ),
                           ListTile(
                            title: Text(
                              AppStrings.Welcome.tr(),
                              style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w800),
                            ),
                            subtitle: Text(
                              AppStrings.Mohr.tr(),
                              style: const TextStyle(
                                color: Color(0xFF1BB5FD),
                                fontSize: 20,
                              ),
                            ),
                            // leading: CircleAvatar(
                            //   radius: 60,
                            //   child:Image.network(Constants.imagePath),
                             leading: ClipOval(
                                 child: SizedBox.fromSize(
                                   size: Size.fromRadius(30),
                                 child: Image.network(Constants.imagePath, fit: BoxFit.cover),

                                   ),
                            ),
                          ),
                          Divider(
                            height: 64,
                            thickness: 0.5,
                            color: Colors.white.withOpacity(0.3),
                            indent: 32,
                            endIndent: 32,
                          ),
                          MenuItems(
                            icon: Icons.home,
                            title: AppStrings.Home.tr(),
                            onTap: () {
                              onIconPressed();
                              Navigator.of(context).pushReplacementNamed(Routes.HomeRoute);
                             // BlocProvider.of<NavigationBloc>(context).add(NavigationEvents.HomePageClickedEvent);
                            },
                          ),
                          MenuItems(
                            icon: Icons.person,
                            title: AppStrings.profile.tr(),
                            onTap: () {
                              onIconPressed();
                              Navigator.of(context).pushReplacementNamed(Routes.employee);
                            },
                          ),
                          MenuItems(
                            icon: Icons.settings,
                            title: AppStrings.Settings.tr(),
                            onTap: () {
                              onIconPressed();
                              Navigator.of(context).pushReplacementNamed(Routes.settings);
                              },
                          ),

                          MenuItems(
                            icon: Icons.password,
                            title:AppStrings.resetPassword.tr(),
                            onTap: () {
                              onIconPressed();
                              Navigator.of(context).pushReplacementNamed(Routes.changePassword);
                            },
                          ),

                          MenuItems(
                            icon: Icons.logout,
                            title: AppStrings.logout.tr(),
                            onTap: () {
                              onIconPressed();
                              _appPreferences.logout(); // clear login flag from app prefs
                              _localDataSource.clearCache();
                              Navigator.pushReplacementNamed(context, Routes.loginRoute);
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment(0, -0.9),
                    child: GestureDetector(
                      onTap: () {
                        onIconPressed();
                      },
                       child: Transform(
                         alignment: Alignment.center,
                         transform: Matrix4.rotationY(isRtl() ? math.pi : 0),
                        child: ClipPath(
                          clipper: CustomMenuClipper(),
                          child: Container(
                            width: 30,
                            height: 90,
                           // color: const Color(0xFF262AAA),
                            color:colorManager.primary,
                            alignment: Alignment.centerLeft,
                            child: AnimatedIcon(
                              progress: _animationController.view,
                              icon: AnimatedIcons.menu_close,
                              //color: const Color(0xFF1BB5FD),
                              color: colorManager.white,
                              size: 25,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
           // ),
          );
        },
      ),
    );
  }
  Widget _getImageWidget() {
    String? URLimage ;
      Constants.imagePath=URLimage!;
      return ProfileWidget(
          imagePath: URLimage,
          isEdit: false,
          onClicked: () {
          }

      );
    }

}

class CustomMenuClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Paint paint = Paint();
    paint.color = Colors.white;

    final width = size.width;
    final height = size.height;

    Path path = Path();
    path.moveTo(0, 0);
    path.quadraticBezierTo(0, 8, 10, 16);
    path.quadraticBezierTo(width - 1, height / 2 - 20, width, height / 2);
    path.quadraticBezierTo(width + 1, height / 2 + 20, 10, height - 16);
    path.quadraticBezierTo(0, height - 8, 0, height);
    path.close();
    return path;

  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}

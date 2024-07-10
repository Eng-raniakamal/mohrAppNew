import 'package:flutter/material.dart';
//import 'package:essmohr/translation.dart';

class Styles {
 // static TextDirection get textDirection =>
 //     Translations.instance!.isRTL ? TextDirection.rtl : TextDirection.ltr;
}

DecorationImage errorBackgroundImage = const DecorationImage(
  image: ExactAssetImage(
    'assets/error_bg.jpg',
  ),
  fit: BoxFit.cover,
);

DecorationImage warningBackgroundImage = const DecorationImage(
  image: ExactAssetImage(
    'assets/warning.jpg',
  ),
  fit: BoxFit.cover,
);

DecorationImage welcomeBackgroundImage = const DecorationImage(
  image: ExactAssetImage(
    'assets/welcome.jpg',
  ),
  fit: BoxFit.cover,
);

DecorationImage loginBackgroundImage = const DecorationImage(
  image: ExactAssetImage(
    'assets/login.jpg',
  ),
  fit: BoxFit.cover,
);

DecorationImage sideMenuBackgroudImage = DecorationImage(
  image: const ExactAssetImage(
    'assets/side_menu_backgroud.jpg',
  ),
  fit: BoxFit.fill,
  colorFilter:
  ColorFilter.mode(Colors.black.withOpacity(.45), BlendMode.srcOver),
);

ExactAssetImage logoImage2 = const ExactAssetImage('assets/logo-03.png');

DecorationImage logoImage = const DecorationImage(
  image: ExactAssetImage('assets/logo-03.png'),
  fit: BoxFit.none,
);

DecorationImage cityImage = const DecorationImage(
  image: ExactAssetImage('assets/city.jpg'),
  fit: BoxFit.none,
);

DecorationImage profileMaleImage = const DecorationImage(
  image: ExactAssetImage('assets/profile_male.png'),
  fit: BoxFit.scaleDown,
);

final Container profileMaleImageContainer = Container(
  height: 100,
  width: 100,
  decoration: BoxDecoration(
    borderRadius: const BorderRadius.all(Radius.circular(120.0)),
    image: profileMaleImage,
  ),
);

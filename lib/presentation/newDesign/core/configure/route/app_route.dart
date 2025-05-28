import 'package:essmohr/presentation/newDesign/core/utils/import_file.dart';
import 'package:essmohr/presentation/newDesign/feature/home/presentation/home_screen.dart';
import 'package:essmohr/presentation/newDesign/feature/layout/presentation/screen/layout_screen.dart';
import 'package:essmohr/presentation/newDesign/feature/login/presentation/screen/login_screen.dart';
import 'package:essmohr/presentation/newDesign/feature/onboarding/presentation/screen/onboarding_screen.dart';
import 'package:essmohr/presentation/newDesign/feature/salary/presentation/screen/detail_salary_screen.dart';
import 'package:essmohr/presentation/newDesign/feature/splash/presentation/screen/splash_screen.dart';

class AppRoute {
  static const String splash = '/splash';
  static const String onboarding = '/onboarding';
  static const String login = '/login';
  static const String home = '/';
  static const String layout = '/layout';

  static const String detailSalary = '/detailSalary';

  static Future<Route> onGenerateRoute(routSetting) async {

    switch (routSetting.name) {
      case AppRoute.home:
        return goScreen(nameScreen: LayoutScreen(), settings: routSetting);
      case AppRoute.splash:
        return goScreen(nameScreen: SplashScreen(), settings: routSetting);
      case AppRoute.onboarding:
        return goScreen(nameScreen: Onboarding2Screen(), settings: routSetting);
      case AppRoute.login:
        return goScreen(nameScreen: LoginScreen(), settings: routSetting);
      case AppRoute.layout:
        return goScreen(nameScreen: LayoutScreen(), settings: routSetting);
      // case AppRoute.detailSalary:
      //   return goScreen(nameScreen: DetailSalaryScreen(salaryItem: null,), settings: routSetting);

      default:
        return MaterialPageRoute(builder: (context) => _defaultScreen());
    }
  }

  static MaterialPageRoute goScreen({
    required Widget nameScreen,
    RouteSettings? settings,
  }) {
    return MaterialPageRoute(
      builder:
          (context) => Directionality(
            textDirection: TextDirection.rtl,
            child: nameScreen,
          ),
      settings: settings,
    );
  }

  static _defaultScreen() {
    return Scaffold(body: Center(child: Text("Default screen")));
  }
}

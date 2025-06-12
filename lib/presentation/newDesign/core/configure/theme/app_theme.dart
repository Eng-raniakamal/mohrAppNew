import 'package:essmohr/presentation/newDesign/core/configure/theme/app_text_theme.dart';
import 'package:essmohr/presentation/newDesign/core/configure/theme/app_theme_color_scheme.dart';
import 'package:essmohr/presentation/newDesign/core/utils/import_file.dart';

class AppTheme {
  static ThemeData themeLight() => ThemeData(

    brightness: Brightness.light,
    fontFamily: 'IBMP',
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: _appBarTheme(),
    popupMenuTheme: _popupMenuTheme(),
    textTheme: AppTextTheme.textTheme(),
    colorScheme: AppThemeColorScheme.lightColorScheme(),
    inputDecorationTheme: InputDecorationTheme(
      hintStyle: TextStyle(color: AppThemeColorScheme.lightColorScheme().shadow),
    ),
  );

  static AppBarTheme? _appBarTheme() {
    return AppBarTheme(
      backgroundColor: Colors.white,
      elevation: 0,
      scrolledUnderElevation: 0,
    );
  }

  static PopupMenuThemeData? _popupMenuTheme() {
    return PopupMenuThemeData(
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.r),
        side: BorderSide(color: Colors.grey.shade300, width: 1.0),
      ),
      textStyle: AppTextStyle.iBMP16w500,
      menuPadding: EdgeInsets.zero,
    );
  }
}


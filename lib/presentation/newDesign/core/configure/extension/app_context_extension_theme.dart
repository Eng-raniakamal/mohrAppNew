import 'package:flutter/material.dart';

extension AppContextensiontExtTheme on BuildContext {
  ThemeData get theme => Theme.of(this);
  TextTheme get text => theme.textTheme;
  ColorScheme get color => theme.colorScheme;

  double get width => MediaQuery.sizeOf(this).width;
  double get height => MediaQuery.sizeOf(this).height;
}

extension DialogExtensions on BuildContext {
  void showErrorDialog(String message) {
    showDialog(
      context: this,
      builder: (context) => AlertDialog(
        backgroundColor: color.background,
        title: Text("خطأ", style: text.titleLarge?.copyWith(color: color.error)),
        content: Text(message, style: text.bodyMedium),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(this),
            child: Text("حسناً", style: text.labelLarge?.copyWith(color: color.primary)),
          ),
        ],
      ),
    );
  }

  void showSuccessDialog(String message) {
    showDialog(
      context: this,
      builder: (context) => AlertDialog(
        backgroundColor: color.background,
        title: Text("نجاح", style: text.titleLarge?.copyWith(color: color.primary)),
        content: Text(message, style: text.bodyMedium),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(this),
            child: Text("موافق", style: text.labelLarge?.copyWith(color: color.primary)),
          ),
        ],
      ),
    );
  }

  void showWarningDialog(String message) {
    showDialog(
      context: this,
      builder: (context) => AlertDialog(
        backgroundColor: color.background,
        title: Text("تحذير", style: text.titleLarge?.copyWith(color: color.tertiary)),
        content: Text(message, style: text.bodyMedium),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(this),
            child: Text("فهمت", style: text.labelLarge?.copyWith(color: color.primary)),
          ),
        ],
      ),
    );
  }
}


extension AppContextSnackExtension on BuildContext {
  void showSnackBar(
      String message, {
        Color? backgroundColor,
        Duration duration = const Duration(seconds: 3),
      }) {
    final snackBar = SnackBar(
      content: Text(message),
      backgroundColor: backgroundColor ?? Theme.of(this).colorScheme.error,
      duration: duration,
    );

    ScaffoldMessenger.of(this).clearSnackBars(); // لو فيه قديم
    ScaffoldMessenger.of(this).showSnackBar(snackBar);
  }
}

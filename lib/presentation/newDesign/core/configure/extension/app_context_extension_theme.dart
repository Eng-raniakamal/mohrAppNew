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



extension ContextExtensions on BuildContext {
  void showLoadingDialog() {
    showDialog(
      context: this,
      // barrierDismissible: false,
      builder: (_) => const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }

  void hideLoadingDialog() {
    if (Navigator.canPop(this)) {
      Navigator.of(this, rootNavigator: true).pop();
    }
  }

  void viewSnackBar({required String message, Color? color}) {
    ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: color ?? Colors.black,
        duration: const Duration(seconds: 2),
      ),
    );
  }


  void viewErrorDialog(String message) {
    showDialog(
      context: this,
      builder: (context) => AlertDialog(
        title: const Text("حدث خطأ"),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text("موافق"),
          ),
        ],
      ),
    );
  }

}


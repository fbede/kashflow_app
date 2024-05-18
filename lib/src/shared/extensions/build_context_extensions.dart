import 'package:flutter/material.dart';

extension BuildContextExt on BuildContext {
  EdgeInsets get viewInsets => MediaQuery.viewInsetsOf(this);
  double getScreenWidth() => MediaQuery.sizeOf(this).width;

  bool get isPhone => MediaQuery.sizeOf(this).width < 600;

  bool get isTablet =>
      MediaQuery.sizeOf(this).width > 500 &&
      MediaQuery.sizeOf(this).width < 840;

  bool get isDesktop => MediaQuery.sizeOf(this).width > 640;

  ThemeData get theme => Theme.of(this);
  ColorScheme get colorScheme => Theme.of(this).colorScheme;
  TextTheme get textTheme => Theme.of(this).textTheme;

  void showSnackBar(String text) {
    ScaffoldMessenger.of(this).showSnackBar(SnackBar(content: Text(text)));
  }

  void showErrorSnackBar(String text) {
    ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(
        content: Text(text),
        backgroundColor: Theme.of(this).colorScheme.error,
        closeIconColor: Theme.of(this).colorScheme.error,
      ),
    );
  }
}

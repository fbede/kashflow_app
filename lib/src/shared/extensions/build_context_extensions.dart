import 'package:flutter/material.dart';

extension BuildContextExt on BuildContext {
  EdgeInsets get viewInsets => MediaQuery.viewInsetsOf(this);
  Size get screenSize => MediaQuery.sizeOf(this);

  bool get isPhone => screenSize.width < 600;
  bool get isTablet => screenSize.width == 600 && screenSize.width < 840;
  bool get isDesktop => screenSize.width > 840;

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
        backgroundColor: theme.colorScheme.error,
        closeIconColor: theme.colorScheme.error,
      ),
    );
  }
}

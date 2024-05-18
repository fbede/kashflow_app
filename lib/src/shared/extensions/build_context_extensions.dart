import 'package:flutter/material.dart';

extension BuildContextExt on BuildContext {
  EdgeInsets get viewInsets => MediaQuery.of(this).viewInsets;
  double getScreenWidth() => MediaQuery.of(this).size.width;

  bool get isPhone => MediaQuery.of(this).size.width < 500;

  bool get isTablet =>
      MediaQuery.of(this).size.width > 500 &&
      MediaQuery.of(this).size.width < 1100;

  bool get isDesktop => MediaQuery.of(this).size.width > 1100;

  Widget buildResponsiveScreen({
    required Widget mobileScreen,
    required Widget desktopScreen,
    Widget? tabletScreen,
  }) {
    if (isPhone) {
      return mobileScreen;
    }

    if (isTablet && tabletScreen != null) {
      return tabletScreen;
    }

    return desktopScreen;
  }
}

extension ThemeUtils on BuildContext {
  ThemeData get theme => Theme.of(this);
  ColorScheme get colorScheme => Theme.of(this).colorScheme;
  TextTheme get textTheme => Theme.of(this).textTheme;
}

extension OtherUtils on BuildContext {
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

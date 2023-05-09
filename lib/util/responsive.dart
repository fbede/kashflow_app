import 'package:flutter/material.dart';

extension BuildContextUtils on BuildContext {
  double getScreenWidth() => MediaQuery.of(this).size.width;

  ThemeData theme() => Theme.of(this);

  void showSnackBar(String text) {
    ScaffoldMessenger.of(this).showSnackBar(SnackBar(content: Text(text)));
  }

  void showErrorSnackBar(String text) {
    ScaffoldMessenger.of(this).showSnackBar(SnackBar(
      content: Text(text),
      backgroundColor: Theme.of(this).colorScheme.error,
      closeIconColor: Theme.of(this).colorScheme.error,
    ));
  }

  bool isPhone() => MediaQuery.of(this).size.width < 500;

  bool isTablet() =>
      MediaQuery.of(this).size.width > 500 &&
      MediaQuery.of(this).size.width < 1100;

  bool isDesktop() => MediaQuery.of(this).size.width > 1100;

  Widget buildResponsiveScreen({
    required Widget mobileScreen,
    Widget? tabletScreen,
    required Widget desktopScreen,
  }) {
    if (isPhone()) return mobileScreen;

    if (isTablet() && tabletScreen != null) return tabletScreen;

    return desktopScreen;
  }
}

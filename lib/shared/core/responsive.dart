import 'package:flutter/material.dart';

extension ResponsiveUtils on BuildContext {
  double getScreenWidth() => MediaQuery.of(this).size.width;

  bool isPhone() => MediaQuery.of(this).size.width < 500;

  bool isTablet() =>
      MediaQuery.of(this).size.width > 500 &&
      MediaQuery.of(this).size.width < 1100;

  bool isDesktop() => MediaQuery.of(this).size.width > 1100;

  Widget buildResponsiveScreen({
    required Widget mobileScreen,
    required Widget desktopScreen,
    Widget? tabletScreen,
  }) {
    if (isPhone()) return mobileScreen;

    if (isTablet() && tabletScreen != null) return tabletScreen;

    return desktopScreen;
  }
}

extension ThemeUtils on BuildContext {
  ThemeData theme() => Theme.of(this);

  Color tooltipTextColor() {
    if (theme().brightness == Brightness.light) {
      return Colors.white;
    } else {
      return Colors.black;
    }
  }
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

import 'package:flutter/material.dart';

Widget buildResponsiveScreen({
  required BuildContext context,
  required Widget mobileScreen,
  required Widget tabletScreen,
  Widget? desktopScreen,
}) {
  if (MediaQuery.of(context).size.width < 500) {
    return mobileScreen;
  }
  if (MediaQuery.of(context).size.width > 500 &&
      MediaQuery.of(context).size.width < 1100) {
    return tabletScreen;
  }
  if (MediaQuery.of(context).size.width > 1100 && desktopScreen == null) {
    return tabletScreen;
  }
  return desktopScreen!;
}

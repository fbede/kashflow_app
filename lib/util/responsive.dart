import 'package:flutter/material.dart';

double getScreenWidth(BuildContext context) {
  return MediaQuery.of(context).size.width;
}

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

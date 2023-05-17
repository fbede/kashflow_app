import 'package:flutter/material.dart';

class CustomComponents {
  ///creates an appbar without a back button so that the widget can be used as a component in desktop view
  static AppBar settingsAppbarWithoutBackButton({required String title}) => AppBar(
      title: Text(title),
      centerTitle: true,
      automaticallyImplyLeading: false,
    );

  static AppBar settingsAppbar({required String title}) => AppBar(
      title: Text(title),
      centerTitle: true,
    );
}

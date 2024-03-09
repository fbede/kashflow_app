import 'package:flutter/material.dart';

import '../responsive.dart';

extension BuildContextExtension on BuildContext {
  NavigationBarThemeData get navigationBarThemeData => theme.navigationBarTheme
      .copyWith(labelTextStyle: _navigationBarTextStyle);

  MaterialStateTextStyle get _navigationBarTextStyle =>
      MaterialStateTextStyle.resolveWith((states) {
        if (states.contains(MaterialState.selected)) {
          return const TextStyle(fontWeight: FontWeight.w700);
        }
        return const TextStyle();
      });
}

import 'package:flutter/material.dart';

import 'package:kashflow/util/hidden_strings.dart';

import 'color_scheme.dart';
export 'color_scheme.dart';

final lightThemeData = ThemeData(
  fontFamily: HiddenStrings.FONT_FAMILY,
  colorScheme: newLightColorScheme,
  useMaterial3: true,
  dividerTheme: _lightDividerTheme,
  tabBarTheme: _lightTabBarTheme,
  scaffoldBackgroundColor: newLightColorScheme.background,
  dialogBackgroundColor: newLightColorScheme.surface,
);
final darkThemeData = ThemeData(
  fontFamily: HiddenStrings.FONT_FAMILY,
  colorScheme: newDarkColorScheme,
  useMaterial3: true,
  dividerTheme: _darkDividerTheme,
  scaffoldBackgroundColor: newDarkColorScheme.background,
  dialogBackgroundColor: newDarkColorScheme.surface,
);

final _lightTabBarTheme = TabBarTheme(
  labelColor: lightColorScheme.primary,
);

final _lightDividerTheme = DividerThemeData(
  color: newLightColorScheme.onBackground.withOpacity(0.5),
  thickness: 0.5,
);

final _darkDividerTheme = DividerThemeData(
  color: newDarkColorScheme.onBackground.withOpacity(0.5),
  thickness: 0.5,
);

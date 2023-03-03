import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'color_scheme.dart';
export 'color_scheme.dart';

final lightThemeData = ThemeData(
  textTheme: GoogleFonts.josefinSansTextTheme().apply(
    displayColor: newLightColorScheme.onBackground,
    bodyColor: newLightColorScheme.onBackground,
  ),
  colorScheme: newLightColorScheme,
  useMaterial3: true,
  dividerTheme: _lightDividerTheme,
  tabBarTheme: _lightTabBarTheme,
  scaffoldBackgroundColor: newLightColorScheme.background,
  dialogBackgroundColor: newLightColorScheme.surface,
);
final darkThemeData = ThemeData(
  textTheme: GoogleFonts.josefinSansTextTheme().apply(
    displayColor: newDarkColorScheme.onBackground,
    bodyColor: newDarkColorScheme.onBackground,
  ),
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

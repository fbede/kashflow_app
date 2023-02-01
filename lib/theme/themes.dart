import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'color_scheme.dart';
export 'color_scheme.dart';

final lightThemeData = ThemeData(
  fontFamily: GoogleFonts.mPlusRounded1c().fontFamily,
  colorScheme: lightColorScheme,
  useMaterial3: true,
  appBarTheme: _lightAppBarTheme,
  tabBarTheme: _lightTabBarTheme,
  scaffoldBackgroundColor: lightColorScheme.background,
  dialogBackgroundColor: lightColorScheme.surface,
);
final darkThemeData = ThemeData(
  fontFamily: GoogleFonts.mPlusRounded1c().fontFamily,
  colorScheme: darkColorScheme,
  useMaterial3: true,
  scaffoldBackgroundColor: darkColorScheme.background,
  dialogBackgroundColor: darkColorScheme.surface,
);

final _lightAppBarTheme = AppBarTheme(
  titleTextStyle: TextStyle(
    color: lightColorScheme.primary,
    fontSize: 28,
  ),
);

final _lightTabBarTheme = TabBarTheme(
  labelColor: lightColorScheme.primary,
);

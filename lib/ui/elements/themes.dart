import 'package:flutter/material.dart';

import 'package:kashflow/util/hidden_strings.dart';

import 'color_scheme.dart';
export 'color_scheme.dart';

final lightThemeData = ThemeData(
  fontFamily: DevStringKeys.FONT_FAMILY,
  colorScheme: newLightColorScheme,
  useMaterial3: true,
  dividerTheme: _dividerTheme,
  scaffoldBackgroundColor: newLightColorScheme.background,
  dialogBackgroundColor: newLightColorScheme.surface,
  snackBarTheme: SnackBarThemeData(
    behavior: SnackBarBehavior.floating,
    contentTextStyle: TextStyle(color: newLightColorScheme.onError),
  ),
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    foregroundColor: newLightColorScheme.onPrimary,
    backgroundColor: newLightColorScheme.primary,
    extendedTextStyle: TextStyle(color: newLightColorScheme.onPrimary),
  ),
  filledButtonTheme: FilledButtonThemeData(
    style: FilledButton.styleFrom(
      foregroundColor: newLightColorScheme.onPrimary,
      backgroundColor: newLightColorScheme.primary,
    ),
  ),
  textButtonTheme: _textButtonTheme,
  indicatorColor: newLightColorScheme.onBackground,
  inputDecorationTheme: InputDecorationTheme(
    fillColor: newLightColorScheme.outlineVariant,
    focusColor: newLightColorScheme.onBackground,
  ),
  textSelectionTheme: TextSelectionThemeData(
    cursorColor: newLightColorScheme.onBackground,
  ),
);

final darkThemeData = ThemeData(
  fontFamily: DevStringKeys.FONT_FAMILY,
  colorScheme: newDarkColorScheme,
  useMaterial3: true,
  dividerTheme: _dividerTheme,
  scaffoldBackgroundColor: newDarkColorScheme.background,
  dialogBackgroundColor: newDarkColorScheme.surface,
  snackBarTheme: SnackBarThemeData(
    behavior: SnackBarBehavior.floating,
    contentTextStyle: TextStyle(color: newDarkColorScheme.onError),
  ),
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    foregroundColor: newDarkColorScheme.onPrimary,
    backgroundColor: newDarkColorScheme.primary,
    extendedTextStyle: TextStyle(color: newDarkColorScheme.onPrimary),
  ),
  filledButtonTheme: FilledButtonThemeData(
    style: FilledButton.styleFrom(
      foregroundColor: newDarkColorScheme.onPrimary,
      backgroundColor: newDarkColorScheme.primary,
    ),
  ),
  textButtonTheme: _textButtonTheme,
  indicatorColor: newDarkColorScheme.onBackground,
  inputDecorationTheme: InputDecorationTheme(
    fillColor: newDarkColorScheme.outlineVariant,
    focusColor: newDarkColorScheme.onBackground,
  ),
  textSelectionTheme: TextSelectionThemeData(
    cursorColor: newDarkColorScheme.onBackground,
  ),
);

final _dividerTheme = DividerThemeData(
  color: newLightColorScheme.outline,
  thickness: 0.5,
);

final _textButtonTheme = TextButtonThemeData(
  style: TextButton.styleFrom(
    alignment: Alignment.center,
    textStyle: TextStyle(
      fontWeight: FontWeight.bold,
    ),
  ),
);

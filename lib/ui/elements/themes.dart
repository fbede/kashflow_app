import 'package:flex_color_scheme/flex_color_scheme.dart';
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

// Made for FlexColorScheme version 7.0.4. Make sure you
// use same or higher package version, but still same major version.
// If you use a lower version, some properties may not be supported.
// In that case remove them after copying this theme to your app.
final lightFlexTheme = FlexThemeData.light(
  lightIsWhite: true,
  colors: const FlexSchemeColor(
    primary: Color(0xff00ff00),
    primaryContainer: Color(0xffd0e4ff),
    secondary: Color(0xffffd700),
    secondaryContainer: Color(0xffffdbcf),
    tertiary: Color(0xffffd700),
    tertiaryContainer: Color(0xff95f0ff),
    appBarColor: Color(0xffffdbcf),
    error: Color(0xffb00020),
  ),
  surfaceMode: FlexSurfaceMode.levelSurfacesLowScaffold,
  blendLevel: 7,
  subThemesData: const FlexSubThemesData(
    useM2StyleDividerInM3: true,
    inputDecoratorIsFilled: false,
    inputDecoratorUnfocusedBorderIsColored: false,
    tabBarDividerColor: Color(0x00000000),
    navigationBarIndicatorOpacity: 0.00,
    navigationRailUseIndicator: false,
    navigationRailIndicatorOpacity: 0.00,
  ),
  keyColors: const FlexKeyColors(
    useSecondary: true,
    useTertiary: true,
  ),
  tones: FlexTones.vivid(Brightness.light).onMainsUseBW().onSurfacesUseBW(),
  visualDensity: FlexColorScheme.comfortablePlatformDensity,
  useMaterial3: true,
  // To use the playground font, add GoogleFonts package and uncomment
  // fontFamily: GoogleFonts.notoSans().fontFamily,
);
final darkFlexTheme = FlexThemeData.dark(
  darkIsTrueBlack: true,
  colors: const FlexSchemeColor(
    primary: Color(0xff00ff00),
    primaryContainer: Color(0xff00325b),
    secondary: Color(0xffffd700),
    secondaryContainer: Color(0xff872100),
    tertiary: Color(0xffffd700),
    tertiaryContainer: Color(0xff004e59),
    appBarColor: Color(0xff872100),
    error: Color(0xffcf6679),
  ),
  surfaceMode: FlexSurfaceMode.levelSurfacesLowScaffold,
  blendLevel: 13,
  subThemesData: const FlexSubThemesData(
    useM2StyleDividerInM3: true,
    inputDecoratorIsFilled: false,
    inputDecoratorUnfocusedBorderIsColored: false,
    tabBarDividerColor: Color(0x00000000),
    navigationBarIndicatorOpacity: 0.00,
    navigationRailUseIndicator: false,
    navigationRailIndicatorOpacity: 0.00,
  ),
  keyColors: const FlexKeyColors(
    useSecondary: true,
    useTertiary: true,
  ),
  tones: FlexTones.vivid(Brightness.dark).onMainsUseBW().onSurfacesUseBW(),
  visualDensity: FlexColorScheme.comfortablePlatformDensity,
  useMaterial3: true,
  // To use the Playground font, add GoogleFonts package and uncomment
  // fontFamily: GoogleFonts.notoSans().fontFamily,
);
// If you do not have a themeMode switch, uncomment this line
// to let the device system mode control the theme mode:
// themeMode: ThemeMode.system,

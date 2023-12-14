import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';

import '../gen/fonts.gen.dart';

final lightTheme = FlexThemeData.light(
  colors: const FlexSchemeColor(
    primary: Color(0xff008000),
    primaryContainer: Color(0xffd0e4ff),
    secondary: Color(0xffffd700),
    secondaryContainer: Color(0xffffdbcf),
    tertiary: Color(0xff008000),
    tertiaryContainer: Color(0xff95f0ff),
    appBarColor: Color(0xffffdbcf),
    error: Color(0xffb00020),
  ),
  usedColors: 1,
  lightIsWhite: true,
  subThemesData: _subThemesData,
  keyColors: const FlexKeyColors(),
  tones: FlexTones.vivid(Brightness.light),
  visualDensity: FlexColorScheme.comfortablePlatformDensity,
  useMaterial3: true,
  fontFamily: FontFamily.poppins,
  primaryTextTheme: _textTheme,
  textTheme: _textTheme,
);

final flexDarkTheme = FlexThemeData.dark(
  colors: const FlexSchemeColor(
    primary: Color(0xff008000),
    primaryContainer: Color(0xffd0e4ff),
    secondary: Color(0xffffd700),
    secondaryContainer: Color(0xffffdbcf),
    tertiary: Color(0xff008000),
    tertiaryContainer: Color(0xff95f0ff),
    appBarColor: Color(0xffffdbcf),
    error: Color(0xffb00020),
  ),
  usedColors: 1,
  appBarStyle: FlexAppBarStyle.scaffoldBackground,
  darkIsTrueBlack: true,
  subThemesData: _subThemesData,
  keyColors: const FlexKeyColors(),
  tones: FlexTones.vivid(Brightness.dark).onMainsUseBW().onSurfacesUseBW(),
  visualDensity: FlexColorScheme.comfortablePlatformDensity,
  useMaterial3: true,
  fontFamily: FontFamily.poppins,
  primaryTextTheme: _textTheme,
  textTheme: _textTheme,
);

const _subThemesData = FlexSubThemesData(
  sliderValueTinted: true,
  inputDecoratorUnfocusedBorderIsColored: false,
  navigationBarSelectedLabelSize: 14,
  navigationBarUnselectedLabelSize: 12,
  navigationBarSelectedLabelSchemeColor: SchemeColor.onSurface,
  navigationBarMutedUnselectedLabel: false,
  navigationBarSelectedIconSchemeColor: SchemeColor.onPrimary,
  navigationBarMutedUnselectedIcon: false,
  navigationBarIndicatorOpacity: 1,
);

const _textTheme = TextTheme(
  displayLarge: _displayStyle,
  displayMedium: _displayStyle,
  displaySmall: _displayStyle,
  headlineLarge: _headlineStyle,
  headlineMedium: _headlineStyle,
  headlineSmall: _headlineStyle,
  titleLarge: _titleStyle,
  titleMedium: _titleStyle,
  titleSmall: _titleStyle,
  bodyLarge: _bodyStyle,
  bodyMedium: _bodyStyle,
  bodySmall: _bodyStyle,
  labelLarge: _labelStyle,
  labelMedium: _labelStyle,
  labelSmall: _labelStyle,
);

const _displayStyle = TextStyle(fontWeight: FontWeight.w900);
const _headlineStyle = TextStyle(fontWeight: FontWeight.w100);
const _titleStyle = TextStyle(fontWeight: FontWeight.w700);
const _bodyStyle = TextStyle(fontWeight: FontWeight.w300);
const _labelStyle = TextStyle(fontWeight: FontWeight.w500);

const slowGlobalAnimationDuration = Duration(milliseconds: 1000);
const midGlobalAnimationDuration = Duration(milliseconds: 500);
const fastGlobalAnimationDuration = Duration(milliseconds: 250);

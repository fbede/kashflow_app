import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';

import '../gen/fonts.gen.dart';

ThemeData lightTheme({required bool useDeepBlacks}) => FlexThemeData.light(
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
      lightIsWhite: useDeepBlacks,
      subThemesData: _subThemesData,
      keyColors: const FlexKeyColors(),
      tones: FlexTones.vivid(Brightness.light),
      visualDensity: FlexColorScheme.comfortablePlatformDensity,
      useMaterial3: true,
      fontFamily: FontFamily.poppins,
      fontFamilyFallback: [FontFamily.notoSans],
      primaryTextTheme: _textTheme,
      textTheme: _textTheme,
    );

ThemeData darkTheme({required bool useDeepBlacks}) => FlexThemeData.dark(
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
      darkIsTrueBlack: useDeepBlacks,
      subThemesData: _subThemesData,
      keyColors: const FlexKeyColors(),
      tones:
          FlexTones.vivid(Brightness.dark), //.onMainsUseBW().onSurfacesUseBW(),
      visualDensity: FlexColorScheme.comfortablePlatformDensity,
      useMaterial3: true,
      fontFamily: FontFamily.poppins,
      fontFamilyFallback: [FontFamily.notoSans],
      primaryTextTheme: _textTheme,
      textTheme: _textTheme,
    );

const _subThemesData = FlexSubThemesData(
  sliderValueTinted: true,
  inputDecoratorUnfocusedBorderIsColored: false,
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

const _displayStyle = TextStyle(fontWeight: FontWeight.w700);
const _headlineStyle = TextStyle(fontWeight: FontWeight.w300);
const _titleStyle = TextStyle(fontWeight: FontWeight.w600);
const _bodyStyle = TextStyle(fontWeight: FontWeight.w400);
const _labelStyle = TextStyle(fontWeight: FontWeight.w500);

const slowGlobalAnimationDuration = Duration(milliseconds: 1000);
const midGlobalAnimationDuration = Duration(milliseconds: 500);
const fastGlobalAnimationDuration = Duration(milliseconds: 250);

// Theme config for FlexColorScheme version 7.3.x. Make sure you use
// same or higher package version, but still same major version. If you
// use a lower package version, some properties may not be supported.
// In that case remove them after copying this theme to your app.
ThemeData lightThemeNew({required bool useDeepBlacks}) => FlexThemeData.light(
      colors: const FlexSchemeColor(
        primary: Color(0xff003333),
        primaryContainer: Color(0xffd0e4ff),
        secondary: Color(0xff99ff00),
        secondaryContainer: Color(0xffffdbcf),
        tertiary: Color(0xff009933),
        tertiaryContainer: Color(0xff95f0ff),
        appBarColor: Color(0xffffdbcf),
        error: Color(0xffb00020),
      ),
      usedColors: 7,
      surfaceMode: FlexSurfaceMode.levelSurfacesLowScaffold,
      blendLevel: 7,
      lightIsWhite: useDeepBlacks,
      subThemesData: _newSubThemeData2,
      keyColors: const FlexKeyColors(
        useSecondary: true,
        useTertiary: true,
      ),
      tones: FlexTones.vivid(Brightness.light),
      visualDensity: FlexColorScheme.comfortablePlatformDensity,
      useMaterial3: true,
      fontFamily: FontFamily.poppins,
      fontFamilyFallback: [FontFamily.notoSans],
      primaryTextTheme: _textTheme,
      textTheme: _textTheme,
    );

ThemeData darkThemeNew({required bool useDeepBlacks}) => FlexThemeData.dark(
      colors: const FlexSchemeColor(
        primary: Color(0xff003333),
        primaryContainer: Color(0xff00325b),
        secondary: Color(0xff99ff00),
        secondaryContainer: Color(0xff872100),
        tertiary: Color(0xff009933),
        tertiaryContainer: Color(0xff004e59),
        appBarColor: Color(0xff872100),
        error: Color(0xffcf6679),
      ),
      darkIsTrueBlack: useDeepBlacks,
      usedColors: 7,
      surfaceMode: FlexSurfaceMode.levelSurfacesLowScaffold,
      blendLevel: 13,
      subThemesData: _newSubThemeData1,
      keyColors: const FlexKeyColors(
        useSecondary: true,
        useTertiary: true,
      ),
      tones: FlexTones.vivid(Brightness.dark),
      visualDensity: FlexColorScheme.comfortablePlatformDensity,
      useMaterial3: true,
      fontFamily: FontFamily.poppins,
      fontFamilyFallback: [FontFamily.notoSans],
      primaryTextTheme: _textTheme,
      textTheme: _textTheme,
    );
// If you do not have a themeMode switch, uncomment this line
// to let the device system mode control the theme mode:
// themeMode: ThemeMode.system,

const _newSubThemeData1 = FlexSubThemesData(
  blendOnLevel: 20,
  useTextTheme: true,
  useM2StyleDividerInM3: true,
  adaptiveAppBarScrollUnderOff: FlexAdaptive.all(),
  alignedDropdown: true,
  useInputDecoratorThemeInDialogs: true,
  drawerIndicatorSchemeColor: SchemeColor.onPrimaryContainer,
  navigationBarSelectedLabelSchemeColor: SchemeColor.onPrimaryContainer,
  navigationBarMutedUnselectedLabel: false,
  navigationBarSelectedIconSchemeColor: SchemeColor.primaryContainer,
  navigationBarMutedUnselectedIcon: false,
  navigationBarIndicatorSchemeColor: SchemeColor.onPrimaryContainer,
  navigationBarIndicatorOpacity: 1,
  navigationRailSelectedLabelSchemeColor: SchemeColor.onPrimaryContainer,
  navigationRailMutedUnselectedLabel: false,
  navigationRailSelectedIconSchemeColor: SchemeColor.primaryContainer,
  navigationRailMutedUnselectedIcon: false,
  navigationRailIndicatorSchemeColor: SchemeColor.onPrimaryContainer,
  navigationRailIndicatorOpacity: 1,
  navigationRailBackgroundSchemeColor: SchemeColor.surface,
  navigationRailLabelType: NavigationRailLabelType.none,
);

const _newSubThemeData2 = FlexSubThemesData(
  blendOnLevel: 10,
  blendOnColors: false,
  useTextTheme: true,
  useM2StyleDividerInM3: true,
  adaptiveAppBarScrollUnderOff: FlexAdaptive.all(),
  alignedDropdown: true,
  useInputDecoratorThemeInDialogs: true,
  drawerIndicatorSchemeColor: SchemeColor.onPrimaryContainer,
  navigationBarSelectedLabelSchemeColor: SchemeColor.onPrimaryContainer,
  navigationBarMutedUnselectedLabel: false,
  navigationBarSelectedIconSchemeColor: SchemeColor.primaryContainer,
  navigationBarMutedUnselectedIcon: false,
  navigationBarIndicatorSchemeColor: SchemeColor.onPrimaryContainer,
  navigationBarIndicatorOpacity: 1,
  navigationRailSelectedLabelSchemeColor: SchemeColor.onPrimaryContainer,
  navigationRailMutedUnselectedLabel: false,
  navigationRailSelectedIconSchemeColor: SchemeColor.primaryContainer,
  navigationRailMutedUnselectedIcon: false,
  navigationRailIndicatorSchemeColor: SchemeColor.onPrimaryContainer,
  navigationRailIndicatorOpacity: 1,
  navigationRailBackgroundSchemeColor: SchemeColor.surface,
  navigationRailLabelType: NavigationRailLabelType.none,
);

import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';

import '../gen/fonts.gen.dart';

ThemeData getLightTheme({bool isWhite = true}) => FlexThemeData.light(
      colors: const FlexSchemeColor(
        primary: Color(0xff008000),
        primaryContainer: Color(0xffd0e4ff),
        secondary: Color(0xffffd700),
        secondaryContainer: Color(0xffffdbcf),
        tertiary: Color(0xff006875),
        tertiaryContainer: Color(0xff95f0ff),
        appBarColor: Color(0xffffdbcf),
        error: Color(0xffb00020),
      ),
      usedColors: 2,
      surfaceMode: FlexSurfaceMode.levelSurfacesLowScaffold,
      blendLevel: 7,
      lightIsWhite: isWhite,
      subThemesData: const FlexSubThemesData(
        useTextTheme: true,
        useM2StyleDividerInM3: true,
        thickBorderWidth: 2,
        defaultRadius: 16,
        fabUseShape: true,
        popupMenuRadius: 8,
        snackBarRadius: 16,
        appBarScrolledUnderElevation: 0,
        menuRadius: 16,
        menuBarRadius: 16,
      ),
      keyColors: const FlexKeyColors(
        useSecondary: true,
        useTertiary: true,
      ),
      tones: FlexTones.vivid(Brightness.light),
      visualDensity: FlexColorScheme.comfortablePlatformDensity,
      useMaterial3: true,
      swapLegacyOnMaterial3: true,
      fontFamily: FontFamily.nunito,
    );

ThemeData getDarkTheme({bool isBlack = true}) => FlexThemeData.dark(
      colors: const FlexSchemeColor(
        primary: Color(0xff008000),
        primaryContainer: Color(0xff00325b),
        secondary: Color(0xffffd700),
        secondaryContainer: Color(0xff872100),
        tertiary: Color(0xff86d2e1),
        tertiaryContainer: Color(0xff004e59),
        appBarColor: Color(0xff872100),
        error: Color(0xffcf6679),
      ),
      usedColors: 2,
      surfaceMode: FlexSurfaceMode.levelSurfacesLowScaffold,
      blendLevel: 13,
      darkIsTrueBlack: true,
      subThemesData: const FlexSubThemesData(
        useTextTheme: true,
        useM2StyleDividerInM3: true,
        defaultRadius: 16,
        thickBorderWidth: 2,
        fabUseShape: true,
        popupMenuRadius: 8,
        snackBarRadius: 16,
        appBarScrolledUnderElevation: 0,
        menuRadius: 16,
        menuBarRadius: 16,
      ),
      keyColors: const FlexKeyColors(
        useSecondary: true,
        useTertiary: true,
      ),
      tones:
          FlexTones.vivid(Brightness.dark), //.onMainsUseBW().onSurfacesUseBW(),
      visualDensity: FlexColorScheme.comfortablePlatformDensity,
      useMaterial3: true,
      swapLegacyOnMaterial3: true,
      fontFamily: FontFamily.nunito,
    );

const slowGlobalAnimationDuration = Duration(milliseconds: 1000);
const midGlobalAnimationDuration = Duration(milliseconds: 500);
const fastGlobalAnimationDuration = Duration(milliseconds: 250);

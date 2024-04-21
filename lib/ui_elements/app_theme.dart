import 'package:flutter/material.dart';

import '../gen/fonts.gen.dart';
import '../icons_module/icons.dart';
import '../shared/extensions/color_extenstions.dart';

class AppTheme {
  final Brightness _brightness;
  final ColorScheme _colorScheme;

  AppTheme(ColorScheme colorScheme)
      : _brightness = colorScheme.brightness,
        _colorScheme = colorScheme;

  ThemeData get themeData => ThemeData(
        inputDecorationTheme: _inputDecorationTheme,
        useMaterial3: true,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        colorScheme: _colorScheme,
        scaffoldBackgroundColor: _scaffoldBackgroundColor,
        fontFamily: FontFamily.poppins,
        fontFamilyFallback: const [FontFamily.notoSans],
        primaryTextTheme: _textTheme,
        textTheme: _textTheme,
        actionIconTheme: _actionIconThemeData,
        appBarTheme: _appBarTheme,
        bottomSheetTheme: _bottomSheetThemeData,
        navigationBarTheme: _navigationBarTheme,
      );

  InputDecorationTheme get _inputDecorationTheme => const InputDecorationTheme(
        border: OutlineInputBorder(),
      );

  Color get _scaffoldBackgroundColor {
    switch (_brightness) {
      case Brightness.dark:
        return _colorScheme.background.tone(0);
      case Brightness.light:
        return _colorScheme.background.tone(100);
    }
  }

  //*Use to modify Default Appbar Icons
  ActionIconThemeData get _actionIconThemeData => ActionIconThemeData(
        backButtonIconBuilder: (_) => const Icon(RemixIcons.arrow_left_line),
        closeButtonIconBuilder: (_) => const Icon(RemixIcons.close_line),
      );

  AppBarTheme get _appBarTheme => const AppBarTheme(
        scrolledUnderElevation: 0,
        elevation: 0,
      );

  BottomSheetThemeData get _bottomSheetThemeData =>
      const BottomSheetThemeData(showDragHandle: true);

  NavigationBarThemeData get _navigationBarTheme => NavigationBarThemeData(
        indicatorColor: _colorScheme.primary,
        labelTextStyle: MaterialStateTextStyle.resolveWith((states) {
          if (states.contains(MaterialState.selected)) {
            return _labelStyle.copyWith(
              fontSize: 12,
              color: _colorScheme.primary,
            );
          }
          return _labelStyle.copyWith(fontSize: 12);
        }),
      );
}

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

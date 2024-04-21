import 'package:flutter/material.dart';

import '../gen/fonts.gen.dart';
import '../icons_module/icons.dart';
import '../shared/extensions/color_extenstions.dart';

class AppTheme {
  final Brightness _brightness;
  final ColorScheme _colorScheme;
  final _actualPrimary = const Color(0xff009933);
  final _actualSecondary = const Color(0xff99ff00);
  final _actualTertiary = const Color(0xff003333);

  AppTheme(ColorScheme colorScheme)
      : _brightness = colorScheme.brightness,
        _colorScheme = colorScheme;

  ThemeData get themeData => ThemeData(
      inputDecorationTheme: _inputDecorationTheme,
      useMaterial3: true,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      colorScheme: _colorScheme,
      // dialogBackgroundColor: _dialogBackgroundColor,
      scaffoldBackgroundColor: _scaffoldBackgroundColor,
      fontFamily: FontFamily.poppins,
      fontFamilyFallback: const [FontFamily.notoSans],
      primaryTextTheme: _textTheme,
      textTheme: _textTheme,
      actionIconTheme: _actionIconThemeData,
      appBarTheme: _appBarTheme,
      bottomSheetTheme: _bottomSheetThemeData,
      dialogTheme: _dialogTheme);

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

  AppBarTheme get _appBarTheme => AppBarTheme(
        backgroundColor: _scaffoldBackgroundColor,
        scrolledUnderElevation: 0,
        elevation: 0,
      );

  BottomSheetThemeData get _bottomSheetThemeData => BottomSheetThemeData(
        modalBarrierColor: _colorScheme.onBackground.withOpacity(0.2),
        modalBackgroundColor: _bottomSheetBackgroundColor,
        showDragHandle: true,
      );

//TODO: Adjust surface Tint to satisfaction
//TODO: Remove themeing from navigationbar in app
  DialogTheme get _dialogTheme => DialogTheme(
        backgroundColor: _bottomSheetBackgroundColor,
        surfaceTintColor: _colorScheme.primary.tone(100),
      );

  Color get _bottomSheetBackgroundColor {
    switch (_brightness) {
      case Brightness.dark:
        return _scaffoldBackgroundColor.tone(0);
      case Brightness.light:
        return _scaffoldBackgroundColor.tone(100);
    }
  }
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

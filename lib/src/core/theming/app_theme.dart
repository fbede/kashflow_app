import 'package:flutter/material.dart';

import '../../../icons_module/icons.dart';

import '../core.dart';
import 'material_theme.dart';

class AppTheme {
  final ThemeData _baseThemeData;

  const AppTheme._(ThemeData baseThemeData) : _baseThemeData = baseThemeData;
  factory AppTheme.light() => AppTheme._(MaterialTheme(_textTheme).light());
  factory AppTheme.dark() => AppTheme._(MaterialTheme(_textTheme).dark());

  ThemeData get themeData => _baseThemeData.copyWith(
        inputDecorationTheme: _inputDecorationTheme,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        actionIconTheme: _actionIconThemeData,
        navigationBarTheme: _navigationBarTheme,
      );

  InputDecorationTheme get _inputDecorationTheme => const InputDecorationTheme(
        border: OutlineInputBorder(),
      );

  //*Use to modify Default Appbar Icons
  ActionIconThemeData get _actionIconThemeData => ActionIconThemeData(
        backButtonIconBuilder: (_) => const Icon(RemixIcons.arrow_left_line),
        closeButtonIconBuilder: (_) => const Icon(RemixIcons.close_line),
      );

  NavigationBarThemeData get _navigationBarTheme => NavigationBarThemeData(
        indicatorColor: _baseThemeData.colorScheme.primary,
        labelTextStyle: MaterialStateTextStyle.resolveWith((states) {
          if (states.contains(MaterialState.selected)) {
            return _labelStyle.copyWith(
              fontSize: 12,
              color: _baseThemeData.colorScheme.primary,
            );
          }
          return _labelStyle.copyWith(fontSize: 12);
        }),
      );
}

const slowGlobalAnimationDuration = Duration(milliseconds: 1000);
const midGlobalAnimationDuration = Duration(milliseconds: 500);
const fastGlobalAnimationDuration = Duration(milliseconds: 250);

final _textTheme = TextTheme(
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

final _displayStyle = _baseTextStyle.copyWith(fontWeight: FontWeight.w700);
final _headlineStyle = _baseTextStyle.copyWith(fontWeight: FontWeight.w300);
final _titleStyle = _baseTextStyle.copyWith(fontWeight: FontWeight.w600);
final _bodyStyle = _baseTextStyle.copyWith(fontWeight: FontWeight.w400);
final _labelStyle = _baseTextStyle.copyWith(fontWeight: FontWeight.w500);

const _baseTextStyle = TextStyle(
  fontFamily: FontFamily.poppins,
  fontFamilyFallback: [FontFamily.notoSans],
);

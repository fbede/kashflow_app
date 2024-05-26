import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../core.dart';

class AppTheme {
  final ThemeData _baseThemeData;

  const AppTheme._(ThemeData baseThemeData) : _baseThemeData = baseThemeData;
  factory AppTheme.light() => AppTheme._(MaterialTheme(_textTheme).light());
  factory AppTheme.dark() => AppTheme._(MaterialTheme(_textTheme).dark());

  ThemeData get themeData => _baseThemeData.copyWith(
        inputDecorationTheme: _inputDecorationTheme,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        actionIconTheme: _actionIconThemeData,
        elevatedButtonTheme: _elevatedButtonTheme,
        filledButtonTheme: _filledButtonTheme,
        navigationBarTheme: _navigationBarTheme,
        outlinedButtonTheme: _outlinedButtonTheme,
        textButtonTheme: _textButtonTheme,
      );

  InputDecorationTheme get _inputDecorationTheme => InputDecorationTheme(
        border: const OutlineInputBorder(),
        hintStyle: _textTheme.bodyNormal,
      );

  ActionIconThemeData get _actionIconThemeData => ActionIconThemeData(
        backButtonIconBuilder: (_) => Assets.lucide.chevronLeft.svg(
          theme: SvgTheme(
            currentColor: _baseThemeData.colorScheme.onBackground,
          ),
        ),
        closeButtonIconBuilder: (_) => Assets.lucide.x.svg(
          theme: SvgTheme(
            currentColor: _baseThemeData.colorScheme.onBackground,
          ),
        ),
      );

  ElevatedButtonThemeData get _elevatedButtonTheme => ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(textStyle: _textTheme.bodyNormal),
      );

  FilledButtonThemeData get _filledButtonTheme => FilledButtonThemeData(
        style: FilledButton.styleFrom(textStyle: _textTheme.bodyNormal),
      );

  NavigationBarThemeData get _navigationBarTheme => NavigationBarThemeData(
        indicatorColor: _baseThemeData.colorScheme.onPrimaryContainer,
        labelTextStyle: MaterialStateTextStyle.resolveWith((states) {
          if (states.contains(MaterialState.selected)) {
            return _textTheme.labelNormal.copyWith(
              fontWeight: FontWeight.w700,
              color: _baseThemeData.colorScheme.primary,
            );
          }
          return _textTheme.labelNormal;
        }),
      );

  OutlinedButtonThemeData get _outlinedButtonTheme => OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(textStyle: _textTheme.bodyNormal),
      );

  TextButtonThemeData get _textButtonTheme => TextButtonThemeData(
        style: TextButton.styleFrom(textStyle: _textTheme.bodyNormal),
      );
}

const slowGlobalAnimationDuration = Duration(milliseconds: 1000);
const midGlobalAnimationDuration = Duration(milliseconds: 500);
const fastGlobalAnimationDuration = Duration(milliseconds: 250);

final _textTheme = AppTextTheme.theme;

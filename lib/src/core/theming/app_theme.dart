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
        //  buttonTheme: _buttonTheme,
        navigationBarTheme: _navigationBarTheme,
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

  // ButtonThemeData get _buttonTheme => ButtonThemeData();

  // ButtonTextTheme get _buttonTextTheme => Butt

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
}

const slowGlobalAnimationDuration = Duration(milliseconds: 1000);
const midGlobalAnimationDuration = Duration(milliseconds: 500);
const fastGlobalAnimationDuration = Duration(milliseconds: 250);

final _textTheme = AppTextTheme.theme;

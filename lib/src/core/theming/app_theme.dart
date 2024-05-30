import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import '../core.dart';
import 'material_scheme.dart';

class AppTheme {
  late final ThemeData _baseThemeData;
  late final MaterialScheme _materialScheme;

  AppTheme(MaterialScheme materialScheme) {
    _materialScheme = materialScheme;
    _baseThemeData = MaterialTheme(_textTheme).theme(
      materialScheme.toColorScheme(),
    );
  }

  ThemeData get themeData => _baseThemeData.copyWith(
        extensions: [_materialScheme],
        inputDecorationTheme: _inputDecorationTheme,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        scaffoldBackgroundColor: _materialScheme.surfaceContainerLowest,
        actionIconTheme: _actionIconThemeData,
        elevatedButtonTheme: _elevatedButtonTheme,
        filledButtonTheme: _filledButtonTheme,
        navigationBarTheme: _navigationBarTheme,
        outlinedButtonTheme: _outlinedButtonTheme,
        tabBarTheme: _tabBarTheme,
        textButtonTheme: _textButtonTheme,
      );

  InputDecorationTheme get _inputDecorationTheme => InputDecorationTheme(
        border: const OutlineInputBorder(),
        hintStyle: _textTheme.bodyNormal,
      );

  ActionIconThemeData get _actionIconThemeData => ActionIconThemeData(
        backButtonIconBuilder: (_) => const Icon(LucideIcons.chevronLeft),
        closeButtonIconBuilder: (_) => const Icon(LucideIcons.x),
      );

  ElevatedButtonThemeData get _elevatedButtonTheme => ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(textStyle: _textTheme.bodyNormal),
      );

  FilledButtonThemeData get _filledButtonTheme => FilledButtonThemeData(
        style: FilledButton.styleFrom(textStyle: _textTheme.bodyNormal),
      );

  NavigationBarThemeData get _navigationBarTheme => NavigationBarThemeData(
        indicatorColor: _baseThemeData.colorScheme.primaryContainer,
        labelTextStyle: MaterialStateTextStyle.resolveWith((states) {
          if (states.contains(MaterialState.selected)) {
            return _textTheme.bodyNormal.copyWith(
              fontWeight: FontWeight.bold,
              // color: _baseThemeData.colorScheme.onPrimaryContainer,
            );
          }

          return _textTheme.bodyNormal;
        }),
        iconTheme: MaterialStateProperty.resolveWith((states) {
          if (states.contains(MaterialState.selected)) {
            return _baseThemeData.iconTheme.copyWith(
              color: _baseThemeData.colorScheme.onPrimaryContainer,
            );
          }

          return _baseThemeData.iconTheme.copyWith(
            color: _baseThemeData.colorScheme.onBackground.withOpacity(0.5),
          );
        }),
      );

  OutlinedButtonThemeData get _outlinedButtonTheme => OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(textStyle: _textTheme.bodyNormal),
      );

  TabBarTheme get _tabBarTheme => TabBarTheme(
        labelStyle: _textTheme.bodyNormal
            .copyWith(color: _baseThemeData.colorScheme.primary),
      );

  TextButtonThemeData get _textButtonTheme => TextButtonThemeData(
        style: TextButton.styleFrom(textStyle: _textTheme.bodyNormal),
      );
}

const slowGlobalAnimationDuration = Duration(milliseconds: 1000);
const midGlobalAnimationDuration = Duration(milliseconds: 500);
const fastGlobalAnimationDuration = Duration(milliseconds: 250);

final _textTheme = AppTextTheme.theme;

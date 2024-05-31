import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import '../core.dart';
import 'material_scheme.dart';

class AppTheme {
  late final ThemeData _baseThemeData;
  late final MaterialScheme _materialScheme;

  AppTheme(MaterialScheme materialScheme) {
    _materialScheme = materialScheme;
    _baseThemeData = MaterialTheme(AppTextTheme.theme).theme(
      materialScheme.toColorScheme(),
    );
  }

  TextTheme get _textTheme => _baseThemeData.textTheme;

  ThemeData get themeData => _baseThemeData.copyWith(
        extensions: [_materialScheme],
        inputDecorationTheme: _inputDecorationTheme,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        scaffoldBackgroundColor: _materialScheme.surfaceContainerLowest,
        appBarTheme: _appBarTheme,
        actionIconTheme: _actionIconThemeData,
        bottomSheetTheme: _bottomSheetTheme,
        dialogTheme: _dialogTheme,
        navigationBarTheme: _navigationBarTheme,
        tabBarTheme: _tabBarTheme,
      );

  InputDecorationTheme get _inputDecorationTheme => InputDecorationTheme(
        border: const OutlineInputBorder(),
        hintStyle: _textTheme.bodyNormal,
      );

  ActionIconThemeData get _actionIconThemeData => ActionIconThemeData(
        backButtonIconBuilder: (_) => const Icon(LucideIcons.chevronLeft),
        closeButtonIconBuilder: (_) => const Icon(LucideIcons.x),
      );

  AppBarTheme get _appBarTheme => AppBarTheme(
        scrolledUnderElevation: 0,
        backgroundColor: _materialScheme.surfaceContainerLowest,
        titleTextStyle: _textTheme.titleBold,
      );

  BottomSheetThemeData get _bottomSheetTheme => BottomSheetThemeData(
        backgroundColor: _materialScheme.surface,
        surfaceTintColor: Colors.transparent,
      );

  DialogTheme get _dialogTheme => DialogTheme(
        backgroundColor: _materialScheme.surface,
        surfaceTintColor: Colors.transparent,
        titleTextStyle: _textTheme.titleBold,
        contentTextStyle: _textTheme.bodyNormal,
      );

  NavigationBarThemeData get _navigationBarTheme => NavigationBarThemeData(
        indicatorColor: _materialScheme.primaryContainer,
        backgroundColor: _materialScheme.surface,
        surfaceTintColor: Colors.transparent,
        labelTextStyle: MaterialStateTextStyle.resolveWith((states) {
          if (states.contains(MaterialState.selected)) {
            return _textTheme.labelNormal.copyWith(
              fontWeight: FontWeight.bold,
              color: _materialScheme.primary,
            );
          }

          return _textTheme.labelNormal;
        }),
        iconTheme: MaterialStateProperty.resolveWith((states) {
          if (states.contains(MaterialState.selected)) {
            return _baseThemeData.iconTheme.copyWith(
              color: _materialScheme.onPrimaryContainer,
            );
          }

          return _baseThemeData.iconTheme.copyWith(
            color: _materialScheme.onSurface.withOpacity(0.5),
          );
        }),
      );

  TabBarTheme get _tabBarTheme => TabBarTheme(
        labelStyle: _baseThemeData.textTheme.titleBold.copyWith(
          color: _materialScheme.primary,
        ),
      );
}

const slowGlobalAnimationDuration = Duration(milliseconds: 1000);
const midGlobalAnimationDuration = Duration(milliseconds: 500);
const fastGlobalAnimationDuration = Duration(milliseconds: 250);

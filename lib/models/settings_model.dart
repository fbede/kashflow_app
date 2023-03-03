import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:kashflow/db/drift_db.dart';

import '../util/visible_strings.dart';

@immutable
class Settings extends Equatable {
  static final DriftDB _db = GetIt.I<DriftDB>();
  static final _prefs = GetIt.I.get<SharedPreferences>();

  final List<PreloadedCurrencyData> defaultCurrencies =
      GetIt.I.get<List<PreloadedCurrencyData>>();

  // enum
  final ThemeMode themeMode;

  factory Settings.load() {
    return Settings._(
      themeMode: _getThemeModeFromPrefs(),
    );
  }

  Settings._({
    this.themeMode = ThemeMode.system,
  });

  @override
  List<Object> get props => [themeMode, defaultCurrencies];

  Settings copyWith({
    ThemeMode? themeMode,
    List<PreloadedCurrencyData>? defaultCurrencies,
  }) {
    return Settings._(
      themeMode: themeMode ?? this.themeMode,
    );
  }

  static ThemeMode _getThemeModeFromPrefs() {
    final int = _prefs.getInt(THEMEMODE_KEY);

    if (int == 0) return ThemeMode.dark;
    if (int == 1) return ThemeMode.light;
    return ThemeMode.system;
  }

  static void saveThemeModeInPrefs(ThemeMode themeMode) async {
    switch (themeMode) {
      case ThemeMode.light:
        await _prefs.setInt(THEMEMODE_KEY, 1);
        break;
      case ThemeMode.dark:
        await _prefs.setInt(THEMEMODE_KEY, 0);
        break;
      case ThemeMode.system:
        await _prefs.setInt(THEMEMODE_KEY, 2);
        break;
    }
  }
}

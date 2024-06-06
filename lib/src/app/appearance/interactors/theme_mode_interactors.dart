import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../shared/shared.dart';

class ThemeModeInteractor {
  final SharedPreferences _prefs;

  ThemeModeInteractor({SharedPreferences? prefs})
      : _prefs = prefs ?? GetIt.I<SharedPreferences>();

  ThemeMode get themeMode {
    int index = _prefs.getInt(PrefKeys.themeMode) ?? 2;

    if (index > 2) {
      index = 2;
    }

    return ThemeMode.values[index];
  }

  Future<void> saveThemeMode(ThemeMode mode) async =>
      _prefs.setInt(PrefKeys.themeMode, mode.index);
}

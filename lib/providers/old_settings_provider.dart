import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kashflow/models/models.dart';

class SettingsNotifier extends StateNotifier<Settings> {
  SettingsNotifier(super.state);

  void updateThemeMode({required ThemeMode? themeMode}) async {
    if (themeMode == null) {
      return;
    }
    state = state.copyWith(themeMode: themeMode);
    Settings.saveThemeModeInPrefs(themeMode);
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';
import 'package:kashflow/models/models.dart';
import 'package:kashflow/util/strings.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsNotifier extends StateNotifier<Settings> {
  SettingsNotifier(super.state);

  void updateThemeMode({required ThemeMode? themeMode}) async {
    if (themeMode == null) {
      return;
    }
    var prefs = GetIt.I.get<SharedPreferences>();
    state = state.copyWith(themeMode: themeMode);
    await prefs.setString(SETTINGS_KEY, state.toJson());
  }
}

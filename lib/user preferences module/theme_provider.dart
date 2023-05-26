import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../shared/keys.dart';

final themesProvider = AutoDisposeNotifierProvider<ThemeNotifier,
    ({ThemeMode themeMode, bool isBlackAndWhite})>(
  ThemeNotifier.new,
);

class ThemeNotifier
    extends AutoDisposeNotifier<({ThemeMode themeMode, bool isBlackAndWhite})> {
  final _prefs = GetIt.I<SharedPreferences>();
  final darkModeInt = 0;
  final lightModeInt = 1;
  final systemModeInt = 2;

  late ThemeMode _oldThemeMode;
  late bool _oldBlackAndWhiteValue;
  late int themeModeInt;
  late bool currentBlackAndWhiteValue;

  @override
  ({ThemeMode themeMode, bool isBlackAndWhite}) build() {
    themeModeInt = _prefs.getInt(PrefKeys.themeModeInt) ?? systemModeInt;

    currentBlackAndWhiteValue =
        _prefs.getBool(PrefKeys.isBlackOrWhiteBackground) ?? false;

    _oldThemeMode = _getThemeModeFromInt(themeModeInt);

    _oldBlackAndWhiteValue = currentBlackAndWhiteValue;

    return (themeMode: _oldThemeMode, isBlackAndWhite: _oldBlackAndWhiteValue);
  }

  void changeThemeMode(int i) {
    themeModeInt = i;
    state = (
      themeMode: _getThemeModeFromInt(i),
      isBlackAndWhite: state.isBlackAndWhite,
    );
  }

  void makeBackgroundWhiteOrBlack() {
    currentBlackAndWhiteValue = true;
    state = (themeMode: state.themeMode, isBlackAndWhite: true);
  }

  void doNotmakeBackgroundWhiteOrBlack() {
    currentBlackAndWhiteValue = false;
    state = (themeMode: state.themeMode, isBlackAndWhite: false);
  }

  Future<void> saveTheme() async {
    _oldThemeMode = state.themeMode;
    _oldBlackAndWhiteValue = state.isBlackAndWhite;

    await Future.wait([
      _prefs.setInt(
        PrefKeys.themeModeInt,
        _getIntFromThemeMode(state.themeMode),
      ),
      _prefs.setBool(PrefKeys.isBlackOrWhiteBackground, state.isBlackAndWhite),
    ]);
  }

  void cancelThemeChange() => state =
      (themeMode: _oldThemeMode, isBlackAndWhite: _oldBlackAndWhiteValue);

  int _getIntFromThemeMode(ThemeMode mode) {
    switch (mode) {
      case ThemeMode.dark:
        return darkModeInt;
      case ThemeMode.light:
        return lightModeInt;
      case ThemeMode.system:
        return systemModeInt;
    }
  }

  ThemeMode _getThemeModeFromInt(int int) {
    if (int == darkModeInt) return ThemeMode.dark;
    if (int == lightModeInt) return ThemeMode.light;
    return ThemeMode.system;
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../shared/keys.dart';
import '../shared/shared_providers.dart';

final themesProvider = AutoDisposeNotifierProvider<ThemeNotifier,
    ({ThemeMode themeMode, bool isBlackAndWhite})>(
  ThemeNotifier.new,
);

class ThemeNotifier
    extends AutoDisposeNotifier<({ThemeMode themeMode, bool isBlackAndWhite})> {
  late ThemeMode _oldThemeMode;
  late bool _oldBlackAndWhiteValue;
  late int themeModeInt;
  late bool currentBlackAndWhiteValue;

  final darkModeInt = 0;
  final lightModeInt = 1;
  final systemModeInt = 2;

  @override
  ({ThemeMode themeMode, bool isBlackAndWhite}) build() {
    final prefs = ref.watch(prefsProvider).asData!.value;
    themeModeInt = prefs.getInt(PrefKeys.themeModeInt) ?? systemModeInt;

    currentBlackAndWhiteValue =
        prefs.getBool(PrefKeys.isBlackOrWhiteBackground) ?? false;

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

    final prefs = await SharedPreferences.getInstance();

    await Future.wait([
      prefs.setInt(
        PrefKeys.themeModeInt,
        _getIntFromThemeMode(state.themeMode),
      ),
      prefs.setBool(PrefKeys.isBlackOrWhiteBackground, state.isBlackAndWhite),
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

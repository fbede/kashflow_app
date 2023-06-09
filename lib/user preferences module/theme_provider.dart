import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../shared/keys.dart';

final themesProvider =
    AutoDisposeAsyncNotifierProvider<ThemeNotifier, ThemeState>(
  ThemeNotifier.new,
);

typedef ThemeState = ({ThemeMode themeMode, bool isBlackAndWhite});

class ThemeNotifier extends AutoDisposeAsyncNotifier<ThemeState> {
  late ThemeMode _oldThemeMode;
  late bool _oldBlackAndWhiteValue;
  late int themeModeInt;
  late bool currentBlackAndWhiteValue;

  final darkModeInt = 0;
  final lightModeInt = 1;
  final systemModeInt = 2;

  @override
  Future<ThemeState> build() async {
    final prefs = await SharedPreferences.getInstance();
    themeModeInt = prefs.getInt(PrefKeys.themeModeInt) ?? systemModeInt;

    currentBlackAndWhiteValue =
        prefs.getBool(PrefKeys.isBlackOrWhiteBackground) ?? false;

    _oldThemeMode = _getThemeModeFromInt(themeModeInt);

    _oldBlackAndWhiteValue = currentBlackAndWhiteValue;

    return (themeMode: _oldThemeMode, isBlackAndWhite: _oldBlackAndWhiteValue);
  }

  void changeThemeMode(int i) {
    themeModeInt = i;
    state = AsyncValue.data(
      (
        themeMode: _getThemeModeFromInt(i),
        isBlackAndWhite: state.requireValue.isBlackAndWhite,
      ),
    );
  }

  void makeBackgroundWhiteOrBlack() {
    currentBlackAndWhiteValue = true;
    state = AsyncValue.data(
      (themeMode: state.requireValue.themeMode, isBlackAndWhite: true),
    );
  }

  void doNotmakeBackgroundWhiteOrBlack() {
    currentBlackAndWhiteValue = false;
    state = AsyncValue.data(
      (themeMode: state.requireValue.themeMode, isBlackAndWhite: false),
    );
  }

  Future<void> saveTheme() async {
    _oldThemeMode = state.requireValue.themeMode;
    _oldBlackAndWhiteValue = state.requireValue.isBlackAndWhite;

    final prefs = await SharedPreferences.getInstance();

    await Future.wait([
      prefs.setInt(
        PrefKeys.themeModeInt,
        _getIntFromThemeMode(_oldThemeMode),
      ),
      prefs.setBool(PrefKeys.isBlackOrWhiteBackground, _oldBlackAndWhiteValue),
    ]);
  }

  void cancelThemeChange() => state = AsyncValue.data(
        (themeMode: _oldThemeMode, isBlackAndWhite: _oldBlackAndWhiteValue),
      );

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

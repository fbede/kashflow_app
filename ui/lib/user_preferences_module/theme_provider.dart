import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../shared/keys.dart';

part 'theme_provider.g.dart';

typedef ThemeState = ({
  ThemeMode themeMode,
  bool useDeepBlacks,
});

@riverpod
class Theme extends _$Theme {
  final prefs = GetIt.I<SharedPreferences>();
  late ThemeMode _oldThemeMode;
  late bool _oldUseDeepBlacksValue;
  late int themeModeInt;
  late bool currentBlackAndWhiteValue;

  @override
  ThemeState build() {
    themeModeInt =
        prefs.getInt(PrefKeys.themeModeInt) ?? ThemeMode.system.index;

    currentBlackAndWhiteValue =
        prefs.getBool(PrefKeys.isBlackOrWhiteBackground) ?? false;

    _oldThemeMode = ThemeMode.values[themeModeInt];
    _oldUseDeepBlacksValue = currentBlackAndWhiteValue;

    return (
      themeMode: _oldThemeMode,
      useDeepBlacks: _oldUseDeepBlacksValue,
    );
  }

  void changeThemeMode(int i) {
    themeModeInt = i;
    state = (
      themeMode: ThemeMode.values[i],
      useDeepBlacks: state.useDeepBlacks,
    );
  }

  void makeBackgroundWhiteOrBlack() {
    currentBlackAndWhiteValue = true;
    state = (themeMode: state.themeMode, useDeepBlacks: true);
  }

  void doNotmakeBackgroundWhiteOrBlack() {
    currentBlackAndWhiteValue = false;
    state = (themeMode: state.themeMode, useDeepBlacks: false);
  }

  Future<void> saveTheme() async {
    _oldThemeMode = state.themeMode;
    _oldUseDeepBlacksValue = state.useDeepBlacks;

    await Future.wait([
      prefs.setInt(
        PrefKeys.themeModeInt,
        _oldThemeMode.index,
      ),
      prefs.setBool(
        PrefKeys.isBlackOrWhiteBackground,
        _oldUseDeepBlacksValue,
      ),
    ]);
  }

  void cancelThemeChange() =>
      state = (themeMode: _oldThemeMode, useDeepBlacks: _oldUseDeepBlacksValue);
}

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../core/keys.dart';

final themesProvider = AutoDisposeNotifierProvider<_ThemeNotifier, _ThemeState>(
  _ThemeNotifier.new,
);

typedef _ThemeState = ({
  ThemeMode themeMode,
  bool useDeepBlacks,
});

class _ThemeNotifier extends AutoDisposeNotifier<_ThemeState> {
  final prefs = GetIt.I<SharedPreferences>();
  late ThemeMode _oldThemeMode;
  late bool _oldUseDeepBlacksValue;
  late int themeModeInt;
  late bool currentBlackAndWhiteValue;

  @override
  _ThemeState build() {
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

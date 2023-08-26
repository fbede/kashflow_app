import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../core/keys.dart';

final themesProvider =
    AutoDisposeAsyncNotifierProvider<_ThemeNotifier, _ThemeState>(
  _ThemeNotifier.new,
);

typedef _ThemeState = ({
  ThemeMode themeMode,
  bool useDeepBlacks,
});

class _ThemeNotifier extends AutoDisposeAsyncNotifier<_ThemeState> {
  late ThemeMode _oldThemeMode;
  late bool _oldUseDeepBlacksValue;
  late int themeModeInt;
  late bool currentBlackAndWhiteValue;

  @override
  Future<_ThemeState> build() async {
    final prefs = await SharedPreferences.getInstance();

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
    state = AsyncValue.data(
      (
        themeMode: ThemeMode.values[i],
        useDeepBlacks: state.requireValue.useDeepBlacks,
      ),
    );
  }

  void makeBackgroundWhiteOrBlack() {
    currentBlackAndWhiteValue = true;
    state = AsyncValue.data(
      (themeMode: state.requireValue.themeMode, useDeepBlacks: true),
    );
  }

  void doNotmakeBackgroundWhiteOrBlack() {
    currentBlackAndWhiteValue = false;
    state = AsyncValue.data(
      (themeMode: state.requireValue.themeMode, useDeepBlacks: false),
    );
  }

  Future<void> saveTheme() async {
    _oldThemeMode = state.requireValue.themeMode;
    _oldUseDeepBlacksValue = state.requireValue.useDeepBlacks;

    final prefs = await SharedPreferences.getInstance();

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

  void cancelThemeChange() => state = AsyncValue.data(
        (themeMode: _oldThemeMode, useDeepBlacks: _oldUseDeepBlacksValue),
      );
}

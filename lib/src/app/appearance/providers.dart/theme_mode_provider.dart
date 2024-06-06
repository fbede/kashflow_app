import 'package:flutter/material.dart' as m;
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../appearance.dart';
part 'theme_mode_provider.g.dart';

@riverpod
class ThemeMode extends _$ThemeMode {
  final _interactor = ThemeModeInteractor();

  @override
  m.ThemeMode build() => _interactor.themeMode;

  Future<void> saveThemeMode(m.ThemeMode? mode) async {
    if (mode != null) {
      await _interactor.saveThemeMode(mode);
      state = mode;
    }
  }
}

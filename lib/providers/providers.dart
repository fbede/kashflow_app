import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';
import 'package:kashflow/models/models.dart';
import 'package:kashflow/providers/settings_provider.dart';
import 'package:kashflow/util/strings.dart';
import 'package:shared_preferences/shared_preferences.dart';

final settingsProvider = StateNotifierProvider<SettingsNotifier, Settings>(
  ((ref) {
    final prefs = GetIt.I.get<SharedPreferences>();
    final String? settingsJson = prefs.getString(SETTINGS_KEY);

    if (settingsJson == null) {
      return SettingsNotifier(Settings());
    } else {
      return SettingsNotifier(Settings.fromJson(settingsJson));
    }
  }),
);

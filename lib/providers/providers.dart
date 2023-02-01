import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kashflow/models/models.dart';
import 'package:kashflow/providers/settings_provider.dart';

final settingsProvider = StateNotifierProvider<SettingsNotifier, Settings>(
  ((ref) => SettingsNotifier(Settings.load())),
);

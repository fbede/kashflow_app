import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:kashflow/models/models.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../util/strings.dart';

@immutable
class Settings extends Equatable {
  // enum
  final ThemeMode themeMode;
  final List<PopularCurrency> popularCurrencies =
      GetIt.I.get<List<PopularCurrency>>();

  Settings({
    this.themeMode = ThemeMode.system,
  });

  factory Settings.load() {
    final prefs = GetIt.I.get<SharedPreferences>();
    final String? settingsJson = prefs.getString(SETTINGS_KEY);

    if (settingsJson == null) {
      return Settings();
    } else {
      return Settings.fromJson(settingsJson);
    }
  }

  @override
  List<Object> get props => [themeMode];

  Settings copyWith({
    ThemeMode? themeMode,
  }) {
    return Settings(
      themeMode: themeMode ?? this.themeMode,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'themeMode': themeMode.index,
    };
  }

  factory Settings.fromMap(Map<String, dynamic> map) {
    return Settings(
      themeMode: ThemeMode.values[map['themeMode'] as int],
    );
  }

  String toJson() => json.encode(toMap());

  factory Settings.fromJson(String source) =>
      Settings.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;
}

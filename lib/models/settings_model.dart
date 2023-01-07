import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
class Settings extends Equatable {
  // enum
  final ThemeMode themeMode;

  Settings({
    this.themeMode = ThemeMode.system,
  });

  Settings copywith({ThemeMode? themeMode}) {
    return Settings(
      themeMode: themeMode ?? this.themeMode,
    );
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

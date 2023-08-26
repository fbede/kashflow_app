import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

part 'icon_picker.map.dart';

final iconPickerProviderFamily =
    AutoDisposeProviderFamily<List<PhosphorIconData>, (int, String)>(
  (ref, param) {
    final tabId = param.$1;
    final searchTerm = param.$2;
    late final Iterable<String> iconDataNames;
    late final Map<String, PhosphorIconData> resultMap;

    if (tabId == 0) {
      iconDataNames = _regularIconMap.keys;
      resultMap = _regularIconMap;
    } else {
      iconDataNames = _filledIconMap.keys;
      resultMap = _filledIconMap;
    }

    final tempResult = _searchIconInList(searchTerm, iconDataNames);
    final result = <PhosphorIconData>[];

    for (final item in tempResult) {
      result.add(resultMap[item]!);
    }

    return result;
  },
);

List<String> _searchIconInList(String searchTerm, Iterable<String> iconNames) {
  final result = <String>[];

  for (final name in iconNames) {
    if (name.toLowerCase().contains(searchTerm.toLowerCase())) {
      result.add(name);
    }
  }

  return result;
}

IconData getRandomIconData() {
  final icons = [
    ..._regularIconMap.values,
    ..._filledIconMap.values,
  ];

  final index = Random().nextInt(icons.length);
  return icons[index];
}

import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'icons_map.dart';

part 'icon_picker_provider.g.dart';

@riverpod
class IconPicker extends _$IconPicker {
  @override
  List<IconData> build(String searchTerm) {
    final tempResult = _searchIconInList(searchTerm, remixIconsMap.keys);
    final result = <IconData>[];

    for (final item in tempResult) {
      result.add(remixIconsMap[item]!);
    }

    return result;
  }

  List<String> _searchIconInList(
    String searchTerm,
    Iterable<String> iconNames,
  ) {
    final result = <String>[];

    for (final name in iconNames) {
      if (name.toLowerCase().contains(searchTerm.toLowerCase())) {
        result.add(name);
      }
    }

    return result;
  }
}

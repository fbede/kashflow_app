import 'package:flutter/material.dart';
import 'package:flutter_remix_icon/flutter_remix_icon.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

part 'icon_picker.map.dart';

final iconPickerProviderFamily =
    AutoDisposeFutureProviderFamily<List<IconData>, String>(
  (ref, searchTerm) {
    final iconDataNames = _iconPickerMap.keys;
    final tempResult = _searchIconInList(searchTerm, iconDataNames);
    final result = <IconData>[];

    for (final item in tempResult) {
      result.add(_iconPickerMap[item]!);
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

import 'dart:convert';

import '../../core.dart';

List<AssetIconTableCompanion> loadIconsFromAsset(String json) {
  final data = jsonDecode(json) as List;
  final List<AssetIconTableCompanion> iconsData = data
      .map((e) => _currencyCompanionFromMap(e as Map<String, dynamic>))
      .toList();

  return iconsData;
}

AssetIconTableCompanion _currencyCompanionFromMap(Map<String, dynamic> json) =>
    AssetIconTableCompanion.insert(
      name: json['name'] as String,
      tags: json['tags'].toString(),
      categories: json['categories'].toString(),
    );

import 'package:drift/drift.dart';
import 'package:flutter/material.dart';
import 'package:uuid/v7.dart';

import 'db/local_db.dart';
import 'extensions/build_context_extensions.dart';

const _uuid = UuidV7();

class AppIconData {
  final String id;
  final IconData iconData;
  final Color? iconColor;
  final Color? backgroundColor;

  AppIconData({
    required this.id,
    required int? iconColor,
    required int? backgroundColor,
    required int codePoint,
    required String? fontFamily,
    required String? fontPackage,
    required bool matchTextDirection,
    required List<String>? fontFamilyFallback,
  })  : iconColor = iconColor != null ? Color(iconColor) : null,
        backgroundColor =
            backgroundColor != null ? Color(backgroundColor) : null,
        iconData = IconData(
          codePoint,
          fontFamily: fontFamily,
          fontPackage: fontPackage,
          fontFamilyFallback: fontFamilyFallback,
          matchTextDirection: matchTextDirection,
        );

  AppIconData.create({
    required this.iconData,
    this.backgroundColor,
    this.iconColor,
    String? id,
  }) : id = id ?? _uuid.generate();

  CircleAvatar buildAvatar(BuildContext context) => CircleAvatar(
        foregroundColor: iconColor ?? context.colorScheme.onPrimaryContainer,
        backgroundColor:
            backgroundColor ?? context.colorScheme.primaryContainer,
        child: Icon(iconData),
      );

  IconTableCompanion get companion => IconTableCompanion.insert(
        id: id,
        codePoint: iconData.codePoint,
        matchTextDirection: iconData.matchTextDirection,
        fontFamily: Value(iconData.fontFamily),
        fontPackage: Value(iconData.fontPackage),
        iconColor: Value(iconColor?.value),
        backgroundColor: Value(backgroundColor?.value),
        fontFamilyFallback: Value(iconData.fontFamilyFallback),
      );
}

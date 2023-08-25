// ignore_for_file: unused_element

import 'package:drift/drift.dart' hide JsonKey;
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../db/local_db.dart';

part 'shared_models.freezed.dart';

@freezed
class IconInfo with _$IconInfo {
  const factory IconInfo({
    required String? id,
    required IconData iconData,
    required Color iconColor,
    required Color backgroundColor,
  }) = _IconInfo;

  const IconInfo._();

  factory IconInfo.fromTableData(IconTableData tableData) => IconInfo(
        id: tableData.id,
        iconColor: Color(tableData.colorValue),
        backgroundColor: Color(tableData.backgroundColorValue),
        iconData: IconData(
          tableData.codePoint,
          fontFamily: tableData.fontFamily,
          fontPackage: tableData.fontPackage,
          matchTextDirection: tableData.matchTextDirection,
        ),
      );

  CircleAvatar get avatar => CircleAvatar(
        foregroundColor: iconColor,
        backgroundColor: backgroundColor,
        child: Icon(iconData),
      );

  IconTableCompanion get companion => IconTableCompanion.insert(
        id: id == null ? const Value.absent() : Value(id!),
        codePoint: iconData.codePoint,
        matchTextDirection: iconData.matchTextDirection,
        fontFamily: Value(iconData.fontFamily),
        fontPackage: Value(iconData.fontPackage),
        colorValue: iconColor.value,
        backgroundColorValue: backgroundColor.value,
      );
}

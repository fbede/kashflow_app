import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'shared_models.freezed.dart';

@freezed
class IconInfo with _$IconInfo {
  const factory IconInfo({
    required IconData iconData,
    required Color iconColor,
    required Color backgroundColor,
  }) = _IconInfo;
}

import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'util_models.freezed.dart';
part 'util_models.g.dart';

@Freezed(genericArgumentFactories: true)
class Group<T> with _$Group<T> {
  const factory Group({
    required String groupName,
    required T object,
  }) = _Group;

  factory Group.fromObject({
    required T object,
    required String groupName,
  }) =>
      Group<T>(groupName: groupName, object: object);

  factory Group.fromJson(
    Map<String, dynamic> json,
    T Function(Object?) fromJsonT,
  ) =>
      _$GroupFromJson(json, fromJsonT);
}

@Freezed(genericArgumentFactories: true)
class DBItem<T extends Object?> with _$DBItem<T> {
  const factory DBItem({
    required String serverID,
    required bool lastModifiedByServer,
    required DateTime lastModified,
    required T item,
  }) = _DBItem;

  factory DBItem.fromJson(
    Map<String, dynamic> json,
    T Function(Object?) fromJsonT,
  ) =>
      _$DBItemFromJson(json, fromJsonT);
}

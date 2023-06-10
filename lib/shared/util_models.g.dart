// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'util_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Group<T> _$$_GroupFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
    _$_Group<T>(
      groupName: json['groupName'] as String,
      object: fromJsonT(json['object']),
    );

Map<String, dynamic> _$$_GroupToJson<T>(
  _$_Group<T> instance,
  Object? Function(T value) toJsonT,
) =>
    <String, dynamic>{
      'groupName': instance.groupName,
      'object': toJsonT(instance.object),
    };

_$_DBItem<T> _$$_DBItemFromJson<T extends Object?>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
    _$_DBItem<T>(
      serverID: json['serverID'] as String,
      lastModifiedByServer: json['lastModifiedByServer'] as bool,
      lastModified: DateTime.parse(json['lastModified'] as String),
      item: fromJsonT(json['item']),
    );

Map<String, dynamic> _$$_DBItemToJson<T extends Object?>(
  _$_DBItem<T> instance,
  Object? Function(T value) toJsonT,
) =>
    <String, dynamic>{
      'serverID': instance.serverID,
      'lastModifiedByServer': instance.lastModifiedByServer,
      'lastModified': instance.lastModified.toIso8601String(),
      'item': toJsonT(instance.item),
    };

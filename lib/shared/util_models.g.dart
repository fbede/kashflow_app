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

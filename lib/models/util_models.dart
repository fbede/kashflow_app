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
      Group<T>(
        groupName: groupName,
        object: object,
      );

  factory Group.fromJson(
          Map<String, dynamic> json, T Function(Object?) fromJsonT) =>
      _$GroupFromJson(json, fromJsonT);
}

@freezed
class BasicCurrency with _$BasicCurrency {
  const factory BasicCurrency({
    required String code,
    required String name,
    required String symbol,
  }) = _Person;

  factory BasicCurrency.fromJson(Map<String, Object?> json) =>
      _$BasicCurrencyFromJson(json);
}

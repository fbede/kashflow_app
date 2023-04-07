import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

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
  }) {
    return Group<T>(
      groupName: groupName,
      object: object,
    );
  }

  factory Group.fromJson(
          Map<String, dynamic> json, T Function(Object?) fromJsonT) =>
      _$GroupFromJson(json, fromJsonT);
}

/* class Group<T> with EquatableMixin {
  final String groupName;
  final T object;
  Group({
    required this.groupName,
    required this.object,
  });

  factory Group.fromObject({required T object, required String groupName}) {
    return Group<T>(groupName: groupName, object: object);
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [groupName, object];
} */

/* class BasicCurrency {
  String code;
  String name;
  String symbol;

  BasicCurrency({
    required this.code,
    required this.name,
    required this.symbol,
  });

  factory BasicCurrency.fromJson(Map<String, dynamic> json) {
    return BasicCurrency(
      code: json['code'],
      name: json['name'],
      symbol: json['symbol'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['code'] = code;
    data['name'] = name;
    data['symbol'] = symbol;
    return data;
  }

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [code, name, symbol];
}
 */

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

import 'package:money2/money2.dart';
import 'package:uuid/v7.dart';

import '../db/local_db.dart';

const _uuid = UuidV7();

class AppCurrency extends Currency {
  final String id;
  final bool hasBeenUsed;

  AppCurrency({
    required String id,
    required String code,
    required int scale,
    required String symbol,
    required bool invertSeparators,
    required bool hasBeenUsed,
    required String country,
    required String name,
    required String pattern,
    required String unit,
  }) : this.create(
          code,
          scale,
          id: id,
          hasBeenUsed: hasBeenUsed,
          symbol: symbol,
          country: country,
          invertSeparators: invertSeparators,
          name: name,
          pattern: pattern,
          unit: unit,
        );

  AppCurrency.create(
    super.code,
    super.scale, {
    required this.hasBeenUsed,
    String? id,
    super.symbol,
    super.country,
    super.invertSeparators,
    super.name,
    super.pattern,
    super.unit,
  })  : id = id ?? _uuid.generate(),
        super.create();

  factory AppCurrency.currencyFromJson(Map<String, Object?> json) =>
      AppCurrency.create(
        json['code']! as String,
        2,
        name: json['name']! as String,
        symbol: json['symbol']! as String,
        hasBeenUsed: false,
      );

  CurrencyTableCompanion get companion => CurrencyTableCompanion.insert(
        id: id,
        code: code,
        scale: scale,
        symbol: symbol,
        invertSeparators: invertSeparators,
        pattern: pattern,
        country: country,
        unit: unit,
        name: name,
        hasBeenUsed: hasBeenUsed,
      );

  @override
  String toString() => '$code $name $symbol';
}

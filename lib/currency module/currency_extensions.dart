import 'package:money2/money2.dart';

import '../shared/local_db.dart';

extension CurrencyUtil on Currency {
  static Currency currencyFromJson(Map<String, Object?> json) =>
      Currency.create(
        json['code']! as String,
        2,
        name: json['name']! as String,
        symbol: json['symbol']! as String,
      );

  static Currency currencyFromCurrencyTableData(CurrencyTableData data) =>
      Currency.create(
        data.code,
        data.scale,
        symbol: data.symbol,
        pattern: data.pattern,
        invertSeparators: data.invertSeparators,
        country: data.country,
        name: data.name,
        unit: data.unit,
      );

  CurrencyTableCompanion toTableCompanion() => CurrencyTableCompanion.insert(
        code: code,
        scale: scale,
        symbol: symbol,
        invertSeparators: invertSeparators,
        pattern: pattern,
        country: country,
        unit: unit,
        name: name,
      );
}

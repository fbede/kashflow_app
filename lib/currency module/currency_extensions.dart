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

extension CurrencyTableDataUtil on CurrencyTableData {
  Currency toCurrency() => Currency.create(
        code,
        scale,
        symbol: symbol,
        pattern: pattern,
        invertSeparators: invertSeparators,
        country: country,
        name: name,
        unit: unit,
      );
}

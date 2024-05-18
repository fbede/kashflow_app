import 'package:money2/money2.dart';

import '../../../core/core.dart';

extension CurrencyDataExtension on CurrencyTableData {
  Currency get currency => Currency.create(
        code,
        decimalDigits,
        symbol: symbol,
        pattern: pattern,
        groupSeparator: groupSeparator,
        decimalSeparator: decimalSeparator,
        country: country,
        name: name,
        unit: unit,
      );

  CurrencyTableCompanion get companion => CurrencyTableCompanion.insert(
        code: code,
        decimalDigits: decimalDigits,
        symbol: symbol,
        pattern: pattern,
        groupSeparator: groupSeparator,
        decimalSeparator: decimalSeparator,
        country: country,
        unit: unit,
        name: name,
      );
}

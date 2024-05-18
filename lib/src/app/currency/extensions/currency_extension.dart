import 'package:money2/money2.dart';

import '../../../core/core.dart' hide Currency;

extension CurrencyExtension on Currency {
  CurrencyCompanion get companion => CurrencyCompanion.insert(
        code: isoCode,
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

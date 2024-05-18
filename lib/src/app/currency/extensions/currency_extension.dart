import 'package:money2/money2.dart';

import '../../../core/core.dart';

extension CurrencyExtension on Currency {
  CurrencyTableCompanion get companion => CurrencyTableCompanion.insert(
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

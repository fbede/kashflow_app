import 'package:money2/money2.dart';

import '../../../core/core.dart' hide Currency;

extension CurrencyDataExtension on CurrencyData {
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
}

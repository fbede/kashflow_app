import 'package:money2/money2.dart';

extension CurrencyUtil on Currency {
  static Currency fromJson(Map<String, Object?> json) => Currency.create(
        json['code']! as String,
        2,
        name: json['name']! as String,
        symbol: json['symbol']! as String,
      );
}

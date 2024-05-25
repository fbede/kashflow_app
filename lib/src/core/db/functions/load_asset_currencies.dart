import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:money2/money2.dart';

import '../../gen/gen.dart';
import '../local_db.dart';

Future<List<CurrencyTableCompanion>> loadCurrenciesFromAsset() async {
  final String json = await rootBundle.loadString(Assets.json.loadedCurrencies);
  final data = jsonDecode(json) as List;
  final List<CurrencyTableCompanion> currenciesData = data
      .map((e) => _currencyCompanionFromMap(e as Map<String, dynamic>))
      .toList();

  return currenciesData;
}

CurrencyTableCompanion _currencyCompanionFromMap(Map<String, dynamic> map) =>
    CurrencyTableCompanion.insert(
      code: map['code']! as String,
      decimalDigits: 2,
      symbol: map['symbol']! as String,
      pattern: Currency.defaultPattern,
      groupSeparator: ',',
      decimalSeparator: '.',
      country: '',
      unit: '',
      name: map['name']! as String,
    );

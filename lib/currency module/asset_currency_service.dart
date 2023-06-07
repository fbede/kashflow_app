import 'dart:async';
import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:money2/money2.dart';

import '../gen/assets.gen.dart';
import 'currency_extensions.dart';

class AssetCurrencyService {
  Future<List<Currency>> loadPage({
    required String searchTerm,
    required int pageNumber,
    required int pageSize,
  }) async {
    final assetCurrencies = await _loadCurrenciesFromAsset();

    final currencies = <Currency>[];

    for (final element in assetCurrencies) {
      if (element.code.toLowerCase().contains(searchTerm.toLowerCase()) ||
          element.name.toLowerCase().contains(searchTerm.toLowerCase())) {
        currencies.add(element);
      }
    }

    final startRange = (pageNumber - 1) * pageSize;
    int endRange = startRange + pageSize;

    if (endRange > currencies.length) {
      endRange = currencies.length;
    }

    return currencies.getRange(startRange, endRange).toList();
  }

  static Future<List<Currency>> _loadCurrenciesFromAsset() async {
    final String json =
        await rootBundle.loadString(Assets.json.loadedCurrencies);

    final data = jsonDecode(json) as List;

    final List<Currency> currencies = data
        .map((e) => CurrencyUtil.fromJson(e as Map<String, Object?>))
        .toList();

    return currencies;
  }
}

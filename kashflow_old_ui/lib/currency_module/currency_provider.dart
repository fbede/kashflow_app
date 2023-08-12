import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:money2/money2.dart';

import '../gen/assets.gen.dart';
import '../shared/core/local_db.dart';
import 'currency_dao.dart';
import 'currency_extensions.dart';

final savedCurrencyProviderFamily =
    AutoDisposeStreamProviderFamily<List<Currency>, String>(
  (ref, searchTerm) async* {
    final dao = LocalCurrencyDao(LocalDB.instance);
    yield* dao.watchAllCurrencies(searchTerm);
  },
);

final assetCurrencyProviderFamily =
    AutoDisposeFutureProviderFamily<List<Currency>, String>(
  (ref, searchTerm) async {
    final savedCurrencies =
        ref.watch(savedCurrencyProviderFamily.call('')).value ?? [];
    final assetCurrencies = await _loadCurrenciesFromAsset();
    final tempResult = _searchCurrencyInList(searchTerm, assetCurrencies);
    final result = <Currency>[];

    for (final currency in tempResult) {
      if (!_currencyHasBeenSavedInList(currency, savedCurrencies)) {
        result.add(currency);
      }
    }

    return result;
  },
);

Future<List<Currency>> _loadCurrenciesFromAsset() async {
  final String json = await rootBundle.loadString(Assets.json.loadedCurrencies);
  final data = jsonDecode(json) as List;
  final List<Currency> currenciesData = data
      .map((e) => CurrencyUtil.currencyFromJson(e as Map<String, Object?>))
      .toList();

  return currenciesData;
}

List<Currency> _searchCurrencyInList(
  String searchTerm,
  List<Currency> currencies,
) {
  final result = <Currency>[];

  for (final currency in currencies) {
    final searchTermMatchesCurrencyCode =
        currency.code.toLowerCase().contains(searchTerm.toLowerCase());
    final searchTermMatchesCurrencyName =
        currency.name.toLowerCase().contains(searchTerm.toLowerCase());
    final searchTermMatchFound =
        searchTermMatchesCurrencyCode || searchTermMatchesCurrencyName;

    if (searchTermMatchFound) {
      result.add(currency);
    }
  }

  return result;
}

bool _currencyHasBeenSavedInList(Currency currency, List<Currency> currencies) {
  for (final savedCurrency in currencies) {
    if (savedCurrency.code == currency.code) {
      return true;
    }
  }

  return false;
}

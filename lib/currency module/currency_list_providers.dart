import 'dart:async';
import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:money2/money2.dart';

import '../gen/assets.gen.dart';
import '../shared/constants.dart';
import '../shared/shared_providers.dart';
import 'currency_dao.dart';
import 'currency_extensions.dart';

final dbCurrencyListProvider = AutoDisposeNotifierProvider<
    DBCurrencyListNotifier, ({List<Currency> currency, bool isExhausted})>(
  DBCurrencyListNotifier.new,
);

final assetCurrencyListProvider = AutoDisposeNotifierProvider<
    AssetCurrencyListNotifier, ({List<Currency> currency, bool isExhausted})>(
  AssetCurrencyListNotifier.new,
);

class DBCurrencyListNotifier
    extends AutoDisposeNotifier<({List<Currency> currency, bool isExhausted})> {
  late final LocalCurrencyDao _dbCurrencyDao;

  final _currencyList = <Currency>[];

  int _page = 1;
  bool _isExhausted = false;

  @override
  ({List<Currency> currency, bool isExhausted}) build() {
    final db = ref.watch(localDBProvider);
    _dbCurrencyDao = LocalCurrencyDao(db);
    return (currency: _currencyList, isExhausted: _isExhausted);
  }

  Future<void> loadNextPage() async {
    final currencies = await _dbCurrencyDao.fetchCurrencies(page: _page);

    if (currencies.length < defaultPageSize) {
      _isExhausted = true;
    }

    _page++;
    _currencyList.addAll(currencies);
    state = (currency: _currencyList, isExhausted: _isExhausted);
  }
}

class AssetCurrencyListNotifier
    extends AutoDisposeNotifier<({List<Currency> currency, bool isExhausted})> {
  int _page = 1;
  bool _isExhausted = false;

  final _currencyList = <Currency>[];
  final _assetCurrencies = <Currency>[];

  @override
  ({List<Currency> currency, bool isExhausted}) build() {
    unawaited(_loadCurrenciesFromAsset());
    return (currency: _currencyList, isExhausted: _isExhausted);
  }

  Future<void> loadNextPage() async {
    final startRange = (_page - 1) * defaultPageSize;
    final endRange = startRange + defaultPageSize;
    final currencies = _assetCurrencies.getRange(startRange, endRange);

    if (currencies.length < defaultPageSize) {
      _isExhausted = true;
    }

    _page++;

    for (final assetCurrency in currencies) {
      if (!_currencyHasBeenAdded(assetCurrency)) {
        _currencyList.add(assetCurrency);
      }
    }

    state = (currency: _currencyList, isExhausted: _isExhausted);
  }

  Future<void> _loadCurrenciesFromAsset() async {
    final String json =
        await rootBundle.loadString(Assets.json.loadedCurrencies);

    final data = jsonDecode(json) as List;

    final List<Currency> currencies = data
        .map((e) => CurrencyUtil.fromJson(e as Map<String, Object?>))
        .toList();

    _assetCurrencies.addAll(currencies);
  }

  bool _currencyHasBeenAdded(Currency currency) {
    final dbCurrencies = ref.watch(dbCurrencyListProvider).currency;

    for (final dbCurrency in dbCurrencies) {
      if (dbCurrency.code == currency.code) {
        return true;
      }
    }

    return false;
  }
}

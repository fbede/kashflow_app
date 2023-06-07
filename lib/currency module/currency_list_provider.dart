import 'dart:async';
import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:money2/money2.dart';

import '../gen/assets.gen.dart';
import '../shared/constants.dart';
import '../shared/shared_providers.dart';
import '../shared/user_text.dart';
import '../shared/util_models.dart';
import 'currency_dao.dart';
import 'currency_extensions.dart';

final currencyListProvider = AutoDisposeNotifierProvider<CurrencyListNotifier,
    ({List<Group<Currency>> currency, bool isExhausted})>(
  CurrencyListNotifier.new,
);

class CurrencyListNotifier extends AutoDisposeNotifier<
    ({List<Group<Currency>> currency, bool isExhausted})> {
  late final LocalCurrencyDao _dbCurrencyDao;

  int _dbPage = 1;
  int _assetPage = 1;
  bool _isExhausted = false;
  bool _dbIsExhausted = false;

  final _currencyList = <Group<Currency>>[];
  final _assetCurrencies = <Group<Currency>>[];
  final _dbCurrencies = <Group<Currency>>[];

  @override
  ({List<Group<Currency>> currency, bool isExhausted}) build() {
    final db = ref.watch(localDBProvider);
    _dbCurrencyDao = LocalCurrencyDao(db);
    unawaited(_loadCurrenciesFromAsset());
    return (currency: _currencyList, isExhausted: _isExhausted);
  }

  Future<void> loadNextPage() async {
    print('load page is caled');
    if (_dbIsExhausted) {
      await _fetchCurrenciesFromAsset();
    } else {
      await _fetchCurrenciesFromDB();
    }
  }

  Future<void> _loadCurrenciesFromAsset() async {
    final String json =
        await rootBundle.loadString(Assets.json.loadedCurrencies);

    final data = jsonDecode(json) as List;

    final List<Group<Currency>> currencies = data
        .map(
          (e) => Group.fromObject(
            object: CurrencyUtil.fromJson(e as Map<String, Object?>),
            groupName: UserText.otherCurriences,
          ),
        )
        .toList();

    _assetCurrencies.addAll(currencies);
  }

  Future<void> _fetchCurrenciesFromDB() async {
    final currencies = await _dbCurrencyDao.fetchCurrencies(page: _dbPage);

    if (currencies.length < defaultPageSize) {
      _dbIsExhausted = true;
    }

    _dbPage++;

    final groupCurrency = currencies
        .map((e) => Group(groupName: UserText.savedCurriences, object: e));

    _currencyList.addAll(groupCurrency);
    _dbCurrencies.addAll(groupCurrency);

    state = (currency: _currencyList, isExhausted: _isExhausted);
  }

  Future<void> _fetchCurrenciesFromAsset() async {
    print('asset');
    final startRange = (_assetPage - 1) * defaultPageSize;
    final endRange = startRange + defaultPageSize;
    final currencies = _assetCurrencies.getRange(startRange, endRange);

    if (currencies.length < defaultPageSize) {
      _isExhausted = true;
    }

    _assetPage++;

    for (final assetCurrency in currencies) {
      if (!_currencyHasBeenAdded(assetCurrency.object)) {
        _currencyList.add(assetCurrency);
      }
    }

    state = (currency: _currencyList, isExhausted: _isExhausted);
  }

  bool _currencyHasBeenAdded(Currency currency) {
    for (final dbCurrency in _dbCurrencies) {
      if (dbCurrency.object.code == currency.code) {
        return true;
      }
    }

    return false;
  }
}

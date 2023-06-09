import 'dart:async';
import 'dart:convert';

import 'package:flutter/services.dart';

import '../../gen/assets.gen.dart';
import '../../shared/drift_db.dart';
import '../currency_dao.dart';
import '../currency_extensions.dart';

class CurrencyPickerService {
  final currencyDao = LocalCurrencyDao(LocalDB.instance);

  List<CurrencyTableData> _assetCurrencies = [];
  List<CurrencyTableData> _savedCurrencies = [];

  Future<List<CurrencyTableData>> loadSavedCurrencies({
    String searchTerm = '',
  }) async {
    if (_savedCurrencies.isEmpty) {
      _savedCurrencies = await currencyDao.fetchAllCurrenciesData();
    }

    return _searchCurrencies(
      currencies: _savedCurrencies,
      searchTerm: searchTerm,
    );
  }

  Future<List<CurrencyTableData>> loadOtherCurrencies({
    required String searchTerm,
    required int pageNumber,
    required int pageSize,
  }) async {
    if (_assetCurrencies.isEmpty) {
      _assetCurrencies = await _loadCurrenciesFromAsset();
    }

    if (_savedCurrencies.isEmpty) {
      _savedCurrencies = await currencyDao.fetchAllCurrenciesData();
    }

    final currencies =
        _searchCurrencies(currencies: _assetCurrencies, searchTerm: searchTerm);

    final startRange = (pageNumber - 1) * pageSize;
    int endRange = startRange + pageSize;

    if (endRange > currencies.length) {
      endRange = currencies.length;
    }

    return currencies.getRange(startRange, endRange).toList();
  }

  List<CurrencyTableData> _searchCurrencies({
    required List<CurrencyTableData> currencies,
    String searchTerm = '',
  }) {
    final result = <CurrencyTableData>[];

    for (final currency in currencies) {
      final searchTermMatchesCurrencyCode =
          currency.code.toLowerCase().contains(searchTerm.toLowerCase());

      final searchTermMatchesCurrencyName =
          currency.name.toLowerCase().contains(searchTerm.toLowerCase());
      final searchTermMatchFound =
          searchTermMatchesCurrencyCode || searchTermMatchesCurrencyName;

      final currencyIsAlreadySaved = _currencyHasBeenSaved(currency);

      if (searchTermMatchFound && !currencyIsAlreadySaved) {
        result.add(currency);
      }
    }

    return result;
  }

  bool _currencyHasBeenSaved(CurrencyTableData currency) {
    for (final savedCurrency in _savedCurrencies) {
      if (savedCurrency.code == currency.code) {
        return true;
      }
    }

    return false;
  }

  Future<List<CurrencyTableData>> _loadCurrenciesFromAsset() async {
    final String json =
        await rootBundle.loadString(Assets.json.loadedCurrencies);

    final data = jsonDecode(json) as List;

    final List<CurrencyTableData> currenciesData = data.map((e) {
      final currency = CurrencyUtil.currencyFromJson(e as Map<String, Object?>);
      return CurrencyTableData(
        id: double.maxFinite.toInt(),
        code: currency.code,
        scale: currency.scale,
        symbol: currency.symbol,
        invertSeparators: false,
        pattern: currency.pattern,
        lastModifiedByServer: false,
        lastModified: DateTime.now(),
        country: currency.country,
        name: currency.name,
        unit: currency.unit,
      );
    }).toList();

    return currenciesData;
  }
}

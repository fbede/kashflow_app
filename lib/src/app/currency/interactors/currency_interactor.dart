import 'package:get_it/get_it.dart';
import 'package:money2/money2.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../core/core.dart';

import '../../../shared/shared.dart';
import '../currency.dart';

class CurrencyInteractor {
  final CurrencyDao _dao;
  final SharedPreferences _prefs;

  CurrencyInteractor({SharedPreferences? prefs, CurrencyDao? dao})
      : _dao = dao ?? CurrencyDao(LocalDB()),
        _prefs = prefs ?? GetIt.I<SharedPreferences>();

  Future<CurrencyTableData?> get defaultCurrency async {
    final currencyId = _prefs.getString(PrefKeys.defaultCurrencyId);

    if (currencyId == null) {
      return null;
    }
    return _dao.getCurrencyById(currencyId);
  }

  Future<CurrencyTableData> setDefaultCurrency(
    Either<Currency, CurrencyTableData> defaultCurrency,
  ) async {
    try {
      late final CurrencyTableData currency;

      await defaultCurrency.when(
        a: (a) async {
          currency = await _dao.saveCurrency(a);
        },
        b: (b) {
          currency = b;
        },
      );

      await _prefs.setString(PrefKeys.defaultCurrencyId, currency.id);
      return currency;
    } on Exception {
      rethrow;
    }
  }

  Stream<List<CurrencyTableData>> watchSavedCurrencies(String searchTerm) =>
      _dao.watchCurrencies(searchTerm);

  List<Currency> otherCurrencies(String searchTerm) => CommonCurrencies()
      .asList()
      .where(
        (e) =>
            e.name.contains(searchTerm) |
            e.country.contains(searchTerm) |
            e.isoCode.contains(searchTerm) |
            e.unit.contains(searchTerm),
      )
      .toList();
}

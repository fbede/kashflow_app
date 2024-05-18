import 'package:get_it/get_it.dart';
import 'package:money2/money2.dart' as money2;
import 'package:shared_preferences/shared_preferences.dart';

import '../../../core/core.dart';
import '../../../shared/keys/pref_keys.dart';
import '../currency.dart';

class LocalCurrencyInteractor {
  final LocalCurrencyDao _dao;
  final SharedPreferences _prefs;

  LocalCurrencyInteractor({SharedPreferences? prefs, LocalCurrencyDao? dao})
      : _dao = dao ?? LocalCurrencyDao(LocalDB()),
        _prefs = prefs ?? GetIt.I<SharedPreferences>();

  LocalCurrencyInteractor.test(SharedPreferences prefs, LocalCurrencyDao dao)
      : this(prefs: prefs, dao: dao);

  Future<CurrencyData?> get defaultCurrency async {
    if (DartDefine.flavor == Flavor.development) {
      await _prefs.clear();
    }

    final currencyId = _prefs.getString(PrefKeys.defaultCurrencyId);

    if (currencyId == null) {
      return null;
    }
    return _dao.getCurrencyById(currencyId);
  }

  Future<CurrencyData> setDefaultCurrency(String currencyId) async {
    try {
      final currency = await _dao.getCurrencyById(currencyId);
      await _prefs.setString(PrefKeys.defaultCurrencyId, currency.id);
      return currency;
    } on Exception {
      rethrow;
    }
  }

  Stream<List<CurrencyData>> watchSavedCurrencies(String searchTerm) =>
      _dao.watchCurrencies(searchTerm);

  List<money2.Currency> otherCurrencies(String searchTerm) =>
      money2.CommonCurrencies()
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

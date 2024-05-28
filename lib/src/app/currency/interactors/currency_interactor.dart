import '../../../core/core.dart';

import '../currency.dart';

class CurrencyInteractor {
  final CurrencyDao _dao;

  CurrencyInteractor({CurrencyDao? dao}) : _dao = dao ?? CurrencyDao(LocalDB());

  Future<CurrencyTableData?> get defaultCurrency async => _dao.defaultCurrency;

  Future<CurrencyTableData> setDefaultCurrency(
    CurrencyTableData defaultCurrency,
  ) async {
    try {
      return _dao.setDefaultCurrency(defaultCurrency);
    } on Exception {
      rethrow;
    }
  }

  Future<List<CurrencyTableData>> savedCurrencies(String searchTerm) =>
      _dao.savedCurrencies(searchTerm);
}

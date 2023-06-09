import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:money2/money2.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../shared/drift_db.dart';
import '../shared/keys.dart';

import 'currency_dao.dart';

typedef CurrencyState = ({List<Currency> currencies, Currency defaultCurrency});

final currencyProvider =
    AutoDisposeAsyncNotifierProvider<CurrencyNotifier, CurrencyState>(
  CurrencyNotifier.new,
);

class CurrencyNotifier extends AutoDisposeAsyncNotifier<CurrencyState> {
  final currencyDao = LocalCurrencyDao(DriftDB.instance);

  @override
  Future<CurrencyState> build() async {
    Currency currency = CommonCurrencies().usd;
    final prefs = await SharedPreferences.getInstance();
    final defaultCurrencyId = prefs.getInt(PrefKeys.defaultCurrencyIdKey);

    if (defaultCurrencyId != null) {
      currency = await currencyDao.fetchCurrencyByLocalId(defaultCurrencyId) ??
          CommonCurrencies().usd;
    }

    final currencies = await currencyDao.fetchAllCurrencies();
    return (currencies: currencies, defaultCurrency: currency);
  }

  Future<void> changeDefaultCurrency
}

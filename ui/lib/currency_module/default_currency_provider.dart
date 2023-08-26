import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kashflow_core/kashflow_core.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../core/keys.dart';

final defaultCurrencyProvider = AutoDisposeAsyncNotifierProvider<
    _DefaultCurrencyNotifier, CurrencyTableData>(
  _DefaultCurrencyNotifier.new,
);

class _DefaultCurrencyNotifier
    extends AutoDisposeAsyncNotifier<CurrencyTableData> {
  final dao = LocalCurrencyDao(LocalDB.instance);

  @override
  Future<CurrencyTableData> build() async {
    final prefs = await SharedPreferences.getInstance();
    final currencyId = prefs.getString(PrefKeys.defaultCurrencyId);

    if (currencyId == null) return dao.getCurrencyByCode('USD');

    return dao.getCurrencyById(currencyId);
  }

  /*  Future<void> changeDefaultCurrency(Currency currency) async {
    try {
      final code = await dao.saveCurrencyGetCode(currency);
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString(PrefKeys.defaultCurrencyId, code);
      state = AsyncValue.data(currency);
    } on Exception {
      rethrow;
    }
  } */
}

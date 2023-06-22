import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:money2/money2.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../shared/keys.dart';
import '../shared/local_db.dart';
import 'currency_dao.dart';

final defaultCurrencyProvider =
    AutoDisposeAsyncNotifierProvider<_DefaultCurrencyNotifier, Currency>(
  _DefaultCurrencyNotifier.new,
);

class _DefaultCurrencyNotifier extends AutoDisposeAsyncNotifier<Currency> {
  final dao = LocalCurrencyDao(LocalDB.instance);

  @override
  Future<Currency> build() async {
    final prefs = await SharedPreferences.getInstance();
    final currencyCode = prefs.getString(PrefKeys.defaultCurrencyId);

    if (currencyCode == null) return CommonCurrencies().usd;

    return await dao.getCurrencyById(currencyCode) ?? CommonCurrencies().usd;
  }

  Future<void> changeCurrency(Currency currency) async {
    state = await AsyncValue.guard(() async {
      final code = await dao.saveCurrencyGetCode(currency);
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString(PrefKeys.defaultCurrencyId, code);
      return currency;
    });
  }
}

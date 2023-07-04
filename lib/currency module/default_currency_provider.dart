import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kashflow/currency%20module/currency_dao.dart';
import 'package:kashflow/shared/core/keys.dart';
import 'package:kashflow/shared/core/local_db.dart';
import 'package:money2/money2.dart';
import 'package:shared_preferences/shared_preferences.dart';

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

  Future<void> changeDefaultCurrency(Currency currency) async {
    try {
      final code = await dao.saveCurrencyGetCode(currency);
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString(PrefKeys.defaultCurrencyId, code);
      state = AsyncValue.data(currency);
    } on Exception {
      rethrow;
    }
  }
}

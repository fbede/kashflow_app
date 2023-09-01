import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';
import 'package:kashflow_core/kashflow_core.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../core/keys.dart';

final otherCurrencyProviderFamily =
    AutoDisposeStreamProviderFamily<List<CurrencyTableData>, String>(
  (ref, searchTerm) async* {
    final dao = LocalCurrencyDao(LocalDB());
    yield* dao.watchOtherCurrencies(searchTerm);
  },
);

final savedCurrencyProviderFamily =
    AutoDisposeStreamProviderFamily<List<CurrencyTableData>, String>(
  (ref, searchTerm) async* {
    final dao = LocalCurrencyDao(LocalDB());
    yield* dao.watchSavedCurrencies(searchTerm);
  },
);

final defaultCurrencyProvider = AutoDisposeAsyncNotifierProvider<
    _DefaultCurrencyNotifier, CurrencyTableData>(
  _DefaultCurrencyNotifier.new,
);

class _DefaultCurrencyNotifier
    extends AutoDisposeAsyncNotifier<CurrencyTableData> {
  final dao = LocalCurrencyDao(LocalDB());
  final prefs = GetIt.I<SharedPreferences>();

  @override
  Future<CurrencyTableData> build() async {
    final currencyId = prefs.getString(PrefKeys.defaultCurrencyId);
    if (currencyId == null) return dao.getCurrencyByCode('USD');
    return dao.getCurrencyById(currencyId);
  }

/*   Future<void> _setDefaultCurrencyById(String currencyId) async {
    try {
      final currencyData = await dao.getCurrencyById(currencyId);
      await prefs.setString(PrefKeys.defaultCurrencyId, currencyData.id);
      state = AsyncValue.data(currencyData);
    } on Exception {
      rethrow;
    }
  }
 */
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

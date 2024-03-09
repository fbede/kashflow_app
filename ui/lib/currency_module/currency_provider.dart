import 'package:get_it/get_it.dart';
import 'package:kashflow_core/kashflow_core.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../shared/keys.dart';

part 'currency_provider.g.dart';

@riverpod
Stream<List<Currency>> savedCurrencies(
  SavedCurrenciesRef ref,
  String searchTerm,
) async* {
  final dao = LocalCurrencyDao(LocalDB());
  yield* dao.watchSavedCurrencies(searchTerm);
}

@riverpod
Stream<List<Currency>> otherCurrencies(
  OtherCurrenciesRef ref,
  String searchTerm,
) async* {
  final dao = LocalCurrencyDao(LocalDB());
  yield* dao.watchOtherCurrencies(searchTerm);
}

@riverpod
class DefaultCurrency extends _$DefaultCurrency {
  final _dao = LocalCurrencyDao(LocalDB());
  final _prefs = GetIt.I<SharedPreferences>();

  @override
  Future<Currency> build() async {
    final currencyId = _prefs.getString(PrefKeys.defaultCurrencyId);
    if (currencyId == null) {
      return _dao.getCurrencyByCode('USD');
    }
    return _dao.getCurrencyById(currencyId);
  }

  Future<void> setDefaultCurrency(String currencyId) async {
    try {
      final currency = await _dao.getCurrencyById(currencyId);
      await _prefs.setString(PrefKeys.defaultCurrencyId, currency.id);
      state = AsyncValue.data(currency);
    } on Exception {
      rethrow;
    }
  }
}

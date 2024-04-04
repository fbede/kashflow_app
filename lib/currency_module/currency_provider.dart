import 'package:get_it/get_it.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../shared/db/local_db.dart';
import '../shared/keys.dart';
import 'currency.dart';
import 'currency_dao.dart';

part 'currency_provider.g.dart';

@riverpod
Stream<List<AppCurrency>> savedCurrencies(
  SavedCurrenciesRef ref,
  String searchTerm,
) async* {
  final dao = LocalCurrencyDao(LocalDB());
  yield* dao.watchSavedCurrencies(searchTerm);
}

@riverpod
Stream<List<AppCurrency>> otherCurrencies(
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
  Future<AppCurrency> build() async {
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

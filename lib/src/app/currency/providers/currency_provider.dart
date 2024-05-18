import 'package:money2/money2.dart' as money2;
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/core.dart';
import '../interactors/local_currency_interactor.dart';

part 'currency_provider.g.dart';

@riverpod
Stream<List<CurrencyData>> savedCurrenciesProvider(
  SavedCurrenciesProviderRef ref,
  String searchTerm, {
  LocalCurrencyInteractor? currencyInteractor,
}) async* {
  final interactor = currencyInteractor ?? LocalCurrencyInteractor();
  yield* interactor.watchSavedCurrencies(searchTerm);
}

@riverpod
List<money2.Currency> otherCurrenciesProvider(
  OtherCurrenciesProviderRef ref,
  String searchTerm, {
  LocalCurrencyInteractor? currencyInteractor,
}) {
  final interactor = currencyInteractor ?? LocalCurrencyInteractor();
  return interactor.otherCurrencies(searchTerm);
}

@riverpod
class DefaultCurrencyProvider extends _$DefaultCurrencyProvider {
  late final LocalCurrencyInteractor _interactor;

  @override
  Future<CurrencyData?> build({LocalCurrencyInteractor? interactor}) async {
    _interactor = interactor ?? LocalCurrencyInteractor();
    return _interactor.defaultCurrency;
  }

  Future<void> setDefaultCurrency(String currencyId) async {
    try {
      state = AsyncValue.data(await _interactor.setDefaultCurrency(currencyId));
    } on Exception {
      rethrow;
    }
  }
}

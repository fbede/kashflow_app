import 'package:money2/money2.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/core.dart' hide Currency;
import '../../../shared/shared.dart';
import '../interactors/currency_interactor.dart';

part 'currency_provider.g.dart';

@riverpod
Stream<List<CurrencyData>> savedCurrenciesProvider(
  SavedCurrenciesProviderRef ref,
  String searchTerm, {
  CurrencyInteractor? currencyInteractor,
}) async* {
  final interactor = currencyInteractor ?? CurrencyInteractor();
  yield* interactor.watchSavedCurrencies(searchTerm);
}

@riverpod
List<Currency> otherCurrenciesProvider(
  OtherCurrenciesProviderRef ref,
  String searchTerm, {
  CurrencyInteractor? currencyInteractor,
}) {
  final interactor = currencyInteractor ?? CurrencyInteractor();
  return interactor.otherCurrencies(searchTerm);
}

@riverpod
class DefaultCurrencyProvider extends _$DefaultCurrencyProvider {
  final CurrencyInteractor _interactor;

  DefaultCurrencyProvider({CurrencyInteractor? interactor})
      : _interactor = interactor ?? CurrencyInteractor();

  @override
  Future<CurrencyData?> build() async => _interactor.defaultCurrency;

  Future<void> setDefaultCurrency(
    Either<Currency, CurrencyData> defaultCurrency,
  ) async {
    try {
      final currecyData = await _interactor.setDefaultCurrency(defaultCurrency);
      state = AsyncValue.data(currecyData);
    } on Exception {
      rethrow;
    }
  }
}

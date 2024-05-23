import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/core.dart';
import '../interactors/currency_interactor.dart';

part 'currency_provider.g.dart';

@riverpod
Stream<List<CurrencyTableData>> currency(
  CurrencyRef ref,
  String searchTerm, {
  CurrencyInteractor? currencyInteractor,
}) async* {
  final interactor = currencyInteractor ?? CurrencyInteractor();
  yield* interactor.watchSavedCurrencies(searchTerm);
}

@riverpod
class DefaultCurrencyProvider extends _$DefaultCurrencyProvider {
  final CurrencyInteractor _interactor;

  DefaultCurrencyProvider({CurrencyInteractor? interactor})
      : _interactor = interactor ?? CurrencyInteractor();

  @override
  Future<CurrencyTableData?> build() async => _interactor.defaultCurrency;

  Future<void> setDefaultCurrency(CurrencyTableData defaultCurrency) async {
    try {
      final currecyData = await _interactor.setDefaultCurrency(defaultCurrency);
      state = AsyncValue.data(currecyData);
    } on Exception {
      rethrow;
    }
  }
}

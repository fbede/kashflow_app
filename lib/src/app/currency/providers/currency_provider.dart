import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/core.dart';
import '../interactors/currency_interactor.dart';

part 'currency_provider.g.dart';

@riverpod
Future<List<CurrencyTableData>> currency(
  CurrencyRef ref,
  String searchTerm,
) async {
  final interactor = CurrencyInteractor();
  return interactor.savedCurrencies(searchTerm);
}

@riverpod
Future<(CurrencyTableData?, List<CurrencyTableData>)> defaultCurrencyScreen(
  DefaultCurrencyScreenRef ref,
  String searchTerm,
) async =>
    (
      await ref.watch(defaultCurrencyProvider.future),
      await ref.watch(currencyProvider(searchTerm).future)
    );

@riverpod
class DefaultCurrency extends _$DefaultCurrency {
  final _interactor = CurrencyInteractor();

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

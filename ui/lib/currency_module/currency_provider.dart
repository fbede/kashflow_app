import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kashflow_core/kashflow_core.dart';

final savedCurrencyProviderFamily =
    AutoDisposeStreamProviderFamily<List<CurrencyTableData>, String>(
  (ref, searchTerm) async* {
    final dao = LocalCurrencyDao(LocalDB.instance);
    yield* dao.watchAllCurrencies(searchTerm);
  },
);

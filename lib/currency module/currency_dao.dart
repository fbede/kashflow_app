import 'package:drift/drift.dart';
import 'package:money2/money2.dart';

import '../shared/drift_db.dart';
import '../shared/log_handler.dart';
import 'currency_extensions.dart';

part 'currency_dao.g.dart';

@DriftAccessor(tables: [CurrencyTable])
class LocalCurrencyDao extends DatabaseAccessor<DriftDB>
    with _$LocalCurrencyDaoMixin {
  LocalCurrencyDao(super.attachedDatabase);

  Future<List<Currency>> fetchAllCurrencies() async {
    final result = await fetchAllCurrenciesData();
    return result.map(CurrencyUtil.currencyFromCurrencyTableData).toList();
  }

  Future<List<CurrencyTableData>> fetchAllCurrenciesData() async {
    try {
      return await select(currencyTable).get();
    } on Exception catch (e, s) {
      Logger.instance.handle(e, s);
      rethrow;
    }
  }

  Future<Currency?> fetchCurrencyByLocalId(int id) async {
    final query = select(currencyTable)..where((tbl) => tbl.id.equals(id));
    final result = await query.getSingleOrNull();

    if (result != null) {
      return CurrencyUtil.currencyFromCurrencyTableData(result);
    }

    return null;
  }
}

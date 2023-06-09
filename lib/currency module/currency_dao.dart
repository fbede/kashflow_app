import 'package:drift/drift.dart';
import 'package:money2/money2.dart';

import '../shared/drift_db.dart';
import '../shared/log_handler.dart';
import 'currency_extensions.dart';

part 'currency_dao.g.dart';

@DriftAccessor(tables: [CurrencyTable])
class LocalCurrencyDao extends DatabaseAccessor<LocalDB>
    with _$LocalCurrencyDaoMixin {
  LocalCurrencyDao(super.attachedDatabase);

  //READ METHODS
  Stream<List<Currency>> watchAllCurrencies([String searchTerm = '']) async* {
    final query = select(currencyTable)
      ..where(
        (tbl) => tbl.code.contains(searchTerm) | tbl.name.contains(searchTerm),
      );

    yield* query.watch().map(
          (event) =>
              event.map(CurrencyUtil.currencyFromCurrencyTableData).toList(),
        );
  }

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

    try {
      final result = await query.getSingleOrNull();
      if (result != null) {
        return CurrencyUtil.currencyFromCurrencyTableData(result);
      }
      return null;
    } on Exception catch (e, s) {
      Logger.instance.handle(e, s);
      rethrow;
    }
  }

  //CREATE/UPDATE METHODS
  Future<Currency> saveCurrencyByData(CurrencyTableData data) async {
    try {
      final primaryKey = await into(currencyTable).insertOnConflictUpdate(data);
      final currency = await fetchCurrencyByLocalId(primaryKey);
      return currency!;
    } on Exception catch (e, s) {
      Logger.instance.handle(e, s);
      rethrow;
    }
  }
}

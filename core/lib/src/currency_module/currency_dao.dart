import 'package:drift/drift.dart';

import '../db/local_db.dart';
import '../logger/log_handler.dart';

part 'currency_dao.g.dart';

@DriftAccessor(tables: [CurrencyTable])
class LocalCurrencyDao extends DatabaseAccessor<LocalDB>
    with _$LocalCurrencyDaoMixin {
  LocalCurrencyDao(super.attachedDatabase);

  //READ METHODS
  Stream<List<CurrencyTableData>> watchAllCurrencies([
    String searchTerm = '',
  ]) async* {
    try {
      final query = select(currencyTable)
        ..where(
          (tbl) =>
              tbl.code.contains(searchTerm) | tbl.name.contains(searchTerm),
        );

      yield* query.watch();
    } on Exception catch (e, s) {
      Logger.instance.handle(e, s);
      rethrow;
    }
  }

  Future<CurrencyTableData> getCurrencyById(String id) async {
    final query = select(currencyTable)..where((tbl) => tbl.id.equals(id));

    try {
      return await query.getSingle();
    } on Exception catch (e, s) {
      Logger.instance.handle(e, s);
      rethrow;
    }
  }

  Future<CurrencyTableData> getCurrencyByCode(String code) async {
    final query = select(currencyTable)..where((tbl) => tbl.code.equals(code));

    try {
      return await query.getSingle();
    } on Exception catch (e, s) {
      Logger.instance.handle(e, s);
      rethrow;
    }
  }

  //CREATE/UPDATE METHODS
/*   Future<String> saveCurrencyGetCode(Currency c) async {
    try {
      final result = await into(currencyTable).insertReturning(
        c.companion,
        onConflict: DoNothing(),
      );

      return result.code;
    } on Exception catch (e, s) {
      Logger.instance.handle(e, s);
      rethrow;
    }
  } */
}

import 'package:drift/drift.dart';

import '../db/local_db.dart';
import '../logger/log_handler.dart';

part 'currency_dao.g.dart';

@DriftAccessor(tables: [CurrencyTable])
class LocalCurrencyDao extends DatabaseAccessor<LocalDB>
    with _$LocalCurrencyDaoMixin {
  LocalCurrencyDao(super.attachedDatabase);

  //READ METHODS
  Stream<List<CurrencyTableData>> watchSavedCurrencies([
    String searchTerm = '',
  ]) =>
      _watchCurrencies(hasBeenUsed: true);

  Stream<List<CurrencyTableData>> watchOtherCurrencies([
    String searchTerm = '',
  ]) =>
      _watchCurrencies(hasBeenUsed: false);

  Stream<List<CurrencyTableData>> _watchCurrencies({
    required bool hasBeenUsed,
    String searchTerm = '',
  }) async* {
    try {
      final query = select(currencyTable)
        ..where(
          (tbl) =>
              (tbl.code.contains(searchTerm) | tbl.name.contains(searchTerm)) &
              tbl.hasBeenUsed.equals(hasBeenUsed),
        );

      yield* query.watch();
    } on Exception catch (e, s) {
      logger.handle(e, s);
      rethrow;
    }
  }

  Future<CurrencyTableData> getCurrencyById(String id) async {
    final query = select(currencyTable)..where((tbl) => tbl.id.equals(id));

    try {
      return await query.getSingle();
    } on Exception catch (e, s) {
      logger.handle(e, s);
      rethrow;
    }
  }

  Future<CurrencyTableData> getCurrencyByCode(String code) async {
    final query = select(currencyTable)..where((tbl) => tbl.code.equals(code));

    try {
      return await query.getSingle();
    } on Exception catch (e, s) {
      logger.handle(e, s);
      rethrow;
    }
  }
}

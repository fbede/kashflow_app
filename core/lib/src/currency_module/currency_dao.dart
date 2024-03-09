import 'package:drift/drift.dart';

import '../db/local_db.dart';
import '../logger/log_handler.dart';
import 'currency.dart';

part 'currency_dao.g.dart';

final logger = Logger.I;

@DriftAccessor(tables: [CurrencyTable])
class LocalCurrencyDao extends DatabaseAccessor<LocalDB>
    with _$LocalCurrencyDaoMixin {
  LocalCurrencyDao(super.attachedDatabase);

  //READ METHODS
  Stream<List<Currency>> watchSavedCurrencies([
    String searchTerm = '',
  ]) =>
      _watchCurrencies(searchTerm, hasBeenUsed: true);

  Stream<List<Currency>> watchOtherCurrencies([
    String searchTerm = '',
  ]) =>
      _watchCurrencies(searchTerm, hasBeenUsed: false);

  Stream<List<Currency>> _watchCurrencies(
    String searchTerm, {
    required bool hasBeenUsed,
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

  Future<Currency> getCurrencyById(String id) async {
    final query = select(currencyTable)..where((tbl) => tbl.id.equals(id));
    try {
      return await query.getSingle();
    } on Exception catch (e, s) {
      logger.handle(e, s);
      rethrow;
    }
  }

  Future<Currency> getCurrencyByCode(String code) async {
    final query = select(currencyTable)..where((tbl) => tbl.code.equals(code));
    try {
      return await query.getSingle();
    } on Exception catch (e, s) {
      logger.handle(e, s);
      rethrow;
    }
  }
}

import 'package:drift/drift.dart';

import '../shared/db/local_db.dart';
import '../shared/logger/log_handler.dart';
import 'currency.dart';

part 'currency_dao.g.dart';

@DriftAccessor(tables: [CurrencyTable])
class LocalCurrencyDao extends DatabaseAccessor<LocalDB>
    with _$LocalCurrencyDaoMixin {
  LocalCurrencyDao(super.attachedDatabase);

  //READ METHODS
  Stream<List<AppCurrency>> watchSavedCurrencies([
    String searchTerm = '',
  ]) =>
      _watchCurrencies(searchTerm, hasBeenUsed: true);

  Stream<List<AppCurrency>> watchOtherCurrencies([
    String searchTerm = '',
  ]) =>
      _watchCurrencies(searchTerm, hasBeenUsed: false);

  Stream<List<AppCurrency>> _watchCurrencies(
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
      talker.handle(e, s);
      rethrow;
    }
  }

  Future<AppCurrency> getCurrencyById(String id) async {
    final query = select(currencyTable)..where((tbl) => tbl.id.equals(id));
    try {
      return await query.getSingle();
    } on Exception catch (e, s) {
      talker.handle(e, s);
      rethrow;
    }
  }

  Future<AppCurrency> getCurrencyByCode(String code) async {
    final query = select(currencyTable)..where((tbl) => tbl.code.equals(code));
    try {
      return await query.getSingle();
    } on Exception catch (e, s) {
      talker.handle(e, s);
      rethrow;
    }
  }
}

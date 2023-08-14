import 'package:drift/drift.dart';
import 'package:money2/money2.dart';

import '../db/local_db.dart';
//import '../shared/core/log_handler.dart';
import 'currency_extensions.dart';

part 'currency_dao.g.dart';

@DriftAccessor(tables: [CurrencyTable])
class LocalCurrencyDao extends DatabaseAccessor<LocalDB>
    with _$LocalCurrencyDaoMixin {
  LocalCurrencyDao(super.attachedDatabase);

  //READ METHODS
  Stream<List<Currency>> watchAllCurrencies([String searchTerm = '']) async* {
    try {
      final query = select(currencyTable)
        ..where(
          (tbl) =>
              tbl.code.contains(searchTerm) | tbl.name.contains(searchTerm),
        );

      yield* query.watch().map(
            (event) => event.map((e) => e.currency).toList(),
          );
    } on Exception catch (e, s) {
      //    Logger.instance.handle(e, s);
      rethrow;
    }
  }

  Future<Currency?> getCurrencyById(String code) async {
    final query = select(currencyTable)..where((tbl) => tbl.code.equals(code));

    try {
      final result = await query.getSingleOrNull();
      if (result != null) {
        return result.currency;
      }
      return null;
    } on Exception catch (e, s) {
      //  Logger.instance.handle(e, s);
      rethrow;
    }
  }

  //CREATE/UPDATE METHODS
  Future<String> saveCurrencyGetCode(Currency c) async {
    try {
      final result = await into(currencyTable).insertReturning(
        c.companion,
        onConflict: DoNothing(),
      );

      return result.code;
    } on Exception catch (e, s) {
      //Logger.instance.handle(e, s);
      rethrow;
    }
  }
}

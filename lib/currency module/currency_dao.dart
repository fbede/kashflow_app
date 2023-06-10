import 'package:drift/drift.dart';
import 'package:money2/money2.dart';

import '../shared/local_db.dart';
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

    try {
      yield* query.watch().map(
            (event) =>
                event.map(CurrencyUtil.currencyFromCurrencyTableData).toList(),
          );
    } on Exception catch (e, s) {
      Logger.instance.handle(e, s);
      rethrow;
    }
  }

  Future<Currency?> getCurrencyById(int id) async {
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
  Future<int> saveCurrencyGetId(Currency c) async {
    try {
      final result = await into(currencyTable).insertReturning(
        CurrencyTableCompanion.insert(
          code: c.code,
          scale: c.scale,
          symbol: c.symbol,
          invertSeparators: c.invertSeparators,
          pattern: c.pattern,
          country: c.country,
          unit: c.unit,
          name: c.name,
        ),
        onConflict: DoNothing(),
      );

      return result.id;
    } on Exception catch (e, s) {
      Logger.instance.handle(e, s);
      rethrow;
    }
  }
}

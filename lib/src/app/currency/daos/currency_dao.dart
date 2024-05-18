import 'package:drift/drift.dart';
import 'package:money2/money2.dart' as money2;

import '../../../core/core.dart';
import '../extensions/currency_extension.dart';

part 'currency_dao.g.dart';

//TODO: Clear comments

@DriftAccessor(tables: [Currency])
class CurrencyDao extends DatabaseAccessor<LocalDB> with _$CurrencyDaoMixin {
  CurrencyDao(super.attachedDatabase);

  Stream<List<CurrencyData>> watchCurrencies(String searchTerm) async* {
    try {
      yield* super
          .attachedDatabase
          .managers
          .currency
          .filter(
            (e) =>
                e.name.contains(searchTerm) |
                e.country.contains(searchTerm) |
                e.code.contains(searchTerm) |
                e.unit.contains(searchTerm),
          )
          .watch();
      // final query = select(currency)
      //   ..where(
      //     (tbl) =>
      //         (tbl.code.contains(searchTerm) | tbl.name.contains(searchTerm)),
      //   );

      // yield* query.watch();
    } on Exception catch (e, s) {
      talker.handle(e, s);
      rethrow;
    }
  }

  Future<CurrencyData> getCurrencyById(String id) async {
    //  final query = select(currency)..where((tbl) => tbl.id.equals(id));
    try {
      return await super
          .attachedDatabase
          .managers
          .currency
          .filter((f) => f.id.equals(id))
          .getSingle();
    } on Exception catch (e, s) {
      talker.handle(e, s);
      rethrow;
    }
  }

  Future<CurrencyData> saveCurrency(money2.Currency currency) async {
    try {
      return await super
          .attachedDatabase
          .managers
          .currency
          .createReturning((o) => currency.companion);
    } on Exception catch (e, s) {
      talker.handle(e, s);
      rethrow;
    }
  }
}

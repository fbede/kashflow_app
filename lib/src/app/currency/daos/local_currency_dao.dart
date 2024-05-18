import 'package:drift/drift.dart';

import '../../../core/core.dart';

part 'local_currency_dao.g.dart';

//TODO: Clear comments

@DriftAccessor(tables: [Currency])
class LocalCurrencyDao extends DatabaseAccessor<LocalDB>
    with _$LocalCurrencyDaoMixin {
  LocalCurrencyDao(super.attachedDatabase);

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
}

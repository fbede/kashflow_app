import 'package:drift/drift.dart';

import '../../../core/core.dart';

part 'currency_dao.g.dart';

@DriftAccessor(tables: [CurrencyTable])
class CurrencyDao extends DatabaseAccessor<LocalDB> with _$CurrencyDaoMixin {
  CurrencyDao(super.attachedDatabase);

  Stream<List<CurrencyTableData>> watchCurrencies(String searchTerm) async* {
    try {
      yield* super
          .attachedDatabase
          .managers
          .currencyTable
          .filter(
            (e) =>
                e.name.contains(searchTerm) |
                e.country.contains(searchTerm) |
                e.code.contains(searchTerm) |
                e.unit.contains(searchTerm),
          )
          .watch();
    } on Exception catch (e, s) {
      talker.handle(e, s);
      rethrow;
    }
  }

  Future<CurrencyTableData?> get defaultCurrency async {
    try {
      return await super
          .attachedDatabase
          .managers
          .currencyTable
          .filter((f) => f.isDefault.equals(true))
          .getSingleOrNull();
    } on Exception catch (e, s) {
      talker.handle(e, s);
      rethrow;
    }
  }

  Future<CurrencyTableData> setDefaultCurrency(
    CurrencyTableData currency,
  ) async {
    try {
      return await transaction(() async {
        final currencyManager = super.attachedDatabase.managers.currencyTable;

        final currentDefaultCurrency = await currencyManager
            .filter((f) => f.isDefault.equals(true))
            .getSingleOrNull();

        if (currentDefaultCurrency != null) {
          await currencyManager
              .replace(currentDefaultCurrency.copyWith(isDefault: false));
        }

        await currencyManager
            .replace(currency.copyWith(isDefault: true, hasBeenUsed: true));

        return currencyManager
            .filter((f) => f.isDefault.equals(true))
            .getSingle();
      });
    } on Exception catch (e, s) {
      talker.handle(e, s);
      rethrow;
    }
  }
}

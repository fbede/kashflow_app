import 'package:drift/drift.dart';
import 'package:kashflow/db/drift_db.dart';
import 'package:money2/money2.dart';

part 'currency_dao.g.dart';

@DriftAccessor(tables: [DBCurrency])
class CurrencyDao extends DatabaseAccessor<DriftDB> with _$CurrencyDaoMixin {
  CurrencyDao(DriftDB db) : super(db);

  Future<void> saveCurrency({
    required Currency currency,
    bool isDefault = false,
  }) {
    //Default Currencies are not synced

    if (isDefault) {
      return into(dBCurrency).insertOnConflictUpdate(
        DBCurrencyData(
          code: currency.code,
          scale: currency.scale,
          symbol: currency.symbol,
          pattern: currency.pattern,
          invertSeparators: currency.invertSeparators,
          isDefault: isDefault,
          lastModifiedByServer: false,
          country: currency.country,
          unit: currency.unit,
          name: currency.name,
        ),
      );
    } else {
      return into(dBCurrency).insert(
        DBCurrencyData(
          code: currency.code,
          scale: currency.scale,
          symbol: currency.symbol,
          pattern: currency.pattern,
          invertSeparators: currency.invertSeparators,
          isDefault: isDefault,
          lastModifiedByServer: false,
          country: currency.country,
          unit: currency.unit,
          name: currency.name,
        ),
        onConflict: throw 'This currency already exists',
      );
    }
  }
}

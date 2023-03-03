import 'package:drift/drift.dart';
import 'package:kashflow/db/drift_db.dart';

part 'currency_dao.g.dart';

@DriftAccessor(tables: [UserCurrency, PreloadedCurrency])
class CurrencyDao extends DatabaseAccessor<DriftDB> with _$CurrencyDaoMixin {
  CurrencyDao(DriftDB db) : super(db);

  Future<List<PreloadedCurrencyData>> get allCurrencies =>
      select(preloadedCurrency).get();
}

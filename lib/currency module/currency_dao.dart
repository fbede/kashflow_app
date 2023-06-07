import 'package:drift/drift.dart';
import 'package:money2/money2.dart';
import 'package:talker_flutter/talker_flutter.dart';

import '../shared/constants.dart';
import '../shared/drift_db.dart';
import '../shared/log_handler.dart';

part 'currency_dao.g.dart';

@DriftAccessor(tables: [CurrencyTable])
class LocalCurrencyDao extends DatabaseAccessor<DriftDB>
    with _$LocalCurrencyDaoMixin {
  LocalCurrencyDao(super.attachedDatabase);

  Future<List<Currency>> fetchCurrencies({
    int page = 1,
    int pageSize = defaultPageSize,
  }) async {
    final pageIndex = page;
    final query = select(currencyTable)
      ..where((tbl) => tbl.id.isSmallerOrEqualValue(pageIndex * pageSize))
      ..limit(pageSize);

    try {
      final result = await query.get();

      return result
          .map(
            (e) => Currency.create(
              e.code,
              e.scale,
              symbol: e.symbol,
              pattern: e.pattern,
              invertSeparators: e.invertSeparators,
              country: e.country ?? '',
              name: e.name ?? '',
              unit: e.unit ?? '',
            ),
          )
          .toList();
    } on Exception catch (e, s) {
      LogHandler().onException(TalkerException(e, stackTrace: s));
      rethrow;
    }
  }
}

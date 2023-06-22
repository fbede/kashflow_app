import 'package:drift/drift.dart';

import '../currency module/currency_extensions.dart';
import '../shared/local_db.dart';
import '../shared/log_handler.dart';
import 'account_models.dart';

part 'account_dao.g.dart';

@DriftAccessor(tables: [Accounts, CurrencyTable])
class LocalAccountsDao extends DatabaseAccessor<LocalDB>
    with _$LocalAccountsDaoMixin {
  LocalAccountsDao(super.attachedDatabase);

  Stream<List<TypedResult>> watchAllAccounts() async* {
    try {
      yield* select(accounts).join([crossJoin(currencyTable)]).watch();
    } on Exception catch (e, s) {
      Logger.instance.handle(e, s);
      rethrow;
    }
  }

  Future<void> createNewAccount(AccountInfo accountInfo) async {
    try {
      final currency = accountInfo.openingBalance.currency;

      await transaction(() async {
        await into(currencyTable).insert(
          currency.toTableCompanion(),
          onConflict: DoNothing(),
        );

        await into(accounts).insert(accountInfo.toTableCompanion());
      });
    } on Exception catch (e, s) {
      Logger.instance.handle(e, s);
      rethrow;
    }
  }
}

import 'package:drift/drift.dart';
import 'package:money2/money2.dart';

import '../currency_module/currency_extensions.dart';
import '../db/local_db.dart';
import '../logger/log_handler.dart';
import '../models/shared_models.dart';
import 'account_models.dart';

part 'account_dao.g.dart';

@DriftAccessor(tables: [Accounts, CurrencyTable])
class LocalAccountsDao extends DatabaseAccessor<LocalDB>
    with _$LocalAccountsDaoMixin {
  LocalAccountsDao(super.attachedDatabase);

  Stream<List<AccountInfo>> watchAllAccounts() async* {
    try {
      final stream = select(accounts).join([crossJoin(currencyTable)]).watch();

      await for (final List<TypedResult> event in stream) {
        event.forEach((element) {
          print(element.rawData.data);
        });
        yield event.map<AccountInfo>((e) {
          final currency = e.readTable(currencyTable).currency;
          final amount = e.read(accounts.openingBalance)!;
          final money = Money.fromBigIntWithCurrency(amount, currency);
          final iconTableData = e.readTable(iconTable);

          return AccountInfo(
            id: e.read(accounts.id),
            name: e.read(accounts.name)!,
            openingBalance: money,
            iconInfo: IconInfo.fromTableData(iconTableData),
          );
        }).toList();
      }
    } on Exception catch (e, s) {
      Logger.instance.handle(e, s);
      rethrow;
    }
  }

  Future<void> createNewAccount(AccountInfo accountInfo) async {
    final currency = accountInfo.openingBalance.currency;

    await transaction(() async {
      await into(currencyTable)
          .insert(currency.companion, onConflict: DoNothing());

      await into(accounts).insert(accountInfo.companion);
    });
  }

  Future<void> updateAccount(AccountInfo accountInfo) async {
    try {
      final currency = accountInfo.openingBalance.currency;

      await transaction(() async {
        await into(currencyTable)
            .insert(currency.companion, onConflict: DoNothing());

        await update(accounts).replace(accountInfo.companion);
      });
    } on Exception catch (e, s) {
      Logger.instance.handle(e, s);
      rethrow;
    }
  }

  Future<void> deleteAccount(String name) async {
    try {
      final query = delete(accounts)..where((tbl) => tbl.name.equals(name));

      await query.go();
    } on Exception {
      rethrow;
    }
  }
}

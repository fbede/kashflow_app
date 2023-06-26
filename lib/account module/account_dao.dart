import 'package:drift/drift.dart';
import 'package:flutter/material.dart';
import 'package:money2/money2.dart';

import '../currency module/currency_extensions.dart';
import '../shared/local_db.dart';
import '../shared/log_handler.dart';
import '../shared/models/shared_models.dart';
import 'account_models.dart';

part 'account_dao.g.dart';
part 'account_dao.helper.dart';

@DriftAccessor(tables: [Accounts, CurrencyTable])
class LocalAccountsDao extends DatabaseAccessor<LocalDB>
    with _$LocalAccountsDaoMixin {
  LocalAccountsDao(super.attachedDatabase);

  Stream<List<AccountInfo>> watchAllAccounts() async* {
    try {
      final stream = select(accounts).join([crossJoin(currencyTable)]).watch();

      await for (final List<TypedResult> event in stream) {
        yield event.map<AccountInfo>((e) {
          final money = _getMoneyFromResult(
            result: e,
            accountsTable: accounts,
            currencyTable: currencyTable,
          );

          final iconInfo =
              _getIconInfoFromResult(result: e, accountsTable: accounts);

          return AccountInfo(
            id: e.read(accounts.id),
            name: e.read(accounts.name)!,
            openingBalance: money,
            iconInfo: iconInfo,
          );
        }).toList();
      }
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

  Future<void> deleteAccount(int id) async {
    try {
      final query = delete(accounts)..where((tbl) => tbl.id.equals(id));

      await query.go();
    } on Exception catch (e, s) {
      Logger.instance.handle(e, s);
      rethrow;
    }
  }
}
